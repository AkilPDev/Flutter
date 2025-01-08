import 'package:flutter/material.dart';

class ElevateButtonStyle extends StatelessWidget {
  const ElevateButtonStyle(
      {super.key, required this.answerText, required this.onTab});

  final String answerText;
  final void Function() onTab;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onTab,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            backgroundColor: const Color.fromARGB(255, 227, 70, 46),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40))),
        child: Text(
          answerText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
