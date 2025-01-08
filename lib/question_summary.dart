import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_project/question_summary/summary_item.dart';

class QuestionSummary extends StatelessWidget {
  QuestionSummary(this.sumarryList, {super.key});

  List<Map<String, Object>> sumarryList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: sumarryList.map((data) {
            return SummaryItem(data);
          }).toList(),
        ),
      ),
    );
  }
}
