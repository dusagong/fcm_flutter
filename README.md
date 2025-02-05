#firebase패키지 추가
flutter pub add firebase_core
flutter pub add firebase_messaging


flutterfire configure 원하는 이름.
app수준 build.gradle 에서 
    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "원하는이름"

android/app/src/main/kotlin/com/example/fcmpractice/MainActivity.kt 수정
경로를  android/app/src/main/kotlin/원하는/이름/으로/MainActivity.kt
flutter pub add flutter_local_notifications
flutter pub add app_settings