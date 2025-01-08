import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiz_project/data/question_custom_data.dart';
import 'package:quiz_project/question_screen.dart';
import 'package:quiz_project/result_screen.dart';
import 'package:quiz_project/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> selectedAnswer = [];

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    // print('chooseanswer:${selectedAnswer.length} question ${questions.length}');
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartScreen() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'question-screen';
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        choosenanser: selectedAnswer,
        onRestart: restartScreen,
      );
    }

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(onSelectedAnswer: chooseAnswer);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 76, 190, 235),
              Color.fromARGB(255, 142, 209, 235),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: activeScreen == 'start-screen'
              ? StartScreen(switchScreen)
              : screenWidget,
        ),
      ),
    );
  }
}
