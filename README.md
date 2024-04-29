# Libry - Package Manager App

Libry is a package manager application designed to streamline package discovery and management for developers.

## Launch Guide

### Prerequisites

- **Flutter**
- **Dart** 
- **Xcode**
- **Android Studio** 
- You can use **Visual Studio Code** with the Flutter and Dart plugins.
- Simulators: both Android and iOS development.

### Install the Local Emulator Suite

Before installing the Emulator Suite you will need:

1. *Node.js* version 16.0 or higher. [Download here](https://nodejs.org/en/download)
2. *Java JDK* version 11 or higher. [Download here](https://jdk.java.net/)

To install the Emulator Suite:
1. Install the Firebase CLI.
2. You will need CLI version 8.14.0 or higher to use the Emulator Suite. [Installation guide](https://firebase.google.com/docs/cli)

### Install and setup Patrol testing framework

1. To install Patrol testing framework follow installation guide below.
[Installation guide](https://patrol.leancode.co/getting-started)

## Steps to Launch the Application 

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/Vukan-Levi9/Flutter-praksa-2024-projekat.git
   ```

2. Create an API key at [libraries.io/api](https://libraries.io/api).

3. Add the API key to a `.env` file in the root directory of the project:

   ```plaintext
   API_KEY=YOUR_API_KEY_HERE
   ```

4. Run the following command to fetch the project dependencies:

   ```bash
   flutter pub get
   ```

5.  If you're using emulators for testing in debug mode, before running the project:
    - uncomment the following lines in main.dart:

    ```bash
      // import 'package:cloud_firestore/cloud_firestore.dart';
    
      if (kDebugMode) {
        // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
        // FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
      }
    ```
    
     - start emulators with the following command:
   
      ```bash
      firebase emulators:start
       ```
   
6. Build and run the Flutter project on your device or emulator:

   ```bash
   flutter run
   ```

## Steps to Launch Patrol tests

1. Repeat steps five and six from above first

2. Run following command to start Patrol tests:

   ```bash
   patrol test -t integration_test/example_test.dart
   ```
