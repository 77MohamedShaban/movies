# 🎬 Movies App

**Movies App** is an elite, high-performance cinematic discovery engine engineered with **Flutter**.
It delivers an immersive and fluid environment for cinema enthusiasts to explore the global
landscape of movies, powered by real-time data synchronization, secure cloud infrastructure, and a
pixel-perfect responsive interface.

This platform is a showcase of **Professional-Grade Clean Architecture**, prioritizing scalability,
performance, and a premium user experience.

---

## 🚀 Key Features

* **Enterprise-Grade Auth:** Secure and frictionless login via Firebase and Google integration.
* **Real-Time Data Sync:** Robust networking layer ensuring you are always updated with the latest
  cinema data and releases.
* **Intelligent Paginated Search:** High-performance search logic with infinite scrolling support
  for a lag-free experience.
* **Immersive Media:** High-fidelity visuals with optimized image caching and fluid animations
  powered by `Lottie` and `flutter_animate`.
* **Pixel-Perfect UI:** A responsive interface meticulously optimized for all mobile screen sizes
  using `flutter_screenutil`.

---

## 🏗 Architectural Blueprint

The application strictly adheres to the **Clean Architecture** pattern to ensure a robust separation
of concerns, making the codebase maintainable, testable, and enterprise-ready.

* **Data Layer:** Handles all external communication (Retrofit/Dio APIs), Firebase services, and
  local persistence logic.
* **Domain Layer:** The pure heart of the application. Contains Entities and Repository interfaces,
  remaining completely independent of external frameworks.
* **Presentation Layer:** Powered by **BLoC/Cubit**, ensuring a reactive UI and predictable state
  transitions for a fluid user experience.

---

## 🛠 Tech Stack

| Category | Technology |
| :--- | :--- |
| **Backend** | Firebase Auth, Cloud Firestore, Google Sign-In |
| **State Management** | Flutter BLoC / Cubit |
| **Networking** | Retrofit, Dio, JSON Serializable |
| **Architecture** | Feature-First Clean Architecture |
| **Local Persistence** | SharedPreferences (PrefsManager) |
| **Visuals/UI** | ScreenUtil, Lottie, Flutter Animate, SVG |

---

## 📂 Project Structure

```text
lib/
├── core/                # Infrastructure: DI setup, Themes, Routes, and Reusable UI components.
├── features/            # Modularized features:
│   ├── auth/            # Identity management (Login, SignUp, Social Auth).
│   ├── intro/           # Splash screen and interactive Onboarding experience.
│   ├── main_layout/     # Core shell: Home, Browse, Search (Paginated), and Profile.
│   ├── movie_details/   # Immersive insights & Recommendation engine.
│   └── update-profile/  # Real-time profile customization.
└── main.dart            # Application entry point & initialization logic.
```

---

## ⚙️ Setup & Installation

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/77MohamedShaban/movies.git
   ```
2. **Install Dependencies:**
   ```bash
   flutter pub get
   ```
3. **Generate Core Logic:**
   The project leverages heavy code generation for DI and Network layers:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```
4. **Firebase Configuration:**
    * Add your `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) to the
      respective module directories.
5. **Run Application:**
   ```bash
   flutter run
   ```

---

**Developed with focus on Clean Code & SOLID Principles.**  
**Maintained by MOHAMED SHABAN**
