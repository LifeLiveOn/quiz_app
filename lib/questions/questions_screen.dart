import 'package:flutter/material.dart';
import '../data/questions.dart';
import 'answer_button.dart';
import 'package:google_fonts/google_fonts.dart';

/// The `QuestionScreen` widget represents the screen that displays quiz questions.
///
/// This widget is a StatefulWidget, allowing it to manage its own state. It receives a
/// callback function `selectedAnswer` as a parameter, which is called when the user
/// selects an answer. The callback function is used to notify the parent widget about
/// the selected answer and update the user's choices.
class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.selectedAnswer});

  /// A callback function triggered when the user selects an answer.
  final void Function(String answer) selectedAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var curQuestionIndex = 0;

  /// Handles the user's selection of an answer and updates the state accordingly.
  ///
  /// This function calls the `selectedAnswer` callback provided by the parent widget,
  /// passing the chosen [answer] as an argument. It then increments the [curQuestionIndex]
  /// to display the next question and rebuilds the widget to update the UI.
  void answerQuestion(String answer) {
    widget.selectedAnswer(answer);
    setState(() {
      curQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[curQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 187, 139, 249),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // Using ... to pass multiple widgets instead of passing them as one object.
            ...currentQuestion.shuffledAnswers.map((item) {
              return AnswerButton(
                answerText: item,
                onClick: () {
                  answerQuestion(item);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
