# Movies App 🎬

Movies App is a Flutter-based movie discovery application that allows users to explore trending, popular, and upcoming movies, view detailed information, and manage a personalized watch experience. The app is built using Clean Architecture and follows scalable state management practices to ensure performance, maintainability, and modularity.

## 🌟 Impact

Movies App significantly enhances the user's cinematic exploration by:
- **Optimizing Discovery**: Reducing the time spent searching for quality content through curated feeds and high-performance search.
- **Enriching Exploration**: Providing deep insights and high-fidelity visuals that help users make informed viewing decisions.
- **Empowering Personalization**: Allowing users to maintain a secure, private movie library that reflects their unique tastes.
- **Delivering Performance**: Offering a smooth, lag-free experience that matches the high quality of modern cinema.

## 🚀 Features

- **Authentication**: Secure Login and Sign-up flow via Firebase, including one-tap Google Sign-In integration.
- **Cinema Discovery**: Explore dynamic feeds of Trending, Popular, and highly anticipated Upcoming releases.
- **Smart Search**: High-performance search engine equipped with state-managed pagination and infinite scrolling for a lag-free experience.
- **Movie Details**: Comprehensive insights including plot synopses, user ratings, and high-definition screenshot galleries.
- **Smart Recommendations**: Never run out of content with an AI-driven suggestion engine for similar movies based on current interests.
- **Profile Management**: Personalized profile customization and secure data persistence powered by Cloud Firestore.
- **Responsive UI**: Fully responsive design using `flutter_screenutil` to support various screen sizes and orientations.
- **Visual Excellence**: Immersive micro-interactions and smooth animations powered by `Lottie` and `flutter_animate`.

## 🛠 Tech Stack & Tools

- **Framework**: [Flutter](https://flutter.dev/)
- **State Management**: [Flutter BLoC / Cubit](https://pub.dev/packages/flutter_bloc) for predictable and reactive state handling.
- **Dependency Injection**: [GetIt](https://pub.dev/packages/get_it) & [Injectable](https://pub.dev/packages/injectable) for modularity and decoupled service management.
- **Networking**: [Retrofit](https://pub.dev/packages/retrofit) & [Dio](https://pub.dev/packages/dio) for type-safe and efficient REST API communication.
- **Backend**: [Firebase](https://firebase.google.com/) (Authentication & Cloud Firestore).
- **Architecture**: Clean Architecture (Data, Domain, and Presentation layers).
- **UI Utilities**:
    - `flutter_screenutil` for pixel-perfect responsiveness.
    - `cached_network_image` for optimized image loading and caching.
    - `lottie` & `flutter_animate` for modern micro-interactions.
    - `flutter_svg` for scalable vector graphics.

## 📂 Project Structure

The project follows a feature-first Clean Architecture folder structure:

```text
lib/
├── core/                  # Global utilities, DI setup, routes, themes, and network configuration
│   ├── di/                # Dependency Injection setup
│   ├── remote/            # Local & Remote data source handlers
│   ├── resources/         # App constants, colors, and styles
│   ├── routes_manager/    # Navigation and routing logic
│   └── reusable_component/# Reusable UI components
├── features/              # Feature-specific modules
│   ├── auth/              # Login, Register, and Social Authentication
│   ├── intro/             # Splash screen and interactive Onboarding flow
│   ├── main_layout/       # Home, Search (Paginated), Browse, and Profile tabs
│   ├── movie_details/     # Movie insights, Galleries, and Recommendations
│   └── update-profile/    # Profile customization and Firestore persistence
└── main.dart              # Application entry point
```

## ⚙️ Installation & Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/77MohamedShaban/movies.git
   ```
2. **Navigate to the project directory**:
   ```bash
   cd movies
   ```
3. **Install dependencies**:
   ```bash
   flutter pub get
   ```
4. **Generate code (for DI & Retrofit)**:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```
5. **Firebase Configuration**:
    - Add your `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) to the respective module directories.
6. **Run the app**:
   ```bash
   flutter run
   ```

## 🎨 Screenshots 

| Splash | Home | Search | Movie Details |
| :---: | :---: | :---: | :---: |
| *(Image)* | *(Image)* | *(Image)* | *(Image)* |

---
**Maintained by MOHAMED SHABAN**
