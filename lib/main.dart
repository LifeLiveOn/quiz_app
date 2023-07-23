import 'package:flutter/material.dart';
import 'package:quiz_app/questions/quiz.dart';

/// The main entry point of the application.
///
/// The `main` function is the starting point of the Flutter application.
/// It calls the `runApp` function to run the app, passing the root widget
/// of the application, which is the `Quiz` widget in this case.
void main() {
  runApp(
    const Quiz(),
  );
}
