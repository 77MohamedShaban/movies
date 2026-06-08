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

## 📸 Screenshots

<div align="center">
   <h3>Onboarding & Splash</h3>
   <table style="width:100%">
    <tr>
      <td>
        <img width="200" alt="splash_screen" src="https://github.com/user-attachments/assets/ab300372-32dc-4534-8e8e-243f51674d32" />
      </td>
       <td>
 <img width="200" alt="onBoarding_1" src="https://github.com/user-attachments/assets/53797330-7e60-4814-ad64-03a190a6a21b" />
      </td>
       <td>
     <img width="200" alt="onBoarding_2" src="https://github.com/user-attachments/assets/2533dd5e-0f9c-4075-a05d-13e283550f2b" />
      </td>
       <td>
   
<img width="200"  alt="onBoarding_3" src="https://github.com/user-attachments/assets/375436b3-8f37-4837-9276-7abadf5ec103" />
      </td>
       <td>
 <img width="200" alt="onBoarding_4" src="https://github.com/user-attachments/assets/283c10e5-9d15-416e-9725-c9414f67e5bd" />
      </td>
       <td>
<img width="200" alt="onBoarding_5" src="https://github.com/user-attachments/assets/a6f06c00-1456-4168-8723-91ba4865bf39" />
      </td>
       <td>

<img width="200" alt="onBoarding_6" src="https://github.com/user-attachments/assets/16e2a3a6-3dd8-4302-bd42-ab06dc1f2703" />
      </td>  
    </tr>
  </table>

<h3>Main App Features</h3>
   <table style="width:100%">
       <tr>
       <td>
           <img width="200" alt="sign_up" src="https://github.com/user-attachments/assets/460a1294-4495-42e1-b92e-9752d8285523" />
       </td>
       <td>
<img width="200" alt="login" src="https://github.com/user-attachments/assets/171933cb-0718-4311-993a-1867b340ac91" />
       </td>
       <td>
<img width="200" alt="forget" src="https://github.com/user-attachments/assets/58f3d794-2a83-4783-8f18-f22cb5e5f2a4" />
       </td>
       <td>
<img width="200" alt="home_tab" src="https://github.com/user-attachments/assets/117baf20-8ac4-4d65-af20-f6444c33935d" />
       </td>
       <td>
<img width="200" alt="search_tab" src="https://github.com/user-attachments/assets/0f1de353-0086-49b0-895b-854b0ed33e8e" />  
       </td>
       </tr>
         <tr>
       <td>
<img width="200" alt="browse_tab" src="https://github.com/user-attachments/assets/609673d7-e6cf-4a24-9633-bc2dfe2021c5" />
       </td>
       <td>
<img width="200" alt="profile_tab" src="https://github.com/user-attachments/assets/a530e04f-cfeb-4d2d-91d1-937b5b84ce5d" />
       </td>
       <td>
<img width="200" alt="update" src="https://github.com/user-attachments/assets/f6aaa8d8-53f2-4bd1-97f6-bd0a91717521" />
       </td>
       <td>
<img width="200" alt="delete_account" src="https://github.com/user-attachments/assets/434c0dc9-b034-4fcc-9152-1105baf6e6ac" />  
       </td>
       <td>
<img width="200" alt="exit" src="https://github.com/user-attachments/assets/a9ba4ce2-18f6-4abc-8f70-84adddb15a79" />
       </td>
       </tr>
         <tr>
       <td>
<img width="200" alt="Screenshot_20260608_195937" src="https://github.com/user-attachments/assets/5be2756b-01f8-4fa5-ab7f-520fbcd4b390" />
       </td>
       <td>
<img width="200" alt="Screenshot_20260608_200013" src="https://github.com/user-attachments/assets/7af2a8df-03ed-4aff-842c-4b7f90462a40" /> 
       </td>
       <td>
<img width="200" alt="Screenshot_20260608_200029" src="https://github.com/user-attachments/assets/f62d4205-0f81-43c1-b1d8-e9ab970abe3d" />
       </td>
       <td>
<img width="200" alt="Screenshot_20260608_200048" src="https://github.com/user-attachments/assets/30a43976-37fb-4027-b539-211e84ade8d3" />
       </td>
       </tr>


  </table>
</div>

---
**Maintained by MOHAMED SHABAN**
