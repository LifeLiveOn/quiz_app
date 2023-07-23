import 'package:flutter/material.dart';
import 'package:quiz_app/result/user_anser.dart';
import 'correct_answer.dart';

/// The `QuestionsSummary` widget displays a summary of the user's answers and the correct answers.
///
/// This widget is used to display the summary of user responses and the corresponding
/// correct answers after completing the quiz. It takes the [summaryData] parameter, which
/// is a list of maps containing the following information for each question:
/// - 'question_index': The index of the question.
/// - 'question': The text of the question.
/// - 'user_answer': The user's selected answer.
/// - 'correct_answer': The correct answer to the question.
class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({Key? key, required this.summaryData}) : super(key: key);

  /// A list of maps containing the summary data for each question.
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: summaryData.length,
        itemBuilder: (context, index) {
          final data = summaryData[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Adding a circular avatar around the question index.
                CircleAvatar(
                  radius: 15,
                  backgroundColor: (data['user_answer'] == data['correct_answer']
                      ? Colors.cyan
                      : Colors.pink),
                  child: Text(
                    '${data['question_index']}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // Add some spacing between the index and question.
                const SizedBox(height: 5),
                // Break the text line vertically using an expanded widget.
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${data['question']}',
                        style: const TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      const SizedBox(height: 5),
                      UserAnswer(data: '${data['user_answer']}'),
                      CorrectAnswer(data: '${data['correct_answer']}'),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
