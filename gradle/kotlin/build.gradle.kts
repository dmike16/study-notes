plugins {
    kotlin("jvm") version "1.3.61" 
    application
}

repositories {
    jcenter() 
}

dependencies {
    implementation(kotlin("stdlib")) 
}

tasks.register<Jar>("uberJar") {
    archiveClassifier.set("uber")

    from(sourceSets.main.get().output)

    dependsOn(configurations.runtimeClasspath)
    from({
        configurations.runtimeClasspath.get().filter { it.name.endsWith("jar") }.map { zipTree(it) }
    })
}

application {
	mainClassName = "RunKt"
}

tasks.named<Jar>("jar") {
	manifest({
		attributes( mapOf("Main-Class" to "RunKt"))
	})
}


version = "1.0.0"