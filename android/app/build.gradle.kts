plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
}

android {
    namespace = "in.co.ugaoo"
    compileSdk = flutter.compileSdkVersion
    // ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "in.co.ugaoo"
        minSdk = 23
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
    flavorDimensions += "Ugaoo"
    productFlavors {
        create("prod") {
            dimension = "Ugaoo"
            applicationIdSuffix = ""
            manifestPlaceholders["applicationLabel"] = "Ugaoo"
        }
        create("stg") {
            dimension = "Ugaoo"
            applicationIdSuffix = ".stg"
            manifestPlaceholders["applicationLabel"] = "Ugaoo Stg"
        }
        create("dev") {
            dimension = "Ugaoo"
            applicationIdSuffix = ".dev"
            manifestPlaceholders["applicationLabel"] = "Ugaoo Dev"
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
   implementation(platform("com.google.firebase:firebase-bom:34.3.0"))
   implementation("com.google.firebase:firebase-analytics")
}
