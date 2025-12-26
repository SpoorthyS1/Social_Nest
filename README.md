# 🏡 Social Nest

<div align="center">

**Where Local Services Meet Community Connections**

A Flutter-based community-driven platform connecting local service providers with community members

[![Flutter](https://img.shields.io/badge/Flutter-3.5.3-02569B?style=for-the-badge&logo=flutter)](https://flutter.dev)
[![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)](https://firebase.google.com)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart)](https://dart.dev)

</div>

---

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Technology Stack](#technology-stack)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Project Structure](#project-structure)
- [Usage](#usage)
- [Screenshots](#screenshots)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

---

## 🌟 Overview

Social Nest is a robust community-driven messaging and service discovery application designed to bridge the gap between local service providers and consumers. Built with Flutter for cross-platform compatibility and Firebase for backend services, Social Nest enables:

- **Service Discovery**: Find local electricians, educational resources, community events, and more
- **Community Engagement**: Connect with service providers and community members through meaningful conversations
- **Location-Based Services**: Discover services and providers near you
- **Secure Communication**: Role-based permissions and secure authentication
- **Real-time Updates**: Stay connected with real-time notifications and messaging

Whether you're a boutique owner looking to reach customers or a consumer seeking local services, Social Nest provides a user-friendly platform for community connections.

---

## ✨ Features

### 🔐 Authentication & Authorization
- **Firebase Authentication**: Secure user registration and login
- **Email/Password Authentication**: Traditional sign-in method
- **Session Management**: Automatic user state management
- **Role-Based Access**: Different permissions for service providers and consumers

### 📍 Location Services
- **Geolocation Integration**: Automatic location detection using device GPS
- **Address Resolution**: Convert coordinates to human-readable addresses
- **Sublocality Detection**: Precise neighborhood-level location tracking
- **Location-Based Discovery**: Find services near your current location

### 🛠️ Service Categories
- **Electrician Services**: Find and connect with local electricians
- **Education & Learning**: Access educational resources and tutoring services
- **Community Events**: Discover and participate in local events
- **Volunteering Opportunities**: Connect with volunteer programs
- **Health & Hygiene**: Access health and wellness services

### 💬 Communication
- **Group Messaging**: Engage in community-specific group chats
- **Private Messaging**: One-on-one communication between users
- **Real-time Notifications**: Stay updated with instant alerts

### 🎨 User Interface
- **Material Design**: Clean, intuitive interface following Material Design guidelines
- **Responsive Layout**: Optimized for various screen sizes
- **Dark/Light Theme Support**: Customizable theme preferences
- **Smooth Navigation**: Seamless page transitions and navigation

### 👤 User Profile Management
- **Profile Customization**: Manage personal information and preferences
- **Settings**: Configure app preferences and notifications
- **Service Provider Profiles**: Showcase services and contact information

---

## 🛠️ Technology Stack

### Frontend
- **Flutter**: UI framework for cross-platform development
- **Dart**: Programming language (SDK ^3.5.3)
- **Material Design**: UI/UX design system

### Backend & Services
- **Firebase Core**: Firebase SDK integration
- **Firebase Auth**: User authentication and authorization
- **Cloud Firestore**: NoSQL database for real-time data (implied)

### Key Dependencies
- `firebase_core: ^3.8.1` - Firebase initialization
- `firebase_auth: ^5.3.4` - Authentication services
- `geolocator: ^13.0.2` - Location services
- `geocoding: ^3.0.0` - Address lookup
- `cupertino_icons: ^1.0.8` - iOS-style icons

### Development Tools
- `flutter_lints: ^4.0.0` - Code quality and style enforcement
- `flutter_test` - Testing framework

### Supported Platforms
- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ macOS
- ✅ Windows
- ✅ Linux

---

## 📦 Prerequisites

Before you begin, ensure you have the following installed:

### Required Software
- **Flutter SDK**: Version 3.5.3 or higher
  ```bash
  flutter --version
  ```
- **Dart SDK**: Version 3.5.3 or higher (comes with Flutter)
- **Android Studio** or **VS Code** with Flutter extensions
- **Git**: For version control

### Platform-Specific Requirements

#### For Android Development
- Android Studio with Android SDK
- Android Emulator or physical device
- JDK 11 or higher

#### For iOS Development (macOS only)
- Xcode 13 or higher
- CocoaPods
- iOS Simulator or physical device

#### For Web Development
- Chrome browser
- Flutter web support enabled

### Firebase Account
- Google/Firebase account for backend services
- Firebase project setup (see Configuration section)

---

## 🚀 Installation

### 1. Clone the Repository
```bash
git clone https://github.com/SpoorthyS1/Social_Nest.git
cd Social_Nest
```

### 2. Install Flutter Dependencies
```bash
flutter pub get
```

### 3. Verify Flutter Setup
```bash
flutter doctor
```
Fix any issues reported by `flutter doctor` before proceeding.

### 4. Enable Platform Support (if needed)

For Web:
```bash
flutter config --enable-web
```

For macOS:
```bash
flutter config --enable-macos-desktop
```

For Windows:
```bash
flutter config --enable-windows-desktop
```

For Linux:
```bash
flutter config --enable-linux-desktop
```

---

## ⚙️ Configuration

### Firebase Setup

1. **Create a Firebase Project**
   - Go to [Firebase Console](https://console.firebase.google.com/)
   - Click "Add project" and follow the setup wizard
   - Enable Google Analytics (optional)

2. **Register Your App**
   
   **For Android:**
   - Add an Android app in Firebase Console
   - Download `google-services.json`
   - Place it in `android/app/`
   
   **For iOS:**
   - Add an iOS app in Firebase Console
   - Download `GoogleService-Info.plist`
   - Place it in `ios/Runner/`
   
   **For Web:**
   - Add a Web app in Firebase Console
   - Copy the Firebase configuration

3. **Enable Firebase Services**
   - Go to Authentication → Sign-in method
   - Enable Email/Password authentication
   - (Optional) Enable Google Sign-In or other providers

4. **Generate Firebase Options**
   ```bash
   # Install FlutterFire CLI
   dart pub global activate flutterfire_cli
   
   # Configure Firebase for your project
   flutterfire configure
   ```
   This will generate `lib/firebase_options.dart` with your Firebase configuration.

5. **Update Firebase Rules** (if using Firestore)
   - Configure security rules in Firebase Console
   - Set up appropriate read/write permissions

### Location Permissions

#### Android
The app requires location permissions. These are already configured in `android/app/src/main/AndroidManifest.xml`:
```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
```

#### iOS
Location permissions are configured in `ios/Runner/Info.plist`:
```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>This app needs access to location to show nearby services.</string>
```

---

## 📁 Project Structure

```
Social_Nest/
├── android/                    # Android-specific code
│   └── app/
│       ├── google-services.json
│       └── src/
├── assets/                     # Image and media assets
│   ├── apple2.png
│   ├── electrician.jpg
│   ├── google1.png
│   └── nest.jpg
├── ios/                        # iOS-specific code
│   └── Runner/
├── lib/                        # Main application code
│   ├── component/              # Reusable UI components
│   │   ├── locations.dart      # Location service handler
│   │   ├── my_button.dart      # Custom button widget
│   │   ├── my_textfield.dart   # Custom text field widget
│   │   ├── Service_tile.dart   # Service card widget
│   │   ├── serviceabctile.dart # Alternative service tile
│   │   └── theme_class.dart    # Theme configuration
│   ├── pages/                  # App screens/pages
│   │   ├── Electricians.dart   # Electrician services page
│   │   ├── HomePage.dart       # Main home screen
│   │   ├── LoginPage.dart      # User login screen
│   │   ├── Notifications.dart  # Notifications page
│   │   ├── Profile.dart        # User profile page
│   │   ├── RegisterPage.dart   # User registration screen
│   │   ├── Services.dart       # Services listing page
│   │   └── Settings.dart       # App settings page
│   ├── firebase_options.dart   # Firebase configuration
│   └── main.dart               # App entry point
├── linux/                      # Linux-specific code
├── macos/                      # macOS-specific code
├── test/                       # Unit and widget tests
├── web/                        # Web-specific code
├── windows/                    # Windows-specific code
├── .gitignore                  # Git ignore rules
├── analysis_options.yaml       # Dart analyzer configuration
├── firebase.json               # Firebase project configuration
├── pubspec.yaml                # Project dependencies
└── README.md                   # Project documentation
```

### Key Files

- **`lib/main.dart`**: Application entry point, Firebase initialization, authentication state management
- **`lib/firebase_options.dart`**: Firebase configuration (auto-generated)
- **`lib/component/locations.dart`**: Location service with geolocation and geocoding
- **`lib/pages/HomePage.dart`**: Main dashboard with navigation
- **`lib/pages/Services.dart`**: Service category listing
- **`pubspec.yaml`**: Project metadata and dependencies

---

## 🎯 Usage

### Running the Application

#### Development Mode

**Run on all available devices:**
```bash
flutter run
```

**Run on specific platform:**
```bash
# Android
flutter run -d android

# iOS
flutter run -d ios

# Web
flutter run -d chrome

# macOS
flutter run -d macos

# Windows
flutter run -d windows

# Linux
flutter run -d linux
```

#### Hot Reload During Development
- Press `r` in the terminal to hot reload
- Press `R` to hot restart
- Press `q` to quit

### Building for Production

#### Android APK
```bash
flutter build apk --release
```
Output: `build/app/outputs/flutter-apk/app-release.apk`

#### Android App Bundle (for Google Play)
```bash
flutter build appbundle --release
```
Output: `build/app/outputs/bundle/release/app-release.aab`

#### iOS
```bash
flutter build ios --release
```
Then open `ios/Runner.xcworkspace` in Xcode and archive.

#### Web
```bash
flutter build web --release
```
Output: `build/web/`

#### Desktop
```bash
# macOS
flutter build macos --release

# Windows
flutter build windows --release

# Linux
flutter build linux --release
```

### Testing

#### Run all tests
```bash
flutter test
```

#### Run tests with coverage
```bash
flutter test --coverage
```

#### Run specific test file
```bash
flutter test test/widget_test.dart
```

### Code Quality

#### Analyze code
```bash
flutter analyze
```

#### Format code
```bash
flutter format lib/
```

---

## 📱 App Walkthrough

### First-Time Setup
1. **Launch the app** on your device/emulator
2. **Sign Up/Login**:
   - New users: Click "Register" and create an account with email/password
   - Existing users: Enter credentials and login
3. **Grant Permissions**: Allow location access when prompted
4. **Explore Services**: Browse available service categories on the home screen

### Key User Flows

#### Finding a Service Provider
1. Navigate to the **Services** page from the home screen
2. Select a service category (e.g., "Electrician")
3. View available providers in your area
4. Contact providers through the app

#### Managing Your Profile
1. Tap the profile icon in the navigation
2. View and edit your personal information
3. Update profile picture and bio
4. Manage notification preferences

#### Location-Based Discovery
1. The app automatically detects your location
2. Services are filtered based on your current area
3. View your current neighborhood in the home screen header
4. Tap location to refresh or change manually

---

## 📸 Screenshots

> **Note**: Add your app screenshots here to showcase the UI and features

```
| Home Screen | Services | Profile |
|------------|----------|---------|
| [Screenshot 1] | [Screenshot 2] | [Screenshot 3] |

| Login | Electrician Services | Notifications |
|-------|---------------------|---------------|
| [Screenshot 4] | [Screenshot 5] | [Screenshot 6] |
```

---

## 🤝 Contributing

We welcome contributions to Social Nest! Here's how you can help:

### Development Process

1. **Fork the Repository**
   ```bash
   # Click "Fork" on GitHub, then clone your fork
   git clone https://github.com/YOUR_USERNAME/Social_Nest.git
   cd Social_Nest
   ```

2. **Create a Feature Branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make Your Changes**
   - Follow the existing code style
   - Add tests for new features
   - Update documentation as needed

4. **Test Your Changes**
   ```bash
   flutter test
   flutter analyze
   ```

5. **Commit Your Changes**
   ```bash
   git add .
   git commit -m "Add: Brief description of your changes"
   ```

6. **Push to Your Fork**
   ```bash
   git push origin feature/your-feature-name
   ```

7. **Create a Pull Request**
   - Go to the original repository on GitHub
   - Click "New Pull Request"
   - Select your fork and branch
   - Describe your changes in detail

### Coding Guidelines

- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) style guide
- Use meaningful variable and function names
- Comment complex logic
- Keep functions small and focused
- Write tests for new features
- Ensure all tests pass before submitting PR

### Reporting Issues

Found a bug or have a feature request?

1. Check if the issue already exists in [Issues](https://github.com/SpoorthyS1/Social_Nest/issues)
2. If not, create a new issue with:
   - Clear title and description
   - Steps to reproduce (for bugs)
   - Expected vs actual behavior
   - Screenshots if applicable
   - Device/platform information

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```
MIT License

Copyright (c) 2024 Social Nest

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

## 📞 Contact

### Project Maintainer
- **GitHub**: [@SpoorthyS1](https://github.com/SpoorthyS1)
- **Repository**: [Social_Nest](https://github.com/SpoorthyS1/Social_Nest)

### Support
- **Issues**: [GitHub Issues](https://github.com/SpoorthyS1/Social_Nest/issues)
- **Discussions**: [GitHub Discussions](https://github.com/SpoorthyS1/Social_Nest/discussions)

---

## 🙏 Acknowledgments

- **Flutter Team**: For the amazing cross-platform framework
- **Firebase Team**: For robust backend services
- **Open Source Community**: For various packages and tools used in this project
- **Contributors**: Thank you to everyone who has contributed to this project!

---

## 📈 Project Status

**Current Version**: 1.0.0

### Roadmap

#### Upcoming Features
- [ ] In-app messaging with chat history
- [ ] Service provider ratings and reviews
- [ ] Advanced search and filters
- [ ] Push notifications
- [ ] Payment integration
- [ ] Multi-language support
- [ ] Dark mode enhancements
- [ ] Social media integration

#### In Progress
- [x] Core authentication system
- [x] Location-based services
- [x] Basic service categories
- [x] User profiles

#### Completed
- [x] Initial project setup
- [x] Firebase integration
- [x] User authentication (email/password)
- [x] Location services
- [x] Basic UI/UX design
- [x] Service listing pages

---

## ⚠️ Known Issues

- Location permission must be granted for full functionality
- Initial location fetch may take a few seconds
- Some service categories are placeholders (under development)

For a complete list of known issues, see [GitHub Issues](https://github.com/SpoorthyS1/Social_Nest/issues).

---

## 📚 Additional Resources

### Flutter Documentation
- [Flutter Official Docs](https://docs.flutter.dev/)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Flutter Cookbook](https://docs.flutter.dev/cookbook)

### Firebase Documentation
- [Firebase for Flutter](https://firebase.google.com/docs/flutter/setup)
- [Firebase Authentication](https://firebase.google.com/docs/auth)
- [Cloud Firestore](https://firebase.google.com/docs/firestore)

### Community
- [Flutter Community](https://flutter.dev/community)
- [Stack Overflow - Flutter](https://stackoverflow.com/questions/tagged/flutter)
- [Reddit - r/FlutterDev](https://www.reddit.com/r/FlutterDev/)

---

<div align="center">

**Made with ❤️ using Flutter**

⭐ Star this repo if you find it helpful!

[Report Bug](https://github.com/SpoorthyS1/Social_Nest/issues) · [Request Feature](https://github.com/SpoorthyS1/Social_Nest/issues) · [Contribute](https://github.com/SpoorthyS1/Social_Nest/pulls)

</div>
