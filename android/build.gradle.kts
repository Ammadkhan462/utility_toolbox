import org.gradle.api.file.Directory
import org.jetbrains.kotlin.gradle.dsl.JvmTarget
import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    project.evaluationDependsOn(":app")
}

// Fix: Match each Kotlin compile task's JVM target to its sibling JavaCompile task.
// Uses JvmTarget.fromTarget(string) instead of enum constants — avoids the
// JVM_1_6 / JVM_18 existence issues across Kotlin versions.
// fromTarget() accepts: "1.8", "9".."21" (and maps "1.6"/"1.8" internally).
// Falls back to "11" for anything unrecognised (e.g. "6", "7").
gradle.projectsEvaluated {
    subprojects {
        tasks.withType<KotlinCompile>().configureEach {
            val javaTaskName = name.replace("Kotlin", "JavaWithJavac")
            val javaTask = tasks.findByName(javaTaskName) as? JavaCompile
            var target = javaTask?.targetCompatibility ?: "11"
            // Normalise legacy "1.x" forms: "1.6"→"11", "1.7"→"11", "1.8"→"1.8"
            // (JvmTarget.fromTarget accepts "1.8" but not "1.6"/"1.7")
            if (target == "1.6" || target == "1.7") target = "11"
            val resolved = runCatching { JvmTarget.fromTarget(target) }
                .getOrDefault(JvmTarget.JVM_11)
            compilerOptions {
                jvmTarget.set(resolved)
            }
        }
    }
}

// Propagate compileSdk to all subprojects (required by some plugins)
subprojects {
    val configureAndroid = {
        val androidExt = extensions.findByName("android")
        if (androidExt != null) {
            var updated = false
            try {
                val method = androidExt.javaClass.getMethod("compileSdkVersion", Int::class.javaPrimitiveType)
                method.invoke(androidExt, 36)
                updated = true
            } catch (_: Exception) {}
            if (!updated) {
                try {
                    val method = androidExt.javaClass.getMethod("setCompileSdk", java.lang.Integer::class.java)
                    method.invoke(androidExt, 36)
                    updated = true
                } catch (_: Exception) {}
            }
            if (!updated) {
                try {
                    val method = androidExt.javaClass.getMethod("setCompileSdkVersion", Int::class.javaPrimitiveType)
                    method.invoke(androidExt, 36)
                    updated = true
                } catch (_: Exception) {}
            }
            if (androidExt is com.android.build.gradle.BaseExtension) {
                androidExt.compileSdkVersion(36)
                updated = true
            }
            println("Subproject [${project.name}] compileSdk updated: $updated")
        }
    }
    if (project.name != "app") {
        if (state.executed) {
            configureAndroid()
        } else {
            afterEvaluate {
                configureAndroid()
            }
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}