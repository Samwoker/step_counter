// The Google Services (Firebase) Gradle plugin is declared in
// `settings.gradle.kts` via the `plugins { ... }` block. Avoid
// redeclaring the plugin here to prevent version conflicts.
allprojects {
    repositories {
        google()
        mavenCentral()
          maven {
        url = uri("https://maven.google.com")
    }

    maven {
        url = uri("https://repo.maven.apache.org/maven2")
    }
    }
}
val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}

