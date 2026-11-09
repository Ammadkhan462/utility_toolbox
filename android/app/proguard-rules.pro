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

# FFmpeg Kit
-keep class com.arthenica.ffmpegkit.** { *; }
-dontwarn com.arthenica.ffmpegkit.**

# Google ML Kit
-keep class com.google.mlkit.** { *; }
-dontwarn com.google.mlkit.**
-keep class com.google.mlkit.vision.text.chinese.** { *; }
-keep class com.google.mlkit.vision.text.devanagari.** { *; }
-keep class com.google.mlkit.vision.text.japanese.** { *; }
-keep class com.google.mlkit.vision.text.korean.** { *; }

# General rules
-dontwarn **
-keepattributes *Annotation*
-keepattributes SourceFile,LineNumberTable