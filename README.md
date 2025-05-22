from pathlib import Path

readme_content = """\
# ios-scalable-project

A scalable, modular iOS project built with **SwiftUI**, **VIPER + MVI-style**, and powered by **Factory (DI)**, **Core Data**, **UserDefaults**, and **SSL Pinning** for robust production readiness.

---

## 🚀 Tech Stack & Architecture

| Layer         | Tool / Pattern              |
|---------------|-----------------------------|
| UI            | SwiftUI                     |
| Navigation    | Bottom Tab (3 menus)        |
| Architecture  | VIPER + MVI-style (Event/State) |
| Dependency Injection | Factory (v2.x)       |
| Local Storage | UserDefaults + Core Data    |
| Secure Storage| Keychain (manual)           |
| Networking    | URLSession + SSL Pinning    |
| Environment   | Configurable per scheme     |
| State Flow    | ObservableObject + @Published|

---

## 📁 Project Structure

