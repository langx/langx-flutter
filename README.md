# langx-flutter

Here is the Flutter-based version of the LangX application, originally developed using the Ionic Angular framework.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Tech Stack

- Language: [Dart](https://dart.dev/)
- Framework: [Flutter](https://flutter.dev/)
- State Management: [Riverpod](https://riverpod.dev/)
- BaaS: [Appwrite](https://appwrite.io/)

## Installation

### Prerequisites

- **Flutter SDK:** Ensure that you have the Flutter SDK installed. If not, follow the instructions here to install it.
- **Dart SDK:** Dart is included with the Flutter SDK.
- **IDE:** It is recommended to use an IDE like Visual Studio Code or Android Studio with the Flutter and Dart plugins installed.
- **Emulator/Simulator:** Have an emulator (Android or iOS) or a physical device set up for testing.

---

- Homebrew (macOS)

```sh
brew install flutter
```

- Chocolatey (Windows):

```choco
> choco install flutter
```

- Snap (Linux):

```sh
sudo snap install flutter --classic
```

- APT (Debian/Ubuntu):

```sh
sudo apt install flutter
```

### Clone the Repository

If you haven't already cloned the repository, you can do so with the following command:

```bash
git clone https://github.com/langx/langx-flutter.git
cd langx-flutter
```

### Install Dependencies

Navigate to the project directory and install the necessary dependencies:

```bash
flutter pub get
```

### Configure the Project

Ensure that the project configuration is correct and any necessary environment variables or settings are set up.

### Running the Project

To run the project on an emulator or physical device, use the following command:

```bash
## chrome
flutter run -d chrome
## or
flutter run -d <device_id>
```

### Testing the Project

To run the tests for the project, use the following command:

```bash
$ flutter test
00:04 +1: All tests passed!
```

### Additional Commands

**Analyzing Code:**

```sh
$ flutter analyze
Analyzing langx-flutter...
No issues found! (ran in 0.7s)
```

**List Devices:**

```sh
flutter devices
```

### Setting Up IDE

If you are using Visual Studio Code or Android Studio, make sure to install the Flutter and Dart plugins to enhance your development experience.

- **Visual Studio Code:** Install the Flutter and Dart extensions from the Extensions Marketplace.
- **Android Studio:** Install the Flutter and Dart plugins from the Plugin Preferences.

With these steps, you should be able to build, run, and test the 'langx-flutter' project. Let me know if you encounter any issues or need further assistance!

## Build and Deploy

### Building the Project

To build the project for different platforms, use the following commands:

- **Android:**

  ```bash
  flutter build apk
  ```

- **iOS:**

  ```bash
  flutter build ios
  ```

- **Web:**

  ```bash
  flutter build web
  ```

### Deploying the Project

To deploy the project to different platforms, follow the official documentation for each platform.
