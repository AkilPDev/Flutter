import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryIndicator extends StatelessWidget {
  const SummaryIndicator(
      {super.key, required this.isCorrectAnswer, required this.questionIndex});

  final bool isCorrectAnswer;
  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isCorrectAnswer
              ? const Color.fromARGB(222, 108, 2, 14)
              : const Color.fromARGB(222, 231, 228, 228)
          // color: Color.fromARGB(70, 80, 255, 30),
          ),
      child: Text(
        ((questionIndex as int) + 1).toString(),
        style: GoogleFonts.nunito(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(250, 9, 1, 1)),
      ),
    );
  }
}
