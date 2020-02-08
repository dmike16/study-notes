val quarkusPluginVersion: String by project
val quarkusPlatformGroupId: String by project
val quarkusPlatformArtifactId: String by project
val quarkusPlatformVersion: String by project

plugins {
    java
    id ("io.quarkus") version "1.2.0.Final"
}

repositories {
     mavenLocal()
     mavenCentral()
}

dependencies {
    implementation ("io.quarkus:quarkus-resteasy-jsonb")
    implementation (enforcedPlatform("${quarkusPlatformGroupId}:${quarkusPlatformArtifactId}:${quarkusPlatformVersion}"))
    implementation ("io.quarkus:quarkus-resteasy")

    testImplementation ("io.quarkus:quarkus-junit5")
    testImplementation ("io.rest-assured:rest-assured")
}

group = "dl.dual-lab"
version = "1.0.0"

java {
    sourceCompatibility = JavaVersion.VERSION_1_8
    targetCompatibility = JavaVersion.VERSION_1_8
}

tasks.compileJava {
    options.compilerArgs.addAll(listOf("-parameters"))
}

