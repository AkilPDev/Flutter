import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_project/data/question_custom_data.dart';
import 'package:quiz_project/elevate_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentIndex];
    // print('currentquestion ${currentQuestion.question}');
    // print('currentquestion ${currentQuestion.answerList.map((item) {
    //   print(item);
    // })}');
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.question,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 82, 27, 8))),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getSuffle().map((item) {
              return ElevateButtonStyle(
                answerText: item,
                onTab: () {
                  answerQuestion(item);
                },
                // onTab: () {
                //   print('object');
                // }
              );
            }),
          ],
        ),
      ),
    );
  }
}
