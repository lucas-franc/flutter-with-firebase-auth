# Flutter Firebase Authentication Sample

![Flutter version](https://img.shields.io/badge/Flutter-v3.7.0-blue?logo=flutter)
![Firebase](https://img.shields.io/badge/Firebase-orange?logo=firebase)

## Description

This Flutter application demonstrates the implementation of Firebase Authentication using Email/Password for user sign-in, sign-up, and password reset functionalities.

## Getting Started

### Prerequisites

- Flutter: Make sure you have Flutter installed. Refer to the official Flutter documentation for installation instructions: [Flutter Install](https://flutter.dev/docs/get-started/install)
- Firebase Account: You need a Firebase account to set up the Firebase project. Visit [Firebase](https://firebase.google.com/) to create an account if you don't have one.

### Installation

1. Clone the repository:
   `git clone https://github.com/lucas-franc/flutter-with-firebase-auth.git`

2. Change the current working directory:
   `cd your_repository`

3. Install dependencies:
   `flutter pub get`

4. Configure Firebase:
   - Create a new Firebase project in the Firebase console.
   - Add an Android app to your Firebase project and follow the provided instructions to download the `google-services.json` file. Place it in the `android/app` directory.
   - Add an iOS app to your Firebase project and follow the provided instructions to download the `GoogleService-Info.plist` file. Place it in the `ios/Runner` directory.
   - Enable Email/Password sign-in method in Firebase Authentication.

## Features

The application provides the following screens for user authentication:

- **Sign In**: Allows users to sign in using their registered email and password.
- **Sign Up**: Allows new users to create an account using their email and password.
- **Reset Password**: Allows users to reset their account password using their registered email.

## Dependencies

The main dependency used in this project is:

- `firebase_auth`: The FlutterFire plugin to integrate Firebase Authentication.

## Contributing

Contributions are welcome! If you find any bugs or want to enhance the application, feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
