import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// The `MainScreen` widget represents the main screen of the quiz application.
///
/// This screen displays the application logo, a message, and a "Start Quiz" button.
class MainScreen extends StatelessWidget {
  /// Constructs a `MainScreen` widget.
  ///
  /// The `startQuiz` parameter is a function that is called when the "Start Quiz"
  /// button is pressed. It allows the parent widget to control the navigation to
  /// the quiz screen.
  const MainScreen(this.startQuiz, {super.key});

  /// The callback function triggered when the "Start Quiz" button is pressed.
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(120, 239, 235, 235),
          ),
          const SizedBox(height: 100),
          Text(
            "Learn Flutter the fun Way!",
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz, // Call the function to switch to the quiz screen.
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            label: const Text("Start Quiz"),
            icon: const Icon(Icons.arrow_right_alt),
          ),
        ],
      ),
    );
  }
}
