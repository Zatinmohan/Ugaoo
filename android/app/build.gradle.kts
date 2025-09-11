plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "in.co.ugaoo"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "in.co.ugaoo"
        minSdk = flutter.minSdkVersion
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
        create("production") {
            dimension = "Ugaoo"
            applicationIdSuffix = ""
            manifestPlaceholders["applicationLabel"] = "Ugaoo"
        }
        create("staging") {
            dimension = "Ugaoo stg"
            applicationIdSuffix = ".stg"
            manifestPlaceholders["applicationLabel"] = "Ugaoo Stg"
        }
        create("development") {
            dimension = "Ugaoo dev"
            applicationIdSuffix = ".dev"
            manifestPlaceholders["applicationLabel"] = "Ugaoo Dev"
        }
    }
}

flutter {
    source = "../.."
}
