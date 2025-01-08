import 'package:flutter/material.dart';
import 'package:quiz_project/data/question_custom_data.dart';
import 'package:quiz_project/question_screen.dart';
import 'package:quiz_project/question_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.choosenanser, required this.onRestart});

  final List<String> choosenanser;
  final void Function() onRestart;

  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenanser.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answerList[0],
        'user_answer': choosenanser[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final sumaryData = getSummary();
    final QuestionNumber = questions.length;
    final Answer = sumaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your Answer ${Answer} and ${QuestionNumber} question correctly!",
              style: GoogleFonts.nunito(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(222, 16, 4, 121)),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(getSummary()),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
              onPressed: onRestart,
              label: const Text('Restart Quiz'),
              icon: const Icon(Icons.refresh),
            )
          ],
        ),
      ),
    );
  }
}
