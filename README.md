# Euler's Method App

Euler's Method App is a Flutter-based application designed to solve mathematical problems using Euler's numerical method. The app supports multiple platforms, including Android, iOS, web, and desktop environments.

## Features

- Numerical solutions to differential equations using Euler's method.
- Platform-specific UI designs and functionalities.
- Multiple solvers for specific problems:
  - Population growth solver.
  - Projectile motion solver.
  - RC circuit solver.
  - Thermal dynamics solver.
  - Chemical reaction solver.
- Multi-platform support: Android, iOS, web, Linux, macOS, and Windows.

## Technologies Used

- **Flutter**: Framework for building natively compiled applications.
- **Dart**: Programming language for the application logic.
- Platform-specific configurations for iOS (Xcode), Android (Gradle), and desktop environments.

## Project Structure

- **`lib/`**: Core application code.
  - `main.dart`: Entry point of the application.
  - `homepage.dart`: Main UI layout.
  - `problemsolver.dart`: Logic for managing problem-solving workflows.
  - `solvers/`: Contains specific solver implementations.
    - `chemical_reaction_solver.dart`
    - `population_growth_solver.dart`
    - `projectile_motion_solver.dart`
    - `rc_circuit_solver.dart`
    - `thermal_dynamics_solver.dart`
- **`test/`**: Contains unit and widget tests.
  - `widget_test.dart`: Example widget test.
- **Platform-specific directories**:
  - `android/`: Android build and configuration files.
  - `ios/`: iOS-specific assets and configurations.
  - `web/`: Web-specific files (e.g., `index.html`).
  - `linux/`, `macos/`, `windows/`: Desktop configurations and assets.

## Installation and Setup

### Prerequisites

- Install [Flutter](https://flutter.dev/) and set up your development environment.
- Ensure platform-specific dependencies are installed:
  - Android: Android Studio with SDK setup.
  - iOS: Xcode for macOS.
  - Web: A modern web browser.
  - Desktop: Required build tools for Linux, macOS, or Windows.

## Getting Started

To get started with the Euler's Method Solver App, follow these steps:

1. **Clone the Repository**
   ```bash
   git clone https://github.com/Azrul16/eulers-method-solver-app.git

2. **Step 2: Navigate to the Project Directory**
   ```bash
   cd eulers-method-solver-app
   ```
3. **Step 3: Install Flutter Dependencies**
   ```bash
   flutter pub get
   ```
4. **Step 4: Run the app**
   ```bash
   flutter run
   ```