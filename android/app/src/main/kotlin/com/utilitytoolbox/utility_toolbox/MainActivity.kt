package com.utilitytoolbox.smarttools

import android.content.ContentValues
import android.content.Context
import android.os.Build
import android.os.Environment
import android.provider.MediaStore
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.io.FileOutputStream

/// Writes files to the device's public Downloads folder via MediaStore and
/// returns a content:// URI other apps (PDF viewers, etc.) can open.
///
/// This exists because the `file_saver` plugin's saveFile() only writes to
/// the app's *private* external files dir (getExternalFilesDir), which no
/// other app can read — so a "tap notification to open the file" flow can
/// never work with it. This channel does a real MediaStore.Downloads insert
/// instead, which returns a properly shareable content Uri.
class MainActivity : FlutterActivity() {
    private val CHANNEL = "utility_toolbox/downloads"
    private val WIDGET_CHANNEL = "utility_toolbox/widgets"
    private val WIDGET_PREFS_NAME = "world_clock_widget_prefs"
    private val WIDGET_PREFS_KEY_CITIES = "cities_json"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "saveToDownloads" -> {
                    try {
                        val fileName = call.argument<String>("fileName")!!
                        val bytes = call.argument<ByteArray>("bytes")!!
                        val mimeType = call.argument<String>("mimeType") ?: "application/octet-stream"
                        val uri = saveToDownloads(fileName, bytes, mimeType)
                        result.success(uri)
                    } catch (e: Exception) {
                        result.error("SAVE_FAILED", e.message, null)
                    }
                }
                else -> result.notImplemented()
            }
        }

        // Called whenever the user pins/unpins a city in the World Clock
        // screen, so the home-screen widget reflects the change immediately
        // instead of waiting for Android's next periodic widget update.
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, WIDGET_CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "updateWorldClockWidget" -> {
                    try {
                        val citiesJson = call.argument<String>("citiesJson") ?: "[]"
                        getSharedPreferences(WIDGET_PREFS_NAME, Context.MODE_PRIVATE)
                            .edit()
                            .putString(WIDGET_PREFS_KEY_CITIES, citiesJson)
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
    }

    private fun saveToDownloads(fileName: String, bytes: ByteArray, mimeType: String): String {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            val resolver = contentResolver
            val values = ContentValues().apply {
                put(MediaStore.Downloads.DISPLAY_NAME, fileName)
                put(MediaStore.Downloads.MIME_TYPE, mimeType)
                put(MediaStore.Downloads.RELATIVE_PATH, Environment.DIRECTORY_DOWNLOADS)
                put(MediaStore.Downloads.IS_PENDING, 1)
            }
            val uri = resolver.insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI, values)
                ?: throw IllegalStateException("MediaStore insert returned null")
            resolver.openOutputStream(uri)?.use { it.write(bytes) }
                ?: throw IllegalStateException("Could not open output stream for $uri")
            values.clear()
            values.put(MediaStore.Downloads.IS_PENDING, 0)
            resolver.update(uri, values, null, null)
            return uri.toString()
        } else {
            // Pre-Android 10: write directly into the public Downloads dir.
            val downloadsDir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS)
            if (!downloadsDir.exists()) downloadsDir.mkdirs()
            val file = File(downloadsDir, fileName)
            FileOutputStream(file).use { it.write(bytes) }
            return androidx.core.content.FileProvider.getUriForFile(
                this, "$packageName.fileprovider", file
            ).toString()
        }
    }
}