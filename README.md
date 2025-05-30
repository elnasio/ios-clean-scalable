
# 📱 ios-scalable-project

<<<<<<< Updated upstream
A scalable, modular iOS project built with **SwiftUI**, **VIPER Hybrid (VIPER + MVI-style + SwiftUI + Combine)**, and powered by **Factory (DI)**, **Core Data**, **UserDefaults**, and **SSL Pinning** for robust production readiness.
=======
A scalable, modular, and secure iOS mobile banking architecture built with **SwiftUI**, **Combine**, and a hybrid **VIPER + MVI** pattern.
>>>>>>> Stashed changes

---

## 🧠 Architecture

### 🔷 VIPER + MVI Hybrid

| Layer        | Description |
|--------------|-------------|
| View         | SwiftUI Views using `@ObservedObject` or `@StateObject`. |
| Interactor   | Business logic (e.g. API calls, validation). |
| Presenter    | Implemented using `ObservableObject`, also handles state via `@Published`. |
| Entity       | Pure Swift data models (`Codable`). |
| Router       | SwiftUI Navigation, modular navigation optional. |

---

## 📦 Modules

```
ios-scalable-project/
├── App/                  # Entry point, config, theme
├── Core/                 # Core utilities, SSL, SecureStorage, etc.
│   ├── Network/
│   ├── Storage/
│   ├── Security/
├── Domain/               # Protocol definitions and domain logic
├── Features/             # Modular screens (Login, Register, Articles, etc.)
│   ├── Login/
│   ├── Register/
│   ├── Articles/
├── Resources/            # Assets, Localization, etc.
├── Tests/                # Unit and integration tests
```

---

## 🔐 Security

- ✅ **SSL Pinning** (optional per environment)
- ✅ **Device Binding (SysParam)** via SHA256
- ✅ **Secure Storage** via Keychain
- ✅ **CoreData** for local DB
- ✅ **UserDefaults** for preferences/token

---

## 📲 Features

- SplashScreen
- Login/Register
- Articles screen (demo API)
- Bottom Tab Navigation (no string literals)
- Reactive State management via Combine

---

## 🧪 Testing

- Uses `Factory` dependency injection
- Mocks injectable with `Container.shared.override`
- `XCTest` for all layers

---

## ⚙️ Environment Config

Environment-specific settings defined in:

```swift
enum EnvironmentConfig {
    static let baseURL = "https://api.example.com"
    static let enableSSLPinning = true
}
```

You can switch environment in build settings or use custom `.xcconfig`.

---

## 🚀 Getting Started

### 1. Clone the Repo

```bash
git clone https://github.com/yourname/ios-scalable-project.git
cd ios-scalable-project
```

### 2. Open in Xcode

```
open ios-scalable-project.xcodeproj
```

### 3. Run the App

- Choose target: `ios-scalable-project`
- Run via Simulator or Device

---

## ✅ Requirements

- Xcode 15+
- iOS 15+
- Swift 5.9+

---

## 🙌 Credits

Built with ❤️ by [Mories Deo Hutapea](https://t.me/learningmobileapps)

---

## 📄 License

MIT License
