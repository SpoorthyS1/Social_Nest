# 🏡 Social Nest

**Where Local Services Meet Community Connections**

Social Nest is a community-driven mobile application built with Flutter and Firebase that connects local service providers with consumers. The app enables boutique owners, service providers (like electricians), and consumers to engage in meaningful conversations within distinct group environments while also supporting private communication between users.

## ✨ Features

- 🔐 **User Authentication**: Secure login and registration using Firebase Authentication
- 👤 **User Profiles**: Personalized profiles for both service providers and consumers
- 🔧 **Service Categories**: Browse different service categories (e.g., Electricians)
- 📍 **Location Services**: Geo-location support using Geolocator and Geocoding
- 💬 **Messaging**: Community-driven messaging within group environments
- 🔔 **Notifications**: Stay updated with important alerts
- ⚙️ **Settings**: Customize your app experience
- 🎨 **Modern UI**: Clean and intuitive user interface with custom theming

## 🛠️ Technology Stack

- **Frontend**: Flutter (Dart)
- **Backend**: Firebase
  - Firebase Authentication
  - Firebase Core
- **Location Services**: 
  - Geolocator (v13.0.2)
  - Geocoding (v3.0.0)
- **Platform Support**: Android, iOS, Linux, macOS, Windows, Web

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (^3.5.3 or higher)
- [Dart SDK](https://dart.dev/get-dart)
- [Firebase CLI](https://firebase.google.com/docs/cli)
- A code editor (VS Code, Android Studio, or IntelliJ IDEA)
- For mobile development:
  - Android Studio (for Android development)
  - Xcode (for iOS development, macOS only)

## 🚀 Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/SpoorthyS1/Social_Nest.git
   cd Social_Nest
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Firebase Setup**
   - Create a Firebase project at [Firebase Console](https://console.firebase.google.com/)
   - Enable Firebase Authentication
   - Download and configure the Firebase configuration files:
     - For Android: `google-services.json` in `android/app/`
     - For iOS: `GoogleService-Info.plist` in `ios/Runner/`
   - Run the FlutterFire CLI to configure Firebase:
     ```bash
     flutterfire configure
     ```

4. **Platform-specific setup**
   
   **Android:**
   - Ensure you have Android SDK installed
   - Update `android/app/build.gradle` if needed
   
   **iOS:**
   - Navigate to the iOS folder and install CocoaPods dependencies:
     ```bash
     cd ios
     pod install
     cd ..
     ```

## ▶️ Running the Application

1. **Check available devices**
   ```bash
   flutter devices
   ```

2. **Run on a specific device**
   ```bash
   # Run on connected device/emulator
   flutter run
   
   # Run on specific device
   flutter run -d <device_id>
   
   # Run in debug mode
   flutter run --debug
   
   # Run in release mode
   flutter run --release
   ```

3. **Build for production**
   ```bash
   # Android APK
   flutter build apk
   
   # Android App Bundle
   flutter build appbundle
   
   # iOS
   flutter build ios
   
   # Web
   flutter build web
   ```

## 📁 Project Structure

```
Social_Nest/
├── android/              # Android-specific files
├── ios/                  # iOS-specific files
├── lib/                  # Main application code
│   ├── component/        # Reusable UI components
│   │   ├── Service_tile.dart
│   │   ├── locations.dart
│   │   ├── my_button.dart
│   │   ├── my_textfield.dart
│   │   ├── serviceabctile.dart
│   │   └── theme_class.dart
│   ├── pages/           # Application screens
│   │   ├── Electricians.dart
│   │   ├── HomePage.dart
│   │   ├── LoginPage.dart
│   │   ├── Notifications.dart
│   │   ├── Profile.dart
│   │   ├── RegisterPage.dart
│   │   ├── Services.dart
│   │   └── Settings.dart
│   ├── firebase_options.dart
│   └── main.dart        # Application entry point
├── linux/               # Linux-specific files
├── macos/               # macOS-specific files
├── web/                 # Web-specific files
├── windows/             # Windows-specific files
├── assets/              # Images and other assets
├── test/                # Test files
├── pubspec.yaml         # Project dependencies
└── README.md            # This file
```

## 🎯 Key Components

### Pages
- **LoginPage**: User authentication interface
- **RegisterPage**: New user registration
- **HomePage**: Main dashboard after login
- **Profile**: User profile management
- **Services**: Browse available services
- **Electricians**: Electrician service listings
- **Notifications**: User notifications center
- **Settings**: App configuration options

### Components
- **my_button**: Custom button widget
- **my_textfield**: Custom text input widget
- **Service_tile**: Service listing tile component
- **locations**: Location-related components
- **theme_class**: App theming configuration

## 🔧 Configuration

The app uses Firebase for backend services. Make sure to:
1. Configure Firebase Authentication in your Firebase Console
2. Set up proper security rules for your Firebase project
3. Enable required Firebase services (Auth, Firestore, etc.)
4. Update `firebase_options.dart` with your project configuration

## 🧪 Testing

Run tests using:
```bash
flutter test
```

## 📱 Platform Support

Social Nest supports multiple platforms:
- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Linux
- ✅ macOS
- ✅ Windows

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is private and not published to pub.dev.

## 👥 Author

SpoorthyS1

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Firebase for the backend infrastructure
- All contributors and users of Social Nest

---

Made with ❤️ using Flutter and Firebase
