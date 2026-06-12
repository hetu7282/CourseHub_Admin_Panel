# 🖥️ Coures Admin App (CourseHub Admin Panel)
<p align="center">
<img width="150" height="150" alt="logo" src="https://github.com/user-attachments/assets/7bcb5104-7cf1-4e9d-af95-f1f2ef4f91e4" />
</p>

A **Flutter Web-based admin dashboard** for managing the CourseHub platform — the backend management console used by administrators to manage categories, courses, coaches, students, image sliders, and informational content (About Us, Contact Us, Terms of Use) consumed by the **Coach App** and **Student App**.

---

## 📖 Project Overview

Coures Admin App (package name: `coures_app`) is a **responsive Flutter Web application** designed for desktop and tablet use by platform administrators. It provides:

- Admin authentication (login)
- A dashboard overview of platform statistics
- Category management (create, update, enable/disable, remove)
- Course management (view courses by coach/category, enable/disable)
- Coach management (view & enable/disable coach accounts)
- Student/user management (view & enable/disable student accounts)
- Image slider management for the mobile apps' home banners
- Content management for About Us, Contact Us, and Terms of Use pages

The app communicates with the shared CourseHub backend REST API and is built with a **responsive sidebar/drawer layout** that adapts between desktop and mobile/tablet views.

---

## ✨ Key Features & Functionality

- **Admin Login**: Secure email/password authentication; session persisted via `get_storage`
- **Responsive Admin Layout**: Sidebar navigation on desktop, drawer navigation on smaller screens (`Responsive` utility)
- **Dashboard**: Overview widget summarizing platform data (`CustomDashboardWidget`)
- **Category Management**:
  - Add new categories (with image upload)
  - Update existing categories
  - Enable/disable categories via toggle switch (`flutter_advanced_switch`)
  - Remove categories
- **Course Management**: View all courses, filter by coach/category, enable/disable course visibility
- **Coach Management**: View list of coaches, enable/disable coach accounts
- **User/Student Management**: View list of students, enable/disable student accounts
- **Image Slider Management**: Add, update, and delete promotional banner images shown on the Student App home screen (web-based image upload via `image_picker_web` / `universal_html`)
- **Content Management**:
  - About Us — view/update content shown in both mobile apps
  - Contact Us — view/update contact details
  - Terms of Use — view/update terms content
- **Toast & Loading UI**: `toastification` for notifications, `flutter_easyloading` for global loaders
- **Custom Alerts & Widgets**: Reusable alert dialogs, text fields, and styled widgets

---

## 🏗️ Architecture & Application Flow

The app follows a **layered architecture powered by GetX**, with a responsive shell-based layout typical of admin dashboards:

```
UI (Screen / Drawer_Widget panels)  ⇄  Controller (GetX)  ⇄  Repository  ⇄  API Manager (http/dio)  ⇄  Backend REST API
                       │
                       ▼
                 Data Models (Response Models)
```

1. **App Bootstrap (`main.dart`)**: On launch, checks `GetStorage` for a saved admin session (`userData`). If present, loads `AdminHomePage` directly; otherwise shows `LoginScreen`. (Note: `GoRouter`/`GetPages` configurations exist in the code but the primary routing decision is made via this direct `home:` check.)
2. **AdminHomePage (Screen/Home)**: Acts as the main application shell —
   - Renders `CustomSideMenubarWidget` permanently on desktop (`Responsive.isDesktop`) or inside a `Drawer` on smaller screens.
   - Uses `SideMenuController.selectedDestination` (an `Rx<int>`) to determine which content panel from `Drawer_Widget/` to display in the main content area.
   - On `initState`, `AdminHomeController.getAllData(context)` is called to fetch categories, courses, coaches, students, sliders, and content data in one go.
3. **Sidebar Navigation**: Selecting a sidebar item (Dashboard, Category, Coach, Users, Image Sliders, Contact Us, About Us, Terms & Condition) updates `selectedDestination`, swapping the visible `Drawer_Widget` panel reactively via `Obx`.
4. **Controllers** hold all reactive state (`RxList`, `Rx<Model>`) and call **Repository** methods for CRUD operations.
5. **Repositories** (`AuthenticationRepository`, `DashboardRepository`) abstract API calls and return typed **Model** objects.
6. **API Managers** (`APIManager`, `DioManager`) handle GET requests (`http`) and multipart/file uploads (`dio`, `image_picker_web`, `universal_html` for web-compatible file handling).
7. **Local Storage** (`get_storage`) persists the admin session token/details under the `userData` key.

### Application Flow
```
App Launch
   │
   ├──> (no saved session) ──> LoginScreen ──> (on success) ──> AdminHomePage
   │
   └──> (saved session exists) ──> AdminHomePage
                                       │
                                       ├── Sidebar: Dashboard       → CustomDashboardWidget
                                       ├── Sidebar: Category        → CustomCourseWidget (Category & Course management)
                                       ├── Sidebar: Coach           → CustomCoachWidget
                                       ├── Sidebar: Users           → CustomUserWidget
                                       ├── Sidebar: Image Sliders   → CustomImageSliderWidget
                                       ├── Sidebar: Contact Us      → CustomContactUsWidget
                                       ├── Sidebar: About US        → CustomAboutUsWidget
                                       └── Sidebar: Terms & Condition → CustomTermsOfUseWidget
```

---

## 🛠️ Tech Stack & Versions

| Component | Version / Requirement |
|---|---|
| **Dart SDK** | `>=3.1.5 <4.0.0` |
| **Flutter SDK** | Compatible with Dart 3.1.5+ (Flutter 3.16+ recommended) — **Flutter Web support required** |
| **App Version** | `1.0.0+1` |
| **State Management** | GetX |
| **Target Platform** | Web (primary); also runs on desktop/mobile due to Flutter's multi-platform support |

---

## 📦 Key Dependencies

| Package | Version | Purpose |
|---|---|---|
| `get` | ^4.6.6 | State management, routing, dependency injection |
| `get_storage` | ^2.1.1 | Local key-value storage (admin session persistence) |
| `google_fonts` | ^6.1.0 | Custom typography |
| `sizer` | ^2.0.15 | Responsive UI sizing |
| `intl` | ^0.19.0 | Internationalization & date formatting |
| `intl_phone_number_input` | latest | Phone number input with country codes |
| `image_picker` | ^1.0.7 | Image selection (mobile/desktop fallback) |
| `image_picker_web` | ^3.1.1 | Image selection on Flutter Web (e.g., category/slider images) |
| `universal_html` | ^2.2.4 | Web-compatible HTML/DOM access for file handling on Flutter Web |
| `toastification` | ^1.2.0 | Toast notifications |
| `flutter_easyloading` | ^3.0.5 | Global loading indicators |
| `go_router` | ^13.0.1 | Declarative routing (configured in `main.dart`, GetX routing used as primary) |
| `http` | ^1.1.0 | REST API calls (GET) |
| `dio` | ^5.3.3 | REST API calls (multipart/file uploads) |
| `http_parser` | ^4.0.2 | Media-type parsing for multipart requests |
| `flutter_advanced_switch` | ^3.1.0 | Toggle switches for enable/disable actions (categories, courses, coaches, students) |
| `cupertino_icons` | ^1.0.2 | iOS-style icons |

### Dev Dependencies
| Package | Version |
|---|---|
| `flutter_test` | sdk |
| `flutter_lints` | ^2.0.0 |

> ⚠️ **Note**: `intl_phone_number_input` does not specify a version constraint in `pubspec.yaml`. Pin it to a specific version to ensure reproducible builds.

---

## 🌐 Platform Requirements

This app is primarily a **Flutter Web** application.

| Platform | Requirement |
|---|---|
| **Web** | Modern Chromium-based browser (Chrome/Edge) recommended; Flutter Web build with CanvasKit or HTML renderer |
| **Android** (if built as a mobile app) | minSdkVersion 21+ recommended; verify in `android/app/build.gradle` |
| **iOS** (if built as a mobile app) | iOS 12.0+ recommended; verify in `ios/Podfile` |

> ℹ️ Since the project uses `image_picker_web` and `universal_html`, the **Web** target is the intended primary deployment platform for this admin panel.

---

## 🧩 Feature-Wise Explanation

### 1. Admin Authentication (`Screen/Authetication`, `Controller/authetication_controller.dart`)
- **Login Screen**: Admin enters email/password; `AuthenticationRepository.loginApiCall` validates credentials against the backend.
- On success, the admin session/details (`AdminLoginResponseModel`) are saved to `GetStorage` under `userData`, and the app navigates to `AdminHomePage`.
- On subsequent launches, `main.dart` checks `GetStorage().read(userData)` to decide whether to show `AdminHomePage` or `LoginScreen` directly.

### 2. Admin Home Shell (`Screen/Home/admin_home_screen.dart`)
- Renders the responsive layout: persistent sidebar on desktop (`Responsive.isDesktop`) or a `Drawer` (`CustomSideMenubarWidget`) on smaller screens.
- On init, calls `AdminHomeController.getAllData(context)` to bulk-load categories, courses, coaches, students, image sliders, and content data for use across all panels.
- Uses `SideMenuController.selectedDestination` (reactive `Obx`) to swap between content panels.

### 3. Sidebar Navigation (`Custom_Widget/custom_side_menubar_widget.dart`)
Provides navigation to the following sections:
- **Dashboard** — overview stats
- **Category** — category & course management
- **Coach** — coach account management
- **Users** — student account management
- **Image Sliders** — promotional banner management
- **Contact Us** — contact info management
- **About US** — about page content management
- **Terms & Condition** — terms of use content management

### 4. Category & Course Management (`Drawer_Widget/custom_course_widget.dart`)
- Lists all categories (`GetCategoryResponseModel`) with search/filter (`_filteredData`).
- **Add Category**: Upload category image and details (`addCategoriesApiCall`, uses `uploadImageApiCall` via `DioManager`).
- **Update Category**: Edit existing category details (`updateCategoriesApiCall`).
- **Enable/Disable**: Toggle category/course visibility using `flutter_advanced_switch` (`updateEnableCategoriesApiCall`).
- **Remove Category**: Delete a category (`removeCategoriesApiCall`).
- Course listings can be filtered by coach (`getCourseApiCall(coachId: ...)`).

### 5. Coach Management (`Drawer_Widget/custom_coach_widget.dart`)
- Lists all coaches (`GetCoachResponseModel`) via `getCoachApiCall`.
- Enable/disable coach accounts via `updateEnableCoachApiCall`.

### 6. User/Student Management (`Drawer_Widget/custom_user_widget.dart`)
- Lists all students (`GetStudentResponseModel`) via `getStudentApiCall`.
- Enable/disable student accounts via `updateEnableStudentApiCall`.

### 7. Image Slider Management (`Drawer_Widget/custom_image_slider_widget.dart`)
- Lists current promotional banners (`GetImageSliderResponseModel`).
- **Add**: Upload new slider images (`addImageSliderApiCall`, with web-based image picking via `image_picker_web`/`universal_html`).
- **Update**: Replace existing slider images (`updateImageSliderApiCall`).
- **Delete**: Remove a slider image (`deleteImageSliderApiCall`).
- These sliders are displayed on the **Student App** home screen.

### 8. Content Management
- **About Us** (`custom_aboutus_widget.dart`): View (`getAboutUsApiCall`) and update (`updateAboutUsApiCall`) the About Us content shown in the mobile apps.
- **Contact Us** (`custom_contactus_widget.dart`): View (`getContactUsApiCall`) and update (`updateContactUsApiCall`) contact information.
- **Terms of Use** (`custom_terms_of_condition_widget.dart`): View (`getTermsApiCall`) and update (`updateTermsApiCall`) terms & conditions content.

### 9. Dashboard Overview (`Drawer_Widget/custom_dashboard_widget.dart`)
- Displays summary/overview information aggregated from the data fetched by `AdminHomeController.getAllData`.

---

## 👨‍💻 Notes for Developers & Contributors

- **State Management**: Built with GetX (`GetxController`, `Rx`/`RxList` observables, `Obx` for reactivity, `Get.put` for dependency injection). Review existing controllers before adding new state.
- **API Layer**: `APIManager` handles GET requests; `DioManager` handles multipart/file uploads (used heavily for category images and slider images). `AuthenticationRepository` and `DashboardRepository` wrap all backend calls.
- **Base URL**: Defined in `lib/Utils/string_constant.dart` as `const baseUrl = 'http://localhost:4000/admin'`. This must point to the **admin namespace** of the same backend used by the Coach App and Student App. Update for staging/production deployments.
- **Web-Specific Image Handling**: Because this is primarily a Flutter Web app, image uploads use `image_picker_web` and `universal_html` instead of the mobile `image_picker`. Ensure any new image-upload features account for both web and non-web platforms if cross-platform support is needed.
- **Routing**: The project contains **both** a `GoRouter` configuration (in `main.dart`, currently commented out/unused for `MaterialApp.router`) and **GetX `GetPages`** (`Router/app_page.dart`). The actual app currently uses a direct `home:` widget switch based on session state rather than either router — be cautious when modifying navigation, and consider consolidating to a single routing approach.
- **Responsive Design**: `Utils/responsive_screen.dart` provides `Responsive.isDesktop`/breakpoint checks used throughout `Screen/Home/admin_home_screen.dart` and panel widgets to switch between sidebar and drawer layouts.
- **Naming Conventions**: Some files/folders contain typos/inconsistencies carried over from the shared template (e.g., `Authetication` instead of `Authentication`, `Coures` instead of `Course`, `terma_of_use`/`Terma` instead of `Terms`, `hader_widget` instead of `header_widget`). Maintain consistency with existing naming when extending these modules, or consider a project-wide rename/refactor in a dedicated PR.
- **Duplicate/Legacy Models**: There are two model directories — `Data/Model/` (primary, used by repositories) and `Model/` (legacy/local UI models: `categorie_model.dart`, `product_model.dart`, `user_model.dart`, `aboutus_model.dart`, `contactus_model.dart`). Confirm which are actively used before removing or refactoring.
- **Shared Backend**: This admin panel manages data consumed by both the **Coach App** and **Student App** — changes to API contracts (response models) should be coordinated across all three projects.
- **Unversioned Dependencies**: Pin `intl_phone_number_input` to a specific version in `pubspec.yaml`.
- **Linting**: The project uses `flutter_lints` (^2.0.0); run `flutter analyze` before submitting PRs.
- **Testing**: `flutter_test` is included as a dev dependency, but no test files currently exist — contributions adding unit/widget tests are welcome.

---

<p align="center">Made with ❤️ using Flutter</p>
