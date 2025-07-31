# Flutter TTS App

A simple Flutter Text-to-Speech (TTS) application that allows users to input text, select a language, and adjust volume, pitch, and speech rate for speech synthesis using the `flutter_tts` package.

**TTS_APP_DEMO**:
Google Drive Link:
https://drive.google.com/drive/folders/1q2FJ2Kl0P3mSOgMWlnpI-VpmioTTMZnt?usp=sharing

## Features

- Select language from available TTS voices
- Adjust volume, pitch, and speech rate with sliders
- Start and stop speech synthesis
- Dynamic language fetching from device TTS service

---

## Getting Started

### Prerequisites

- Flutter SDK installed on your machine. [Flutter installation guide](https://flutter.dev/docs/get-started/install)
- Android Studio or any preferred IDE configured for Flutter development
- An Android device or emulator to run the app

---

### Setup Instructions

1. **Clone the repository:**

git clone https://github.com/your-username/your-flutter-tts-app.git
cd your-flutter-tts-app

2. **Install dependencies:**

Run the following command in the project root directory:

flutter pub get

3. **Connect your device or start an emulator**

4. **Run the app:**

flutter run

---

### AndroidManifest Changes

To ensure Text-to-Speech works properly and the app has necessary permissions on Android, add or confirm the following in your Android `AndroidManifest.xml` file located at:

android/app/src/main/AndroidManifest.xml

- **Permissions:**

  Add (if not present) the following permissions inside the `<manifest>` tag to allow internet access and audio playback if needed:

<uses-permission android:name="android.permission.INTERNET"/> <uses-permission android:name="android.permission.RECORD_AUDIO"/> <!-- If you want to use speech recognition in the future --> ```
Inside <application> tag:

Make sure you have the following metadata (optional but recommended for some TTS engines):
<meta-data android:name="com.google.android.tts" android:value="true" />

**For Android 11+ targets using TTS, add the following inside the <manifest> tag to declare queries for TTS services:**
<queries>
  <intent>
    <action android:name="android.intent.action.TTS_SERVICE" />
  </intent>
</queries>

**RECORD_AUDIO permission is only required if you plan to add speech recognition or audio recording features.**

**Notes**
Languages are dynamically loaded from device TTS engines.

Minimum Android SDK version should be 21+.

Adjust volume, pitch, and speech rate sliders for customizing speech.
