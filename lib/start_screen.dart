import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz.png',
            width: 200,
            height: 200,
            color: const Color.fromARGB(150, 94, 3, 3),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Start Quiz All The Best",
            style: TextStyle(
                fontSize: 20, color: const Color.fromARGB(255, 94, 3, 3)),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            label: const Text("Start Quiz"),
            icon: const Icon(Icons.arrow_right),
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 236, 234, 234),
            ),
          )
        ],
      ),
    );
  }
}
