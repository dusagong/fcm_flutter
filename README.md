#firebase패키지 추가
flutter pub add firebase_core
flutter pub add firebase_messaging

#firebase 속성연결
flutterfire configure 원하는 이름.
app수준 build.gradle 에서 
    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "원하는이름"}

android/app/src/main/kotlin/com/example/fcmpractice/MainActivity.kt 수정
경로를  android/app/src/main/kotlin/원하는/이름/으로/MainActivity.kt

#fcm 초기설정정
flutter pub add flutter_local_notifications
flutter pub add app_settings
# Firebase & FCM 설정 (Flutter)

## 1. Firebase 패키지 추가
```sh
flutter pub add firebase_core
flutter pub add firebase_messaging
```

## 2. Firebase 속성 연결
```sh
flutterfire configure 
그 후 app이름은 원하는.이름.으로
```

### Android 설정
**`android/app/build.gradle` 수정**
```gradle
defaultConfig {
    applicationId "원하는.이름.으로" // 원하는 패키지 이름 설정
}
```

**`android/app/src/main/kotlin/com/example/fcmpractice/MainActivity.kt` 경로 변경**
```sh
android/app/src/main/kotlin/원하는/이름/으로/MainActivity.kt
```

## 3. FCM 초기 설정
```sh
flutter pub add flutter_local_notifications
flutter pub add app_settings
```

이제 Firebase와 FCM 설정이 완료되었습니다! 🚀

