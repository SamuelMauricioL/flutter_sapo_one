# flutter_sapo_one

## Table of Contents

- [Project Description](#project-description)
- [Prerequisites](#prerequisites)
- [Local Setup](#local-setup)
  - [Repository Cloning](#repository-cloning)
  - [Flutter Configuration](#flutter-configuration)
  - [Firebase Configuration](#firebase-configuration)
    - [Installing Firebase CLI](#installing-firebase-cli)
    - [Configuring Firebase Project](#configuring-firebase-project)
    - [Firebase Project Verification](#firebase-project-verification)
    - [Cloud Functions Deployment](#cloud-functions-deployment)
- [Running the Application](#running-the-application)
- [Cloud Functions](#cloud-functions)
  - [`sendVerificationCode`](#sendverificationcode)
- [Project Architecture](#project-architecture)
  - [Project Structure](#project-structure)
  - [Current Resources](#current-resources)

## Project Description

This is the repository for the Flutter project `flutter_sapo_one`. This application uses Firebase for email verification and data storage.

## Prerequisites

Before starting, make sure you have the following installed on your development machine:

- **Flutter:** 3.27.4 or higher.
- **Dart:** 3.6.2 or higher.
- **Firebase CLI:** 14.1.0 or higher.
- **Node.js and npm (or yarn):** 23.10.0 or higher.
- **Google Account:** permission granted for the `flutter_sapo_one` application to the Google account where the Firebase project `sapo-one` is hosted.
- **SendGrid Account and API Key:** SendGrid API Key already configured as an environment variable in the Firebase project `sapo-one`.

## Local Setup

Follow these steps to set up the project in your local environment:

### Repository Cloning

1.  Clone this repository to your local machine using Git:

    ```bash
    git clone https://github.com/SamuelMauricioL/flutter_sapo_one
    cd flutter_sapo_one
    ```

### Flutter Configuration

1.  Get the Flutter project dependencies:

    ```bash
    flutter pub get
    ```

### Firebase Configuration

1.  **Installing Firebase CLI:**

    - If you haven't already installed the Firebase CLI, run the following command:

      ```bash
      npm install -g firebase-tools
      ```

2.  **Configuring Firebase Project:**

    - Navigate to your Flutter project directory in the terminal and run the following command to connect to your existing Firebase project "sapo-one":

      ```bash
      flutterfire configure --project=sapo-one
      ```

    - Follow the prompts to select the platforms you are developing for. This command will generate the `firebase_options.dart` file in your `lib/` directory.

3.  **Firebase Project Verification:**

    - Ensure you have access to the Firebase console ([https://console.firebase.google.com/](https://console.firebase.google.com/)) and can select the `sapo-one` project.
    - Verify that the following services are enabled in the project:
      - Authentication
      - Cloud Firestore
      - Cloud Functions

4.  **Cloud Functions Deployment:** (optional)

    - Optional step as the cloud functions are already deployed for use.
    - Navigate to the `functions` directory of your project in the terminal:

      ```bash
      cd functions
      ```

    - Install the Cloud Functions dependencies:

      ```bash
      npm install
      ```

    - Deploy your Cloud Functions to Firebase:

      ```bash
      firebase deploy --only functions --project sapo-one
      ```

### Running the Application

1.  Run the Flutter application on your device or emulator:

    ```bash
    flutter run
    ```

## Cloud Functions

### `sendVerificationCode`

The `sendVerificationCode` Cloud Function, triggered via HTTPS callable, accepts an email address. It generates a six-digit verification code, sends it to the provided email using SendGrid, and stores the code along with a timestamp in a Firestore collection named `verificationCodes`, indexed by the email.

## Project Architecture

Clean architecture based-on-packages with a feature-first approach.

### Project Structure

```
|-- lib/
| |-- di/
| |-- app/
| | |-- view/
| | |-- widgets/
| |-- feature_1/
| | |-- di/
| | |-- widgets/
| | |-- view/
| | |-- bloc/
| |-- feature_2/
| |-- feature_x/
| |-- bootstrap.dart
| |-- main.dart

|-- packages/
| |-- core/
| | |-- so_ui
| | |-- so_utils
| |-- features/
| | |-- so_verification_data
| | |-- so_verification_domain
```

### Current Resources

- **State Management:** [flutter_bloc](https://pub.dev/packages/flutter_bloc) ([bloc](https://pub.dev/packages/bloc))
- **Object Comparison:** [equatable](https://pub.dev/packages/equatable)
- **Dependency Injection:** [get_it](https://pub.dev/packages/get_it)
- **UI Components (Internal Package):** `so_ui` (located at `packages/core/so_ui`)
- **Utility Functions (Internal Package):** `so_utils` (located at `packages/core/so_utils`)
- **Verification Feature - Data Layer (Internal Package):** `so_verification_data` (located at `packages/features/so_verification_data`)
- **Verification Feature - Domain Layer (Internal Package):** `so_verification_domain` (located at `packages/features/so_verification_domain`)
- **Firebase Core:** [firebase_core](https://pub.dev/packages/firebase_core)
- **Cloud Firestore:** [cloud_firestore](https://pub.dev/packages/cloud_firestore)
- **Cloud Functions for Firebase:** [cloud_functions](https://pub.dev/packages/cloud_functions)
- **Code Analysis:** [very_good_analysis](https://pub.dev/packages/very_good_analysis)

## Demo


https://github.com/user-attachments/assets/9fb8851c-c474-403d-b40e-89bb80e9a944


