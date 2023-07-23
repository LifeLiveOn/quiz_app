import 'package:flutter/material.dart';
import 'package:quiz_app/questions/questions_screen.dart';
import 'package:quiz_app/result/result_screen.dart';

import '../data/questions.dart';
import '../main_screen.dart';

/// The `Quiz` widget represents the main quiz application.
///
/// This widget is a StatefulWidget, allowing it to manage its own state.
/// It keeps track of user choices, switches between different screens
/// (start-screen, questions-screen, and result-screen), and handles user input.
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

/// The private `_QuizState` class represents the state of the `Quiz` widget.
///
/// This class manages the state of the quiz application, including the user's choices,
/// the currently active screen, and the transition between different screens.
class _QuizState extends State<Quiz> {
  // Storing user choices.
  List<String> userChoices = [];

  // Variable to manage the active screen.
  var activeScreen = 'start-screen';

  /// Switches the screen to the 'questions-screen'.
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  /// Handles the user's choice of an answer.
  ///
  /// The chosen [answer] is added to the [userChoices] list.
  /// If the number of user choices matches the total number of questions,
  /// the screen is switched to the 'result-screen'.
  void chooseAnswer(String answer) {
    userChoices.add(answer);

    // Switch to the 'result-screen' when all questions are answered.
    if (userChoices.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  // Initializes the screen with the 'start-screen'.
  // If the user selects a button, switches to the 'questions-screen'.
  @override
  Widget build(context) {
    var screenWidget = activeScreen == 'start-screen'
        ? MainScreen(
            switchScreen) // Passing 'switchScreen' here so MainScreen can call this function when a change is noticed.
        : QuestionScreen(
            selectedAnswer:
                chooseAnswer); // Passing 'chooseAnswer' function here to add the selected answer to 'userChoices'.

    // If the active screen is 'result-screen', show the ResultScreen with the user's chosen answers.
    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(chosenAnswers: userChoices);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(238, 65, 1, 105),
                Color.fromARGB(226, 216, 95, 196),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget, // Display the appropriate screen widget based on the active screen.
        ),
      ),
    );
  }
}
