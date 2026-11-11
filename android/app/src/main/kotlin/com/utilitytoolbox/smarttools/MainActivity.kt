package com.utilitytoolbox.smarttools

import android.content.ActivityNotFoundException
import android.content.ContentValues
import android.content.Context
import android.content.Intent
import android.content.pm.ShortcutInfo
import android.content.pm.ShortcutManager
import android.graphics.drawable.Icon
import android.hardware.camera2.CameraCharacteristics
import android.hardware.camera2.CameraManager
import android.media.MediaScannerConnection
import android.net.Uri
import android.os.Build
import android.os.Environment
import android.os.Handler
import android.os.Looper
import android.provider.MediaStore
import android.provider.OpenableColumns
import androidx.core.content.FileProvider
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.io.FileOutputStream
import java.util.concurrent.ExecutorService
import java.util.concurrent.Executors

/// Native glue for everything Flutter plugins don't cover:
///
///  * `utility_toolbox/downloads` – MediaStore saves to the public Downloads
///    folder and Pictures/Utility Toolbox, returning content:// URIs that
///    other apps can open (file_saver only writes to the private dir).
///  * `utility_toolbox/widgets` – pushes pinned World Clock cities to the
///    home-screen widget.
///  * `utility_toolbox/system` – incoming intents (share sheet, "Open with",
///    text selection "Translate", launcher/pinned shortcuts, QS tile), pinned
///    shortcuts, and opening/sharing files from My Files.
///
/// Incoming intents are normalised into one map shape for Dart:
///   {kind: "deeplink", toolId}
///   {kind: "text", text, source: "share" | "process_text"}
///   {kind: "files", mimeType, paths: [...]}   (copied into cache/incoming)
///   {kind: "error", message}
class MainActivity : FlutterActivity() {
    private val downloadsChannelName = "utility_toolbox/downloads"
    private val widgetChannelName = "utility_toolbox/widgets"
    private val systemChannelName = "utility_toolbox/system"
    private val widgetPrefsName = "world_clock_widget_prefs"
    private val widgetPrefsKeyCities = "cities_json"

    private var systemChannel: MethodChannel? = null
    private var initialIntentConsumed = false

    // Copying shared files can take a while (large PDFs/videos); never do it
    // on the main thread.
    private val io: ExecutorService = Executors.newSingleThreadExecutor()
    private val mainHandler = Handler(Looper.getMainLooper())

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val messenger = flutterEngine.dartExecutor.binaryMessenger

        MethodChannel(messenger, downloadsChannelName).setMethodCallHandler { call, result ->
            when (call.method) {
                "saveToDownloads" -> runIo(result) {
                    val fileName = call.argument<String>("fileName")!!
                    val mimeType = call.argument<String>("mimeType") ?: "application/octet-stream"
                    saveToDownloads(fileName, payload(call.argument("bytes"), call.argument("sourcePath")), mimeType)
                }
                "saveToGallery" -> runIo(result) {
                    val fileName = call.argument<String>("fileName")!!
                    val bytes = payload(call.argument("bytes"), call.argument("sourcePath"))
                    val mimeType = call.argument<String>("mimeType") ?: "image/jpeg"
                    saveToGallery(fileName, bytes, mimeType)
                }
                else -> result.notImplemented()
            }
        }

        // Called whenever the user pins/unpins a city in the World Clock
        // screen, so the home-screen widget reflects the change immediately.
        MethodChannel(messenger, widgetChannelName).setMethodCallHandler { call, result ->
            when (call.method) {
                "updateWorldClockWidget" -> {
                    try {
                        val citiesJson = call.argument<String>("citiesJson") ?: "[]"
                        getSharedPreferences(widgetPrefsName, Context.MODE_PRIVATE)
                            .edit()
                            .putString(widgetPrefsKeyCities, citiesJson)
                            .apply()
                        WorldClockWidgetProvider.pushUpdate(applicationContext)
                        result.success(null)
                    } catch (e: Exception) {
                        result.error("WIDGET_UPDATE_FAILED", e.message, null)
                    }
                }
                else -> result.notImplemented()
            }
        }

        val system = MethodChannel(messenger, systemChannelName)
        systemChannel = system
        system.setMethodCallHandler { call, result ->
            when (call.method) {
                // Cheap check (no file copying) so main() can skip
                // onboarding when the app was opened to do a job.
                "hasInitialIntent" -> {
                    val start = intent
                    result.success(!initialIntentConsumed && start != null && isActionable(start))
                }
                // Dart asks once the UI is ready, so a cold start from the
                // share sheet is never lost.
                "getInitialIntent" -> {
                    if (initialIntentConsumed) {
                        result.success(null)
                    } else {
                        initialIntentConsumed = true
                        val start = intent
                        if (start == null || !isActionable(start)) {
                            result.success(null)
                        } else {
                            io.execute {
                                val parsed = parseIntent(start)
                                mainHandler.post { result.success(parsed) }
                            }
                        }
                    }
                }
                "pinShortcut" -> {
                    val toolId = call.argument<String>("toolId")!!
                    val label = call.argument<String>("label")!!
                    result.success(requestPinShortcut(toolId, label))
                }
                "openFile" -> {
                    val location = call.argument<String>("location")!!
                    val mimeType = call.argument<String>("mimeType") ?: "*/*"
                    result.success(openFile(location, mimeType))
                }
                "shareFile" -> {
                    val location = call.argument<String>("location")!!
                    val mimeType = call.argument<String>("mimeType") ?: "*/*"
                    result.success(shareFile(location, mimeType))
                }
                // Flashlight tool. CameraManager.setTorchMode needs no
                // CAMERA permission and works while no app holds the camera.
                "hasTorch" -> result.success(torchCameraId() != null)
                "setTorch" -> result.success(setTorch(call.argument<Boolean>("on") ?: false))
                // Screen-light mode: max brightness for this window only;
                // null restores the user's own brightness.
                "setScreenBrightness" -> {
                    val value = call.argument<Double>("value")
                    window.attributes = window.attributes.apply {
                        screenBrightness = value?.toFloat()?.coerceIn(0f, 1f)
                            ?: android.view.WindowManager.LayoutParams.BRIGHTNESS_OVERRIDE_NONE
                    }
                    result.success(true)
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun torchCameraId(): String? = try {
        val manager = getSystemService(Context.CAMERA_SERVICE) as CameraManager
        manager.cameraIdList.firstOrNull { id ->
            val c = manager.getCameraCharacteristics(id)
            c.get(CameraCharacteristics.FLASH_INFO_AVAILABLE) == true &&
                c.get(CameraCharacteristics.LENS_FACING) == CameraCharacteristics.LENS_FACING_BACK
        } ?: manager.cameraIdList.firstOrNull { id ->
            manager.getCameraCharacteristics(id).get(CameraCharacteristics.FLASH_INFO_AVAILABLE) == true
        }
    } catch (e: Exception) {
        null
    }

    private fun setTorch(on: Boolean): Boolean {
        val id = torchCameraId() ?: return false
        return try {
            (getSystemService(Context.CAMERA_SERVICE) as CameraManager).setTorchMode(id, on)
            true
        } catch (e: Exception) {
            false
        }
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        setIntent(intent)
        if (!isActionable(intent)) return
        io.execute {
            val parsed = parseIntent(intent)
            mainHandler.post { systemChannel?.invokeMethod("onIntent", parsed) }
        }
    }

    override fun onDestroy() {
        systemChannel?.setMethodCallHandler(null)
        systemChannel = null
        io.shutdown()
        super.onDestroy()
    }

    // ── Incoming intents ─────────────────────────────────────────────────

    private fun isActionable(intent: Intent): Boolean = when (intent.action) {
        Intent.ACTION_SEND, Intent.ACTION_SEND_MULTIPLE, Intent.ACTION_PROCESS_TEXT -> true
        Intent.ACTION_VIEW -> intent.data != null
        else -> false
    }

    private fun parseIntent(intent: Intent): Map<String, Any?> {
        return try {
            when (intent.action) {
                Intent.ACTION_PROCESS_TEXT -> {
                    val text = intent.getCharSequenceExtra(Intent.EXTRA_PROCESS_TEXT)?.toString()
                    mapOf("kind" to "text", "text" to (text ?: ""), "source" to "process_text")
                }
                Intent.ACTION_VIEW -> {
                    val data = intent.data!!
                    if (data.scheme == "utilitytoolbox") {
                        mapOf("kind" to "deeplink", "toolId" to data.pathSegments.firstOrNull())
                    } else {
                        filesResult(listOf(data), intent.type)
                    }
                }
                Intent.ACTION_SEND -> {
                    val stream = streamExtra(intent)
                    if (stream != null) {
                        filesResult(listOf(stream), intent.type)
                    } else {
                        val text = intent.getCharSequenceExtra(Intent.EXTRA_TEXT)?.toString()
                            ?: intent.getStringExtra(Intent.EXTRA_SUBJECT)
                            ?: ""
                        mapOf("kind" to "text", "text" to text, "source" to "share")
                    }
                }
                Intent.ACTION_SEND_MULTIPLE -> {
                    filesResult(streamListExtra(intent), intent.type)
                }
                else -> mapOf("kind" to "error", "message" to "unsupported action")
            }
        } catch (e: Exception) {
            mapOf("kind" to "error", "message" to (e.message ?: e.javaClass.simpleName))
        }
    }

    @Suppress("DEPRECATION")
    private fun streamExtra(intent: Intent): Uri? =
        if (Build.VERSION.SDK_INT >= 33) {
            intent.getParcelableExtra(Intent.EXTRA_STREAM, Uri::class.java)
        } else {
            intent.getParcelableExtra(Intent.EXTRA_STREAM) as? Uri
        }

    @Suppress("DEPRECATION")
    private fun streamListExtra(intent: Intent): List<Uri> =
        if (Build.VERSION.SDK_INT >= 33) {
            intent.getParcelableArrayListExtra(Intent.EXTRA_STREAM, Uri::class.java) ?: emptyList()
        } else {
            intent.getParcelableArrayListExtra<Uri>(Intent.EXTRA_STREAM) ?: emptyList()
        }

    private fun filesResult(uris: List<Uri>, declaredType: String?): Map<String, Any?> {
        val dir = File(cacheDir, "incoming").apply { mkdirs() }
        // Keep the cache from growing forever: drop copies older than a day.
        dir.listFiles()?.forEach {
            if (System.currentTimeMillis() - it.lastModified() > 24 * 60 * 60 * 1000L) it.delete()
        }
        val paths = mutableListOf<String>()
        var mime: String? = declaredType
        for ((index, uri) in uris.withIndex()) {
            val resolvedType = contentResolver.getType(uri)
            if (mime == null || mime == "*/*" || mime.endsWith("/*")) {
                mime = resolvedType ?: mime
            }
            val name = sanitize(displayName(uri) ?: "shared_$index")
            val target = File(dir, "${System.currentTimeMillis()}_${index}_$name")
            contentResolver.openInputStream(uri)?.use { input ->
                FileOutputStream(target).use { output -> input.copyTo(output) }
            } ?: continue
            paths.add(target.absolutePath)
        }
        if (paths.isEmpty()) return mapOf("kind" to "error", "message" to "no readable files")
        return mapOf("kind" to "files", "mimeType" to (mime ?: "application/octet-stream"), "paths" to paths)
    }

    private fun displayName(uri: Uri): String? {
        if (uri.scheme == "file") return uri.lastPathSegment
        return try {
            contentResolver.query(uri, arrayOf(OpenableColumns.DISPLAY_NAME), null, null, null)?.use {
                if (it.moveToFirst()) it.getString(0) else null
            }
        } catch (_: Exception) {
            null
        }
    }

    private fun sanitize(name: String): String =
        name.replace(Regex("[\\\\/:*?\"<>|\\x00-\\x1F]"), "_").take(120)

    // ── Shortcuts ────────────────────────────────────────────────────────

    private fun requestPinShortcut(toolId: String, label: String): Boolean {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return false
        val manager = getSystemService(ShortcutManager::class.java) ?: return false
        if (!manager.isRequestPinShortcutSupported) return false
        val launch = Intent(Intent.ACTION_VIEW, Uri.parse("utilitytoolbox://tool/$toolId"), this, MainActivity::class.java)
        val info = ShortcutInfo.Builder(this, "pinned_$toolId")
            .setShortLabel(label.take(25))
            .setLongLabel(label)
            .setIcon(Icon.createWithResource(this, R.mipmap.ic_launcher))
            .setIntent(launch)
            .build()
        return manager.requestPinShortcut(info, null)
    }

    // ── Open / share saved files ─────────────────────────────────────────

    private fun uriFor(location: String): Uri =
        if (location.startsWith("content://")) {
            Uri.parse(location)
        } else {
            FileProvider.getUriForFile(this, "$packageName.fileprovider", File(location))
        }

    private fun openFile(location: String, mimeType: String): Boolean = try {
        val view = Intent(Intent.ACTION_VIEW).apply {
            setDataAndType(uriFor(location), mimeType)
            addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION or Intent.FLAG_ACTIVITY_NEW_TASK)
        }
        startActivity(Intent.createChooser(view, null).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK))
        true
    } catch (_: ActivityNotFoundException) {
        false
    } catch (_: IllegalArgumentException) {
        false
    } catch (_: SecurityException) {
        false
    }

    private fun shareFile(location: String, mimeType: String): Boolean = try {
        val send = Intent(Intent.ACTION_SEND).apply {
            type = mimeType
            putExtra(Intent.EXTRA_STREAM, uriFor(location))
            addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
        }
        startActivity(Intent.createChooser(send, null).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK))
        true
    } catch (_: Exception) {
        false
    }

    // ── Saving ───────────────────────────────────────────────────────────

    private fun runIo(result: MethodChannel.Result, block: () -> String) {
        io.execute {
            try {
                val value = block()
                mainHandler.post { result.success(value) }
            } catch (e: Exception) {
                mainHandler.post { result.error("SAVE_FAILED", e.message, null) }
            }
        }
    }

    private fun saveToDownloads(fileName: String, bytes: Payload, mimeType: String): String {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            val values = ContentValues().apply {
                put(MediaStore.Downloads.DISPLAY_NAME, fileName)
                put(MediaStore.Downloads.MIME_TYPE, mimeType)
                put(MediaStore.Downloads.RELATIVE_PATH, Environment.DIRECTORY_DOWNLOADS)
                put(MediaStore.Downloads.IS_PENDING, 1)
            }
            return insertAndWrite(MediaStore.Downloads.EXTERNAL_CONTENT_URI, values, bytes) {
                put(MediaStore.Downloads.IS_PENDING, 0)
            }
        }
        // Android 7–9: write directly into the public Downloads dir (needs
        // WRITE_EXTERNAL_STORAGE, declared with maxSdkVersion 28).
        @Suppress("DEPRECATION")
        val dir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS)
        return writeLegacy(dir, fileName, bytes, mimeType)
    }

    private fun saveToGallery(fileName: String, bytes: Payload, mimeType: String): String {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            val values = ContentValues().apply {
                put(MediaStore.Images.Media.DISPLAY_NAME, fileName)
                put(MediaStore.Images.Media.MIME_TYPE, mimeType)
                put(MediaStore.Images.Media.RELATIVE_PATH, "${Environment.DIRECTORY_PICTURES}/Utility Toolbox")
                put(MediaStore.Images.Media.IS_PENDING, 1)
            }
            return insertAndWrite(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, values, bytes) {
                put(MediaStore.Images.Media.IS_PENDING, 0)
            }
        }
        @Suppress("DEPRECATION")
        val dir = File(
            Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES),
            "Utility Toolbox",
        )
        return writeLegacy(dir, fileName, bytes, mimeType)
    }

    private fun insertAndWrite(
        collection: Uri,
        values: ContentValues,
        bytes: Payload,
        finish: ContentValues.() -> Unit,
    ): String {
        val resolver = contentResolver
        val uri = resolver.insert(collection, values)
            ?: throw IllegalStateException("MediaStore insert returned null")
        try {
            resolver.openOutputStream(uri)?.use { bytes(it) }
                ?: throw IllegalStateException("Could not open output stream for $uri")
            values.clear()
            values.finish()
            resolver.update(uri, values, null, null)
        } catch (e: Exception) {
            resolver.delete(uri, null, null)
            throw e
        }
        return uri.toString()
    }

    private fun writeLegacy(dir: File, fileName: String, bytes: Payload, mimeType: String): String {
        if (!dir.exists()) dir.mkdirs()
        var target = File(dir, fileName)
        var n = 1
        while (target.exists()) {
            target = File(dir, "${fileName.substringBeforeLast('.')} ($n).${fileName.substringAfterLast('.', "")}")
            n++
        }
        FileOutputStream(target).use { bytes(it) }
        MediaScannerConnection.scanFile(this, arrayOf(target.absolutePath), arrayOf(mimeType), null)
        return FileProvider.getUriForFile(this, "$packageName.fileprovider", target).toString()
    }

    /// Writes either in-memory bytes or, for big files, a stream copy of a
    /// file in our own storage (avoids holding a large video in Dart memory
    /// and sending it over the platform channel).
    private fun payload(bytes: ByteArray?, sourcePath: String?): Payload = when {
        bytes != null -> { out -> out.write(bytes) }
        sourcePath != null -> { out -> File(sourcePath).inputStream().use { it.copyTo(out, 64 * 1024) } }
        else -> throw IllegalArgumentException("bytes or sourcePath required")
    }
}

private typealias Payload = (java.io.OutputStream) -> Unit
