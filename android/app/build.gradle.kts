import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")

if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "com.utilitytoolbox.smarttools"
    compileSdk = 36
    ndkVersion = "28.2.13676358"

    compileOptions {
        isCoreLibraryDesugaringEnabled = true

        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    defaultConfig {
        applicationId = "com.utilitytoolbox.smarttools"
        minSdk = 24
        targetSdk = 36
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    aaptOptions {
        noCompress.add("tflite")
    }

    signingConfigs {
        // Only define the real release config when key.properties exists
        // (it is git-ignored). CI and worktrees fall back to debug signing
        // below so `flutter build appbundle --release` still works there.
        if (keystorePropertiesFile.exists()) create("release") {
            keyAlias = keystoreProperties.getProperty("keyAlias")
            keyPassword = keystoreProperties.getProperty("keyPassword")
            storeFile = keystoreProperties
                .getProperty("storeFile")
                ?.let { file(it) }
            storePassword = keystoreProperties.getProperty("storePassword")
        }
    }

    buildTypes {
        release {
            signingConfig = if (keystorePropertiesFile.exists()) {
                signingConfigs.getByName("release")
            } else {
                signingConfigs.getByName("debug")
            }

            // R8: shrinks/optimises the dex and strips unused resources.
            // Keep rules for reflection/JNI users live in proguard-rules.pro.
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro",
            )
        }
    }
}

flutter {
    source = "../.."
}

// ML Kit text recognition: use the Google Play services ("unbundled") models
// instead of the bundled ones the Flutter plugin pulls in. Same API, but the
// models are downloaded once by Play services and shared across apps, which
// takes ~4.5 MB of native code per ABI out of our download. The manifest's
// com.google.mlkit.vision.DEPENDENCIES entry asks Play to fetch them at install.
configurations.all {
    exclude(group = "com.google.mlkit", module = "text-recognition")
}

dependencies {
    coreLibraryDesugaring(
        "com.android.tools:desugar_jdk_libs:2.1.4"
    )
    implementation("com.google.android.gms:play-services-mlkit-text-recognition:19.0.1")
    // The plugin only declares the extra scripts as compileOnly; the unbundled
    // versions cost a few KB of classes each (models come from Play services).
    implementation("com.google.android.gms:play-services-mlkit-text-recognition-devanagari:16.0.1")
    implementation("com.google.android.gms:play-services-mlkit-text-recognition-chinese:16.0.1")
    implementation("com.google.android.gms:play-services-mlkit-text-recognition-japanese:16.0.1")
    implementation("com.google.android.gms:play-services-mlkit-text-recognition-korean:16.0.1")
    // Play services Ads pulls WorkManager 2.7.0 with Room 2.2.5, whose keep
    // rules don't survive R8 full mode: WorkDatabase_Impl loses its
    // constructor and the release app crashes at start-up. Use a current
    // WorkManager (and with it a current Room) instead.
    implementation("androidx.work:work-runtime:2.10.0")
}