# 🎬 Movies App

A modern Flutter application for browsing and discovering movies, built with clean architecture principles and state-of-the-art Flutter packages.

![Flutter Version](https://img.shields.io/badge/Flutter-3.9.2-02569B?logo=flutter)
![Dart Version](https://img.shields.io/badge/Dart-3.9.2-0175C2?logo=dart)

## 📋 Table of Contents

- [Features](#-features)
- [Architecture](#-architecture)
- [Tech Stack](#-tech-stack)
- [Prerequisites](#-prerequisites)
- [Installation](#-installation)
- [Configuration](#-configuration)
- [Project Structure](#-project-structure)
- [Running the App](#-running-the-app)
- [Building for Production](#-building-for-production)
- [Contributing](#-contributing)
- [License](#-license)

## ✨ Features

- 🎥 Browse popular movies
- 🔍 Search for movies
- 📱 Responsive UI design
- 🎨 Modern Material Design
- 🔄 State management with Riverpod
- 🌐 API integration with The Movie Database (TMDB)
- 🎭 Smooth animations
- 📊 Clean architecture implementation

## 🏗️ Architecture

This project follows **Clean Architecture** principles with a clear separation of concerns:

```
lib/
├── config/          # App configuration (theme, routing, constants)
├── domain/          # Business logic layer
│   ├── entities/    # Business entities
│   ├── repositories/# Repository interfaces
│   └── datasources/ # Datasource interfaces
├── infrastructure/  # Data layer
│   ├── datasources/ # API implementations
│   ├── models/      # Data models
│   ├── mappers/     # Entity-Model mappers
│   └── repositories/# Repository implementations
└── presentation/    # UI layer
    ├── screens/     # App screens
    ├── widgets/     # Reusable widgets
    └── providers/   # Riverpod providers
```

### Architecture Layers

- **Domain Layer**: Contains business logic, entities, and repository interfaces
- **Infrastructure Layer**: Implements data sources, API calls, and repositories
- **Presentation Layer**: UI components, screens, and state management

## 🛠️ Tech Stack

### Core
- **Flutter SDK**: ^3.9.2
- **Dart SDK**: ^3.9.2

### State Management
- **flutter_riverpod**: ^3.0.1 - Reactive state management

### Navigation
- **go_router**: ^16.2.4 - Declarative routing

### Networking
- **dio**: ^5.9.0 - HTTP client for API calls

### UI Components
- **card_swiper**: ^3.0.1 - Card swiper widget
- **animate_do**: ^4.2.0 - Animation library

### Utilities
- **flutter_dotenv**: ^6.0.0 - Environment configuration
- **intl**: ^0.20.2 - Internationalization and formatting

### Development
- **flutter_lints**: ^5.0.0 - Linting rules
- **flutter_test**: Testing framework

## 📦 Prerequisites

Before you begin, ensure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (version 3.9.2 or higher)
- [Dart SDK](https://dart.dev/get-dart) (version 3.9.2 or higher)
- [Android Studio](https://developer.android.com/studio) or [Xcode](https://developer.apple.com/xcode/) (for mobile development)
- [Visual Studio Code](https://code.visualstudio.com/) (recommended) or any preferred IDE
- A [TMDB API Key](https://www.themoviedb.org/settings/api) (free registration required)

## 🚀 Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd movies_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Verify Flutter installation**
   ```bash
   flutter doctor
   ```
   Make sure all required dependencies are installed and configured.

## ⚙️ Configuration

### Environment Variables Setup

1. **Copy the environment template**
   ```bash
   cp .env.template .env
   ```

2. **Configure your API credentials**
   
   Open the `.env` file and add your TMDB API credentials:
   
   ```env
   THE_MOVIE_DB_KEY=your_api_key_here
   API_TOKEN=your_api_token_here
   URL_BASE_MOVIE=https://api.themoviedb.org/3
   ```

3. **Get TMDB API Credentials**
   
   - Visit [The Movie Database](https://www.themoviedb.org/)
   - Create a free account
   - Go to Settings → API
   - Request an API key
   - Copy your API Key and API Read Access Token
   - Paste them into your `.env` file

> ⚠️ **Important**: Never commit your `.env` file to version control. It's already included in `.gitignore`.

## 📁 Project Structure

```
movies_app/
├── android/              # Android native code
├── ios/                  # iOS native code
├── linux/                # Linux native code
├── macos/                # macOS native code
├── lib/                  # Main application code
│   ├── config/
│   │   ├── constants/    # App constants
│   │   ├── helpers/      # Helper functions
│   │   ├── router/       # Navigation configuration
│   │   └── theme/        # App theme
│   ├── domain/
│   │   ├── datasources/  # Data source interfaces
│   │   ├── entities/     # Business entities
│   │   └── repositories/ # Repository interfaces
│   ├── infrastructure/
│   │   ├── datasources/  # API implementations
│   │   ├── mappers/      # Data mappers
│   │   ├── models/       # Data models
│   │   └── repositories/ # Repository implementations
│   ├── presentation/
│   │   ├── providers/    # Riverpod providers
│   │   ├── screens/      # App screens
│   │   └── widgets/      # Reusable widgets
│   └── main.dart         # App entry point
├── .env.template         # Environment variables template
├── .env                  # Environment variables (create this)
├── pubspec.yaml          # Dependencies configuration
└── README.md             # This file
```

## 🏃 Running the App

### Development Mode

Run the app in debug mode:

```bash
flutter run
```

Run on a specific device:

```bash
# List available devices
flutter devices

# Run on specific device
flutter run -d <device-id>
```

### Hot Reload

While the app is running, you can use:
- Press `r` to hot reload
- Press `R` to hot restart
- Press `q` to quit

## 📱 Building for Production

### Android

```bash
# Build APK
flutter build apk --release

# Build App Bundle (recommended for Play Store)
flutter build appbundle --release
```

### iOS

```bash
# Build for iOS
flutter build ios --release
```

### Linux

```bash
flutter build linux --release
```

### macOS

```bash
flutter build macos --release
```

## 🧪 Testing

Run all tests:

```bash
flutter test
```

Run tests with coverage:

```bash
flutter test --coverage
```

## 🐛 Debugging

Enable Flutter DevTools:

```bash
flutter pub global activate devtools
flutter pub global run devtools
```

## 📝 Code Style

This project follows the official [Flutter style guide](https://flutter.dev/docs/development/tools/formatting) and uses `flutter_lints` for code analysis.

Run the linter:

```bash
flutter analyze
```

Format code:

```bash
flutter format .
```

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- [The Movie Database (TMDB)](https://www.themoviedb.org/) for providing the movie data API
- [Flutter](https://flutter.dev/) team for the amazing framework
- All contributors and package maintainers

## 📞 Support

If you have any questions or need help, please:
- Open an issue in the repository
- Check the [Flutter documentation](https://flutter.dev/docs)
- Visit [TMDB API documentation](https://developers.themoviedb.org/3)

---

Made with ❤️ using Flutter
