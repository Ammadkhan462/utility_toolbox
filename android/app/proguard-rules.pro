# Flutter Engine and Plugins
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.embedding.** { *; }

# App Package Classes
-keep class com.utilitytoolbox.smarttools.** { *; }
-keep class com.utilitytoolbox.smarttools.MainActivity { *; }
-keep class com.utilitytoolbox.smarttools.WorldClockWidgetProvider { *; }

# Local Notifications
-keep class com.dexterous.flutterlocalnotifications.** { *; }

# Google Mobile Ads
-keep class com.google.android.gms.ads.** { *; }
-keep class com.google.ads.mediation.** { *; }

# In-App Purchases
-keep class com.android.billingclient.** { *; }
-keep class io.flutter.plugins.inapppurchase.** { *; }

# TensorFlow Lite
-keep class org.tensorflow.lite.** { *; }
-keep class org.tensorflow.lite.gpu.** { *; }
-keepclassmembers class org.tensorflow.lite.** { *; }
-dontwarn org.tensorflow.lite.**
-keep class com.tfliteflutter.** { *; }
-keepclassmembers class com.tfliteflutter.** { *; }

# FFmpeg Kit (ffmpeg_kit_flutter_new_audio). Its Java package is
# com.antonkarpenko.ffmpegkit (NOT the original com.arthenica.ffmpegkit);
# JNI calls back into FFmpegKitConfig, so keep it whole. The plugin also
# ships these as consumer rules; repeated here so the dependency is explicit.
-keep class com.antonkarpenko.ffmpegkit.** { *; }

# Google ML Kit
-keep class com.google.mlkit.** { *; }
-dontwarn com.google.mlkit.**
-keep class com.google.mlkit.vision.text.chinese.** { *; }
-keep class com.google.mlkit.vision.text.devanagari.** { *; }
-keep class com.google.mlkit.vision.text.japanese.** { *; }
-keep class com.google.mlkit.vision.text.korean.** { *; }

# Play Core (deferred components). The Flutter embedding references these
# classes from FlutterPlayStoreSplitApplication / PlayStoreDeferredComponentManager,
# but the app uses neither deferred components nor the Play Core library, so
# they are legitimately absent. Exactly the list R8 reported (missing_rules.txt).
-dontwarn com.google.android.play.core.splitcompat.SplitCompatApplication
-dontwarn com.google.android.play.core.splitinstall.SplitInstallException
-dontwarn com.google.android.play.core.splitinstall.SplitInstallManager
-dontwarn com.google.android.play.core.splitinstall.SplitInstallManagerFactory
-dontwarn com.google.android.play.core.splitinstall.SplitInstallRequest$Builder
-dontwarn com.google.android.play.core.splitinstall.SplitInstallRequest
-dontwarn com.google.android.play.core.splitinstall.SplitInstallSessionState
-dontwarn com.google.android.play.core.splitinstall.SplitInstallStateUpdatedListener
-dontwarn com.google.android.play.core.tasks.OnFailureListener
-dontwarn com.google.android.play.core.tasks.OnSuccessListener
-dontwarn com.google.android.play.core.tasks.Task

# Room / WorkManager: Room creates the generated *_Impl database by reflection.
# R8 full mode drops the no-arg constructor unless it is kept explicitly,
# which crashed 1.2.0 (9) at start-up in WorkManagerInitializer.
-keep class * extends androidx.room.RoomDatabase { <init>(); }
-keep class androidx.work.impl.WorkDatabase_Impl { <init>(); }

# General rules
# (No blanket `-dontwarn **`: it hid real missing-class problems. Add
# targeted -dontwarn lines only for classes R8 actually reports.)
-keepattributes *Annotation*
-keepattributes SourceFile,LineNumberTable