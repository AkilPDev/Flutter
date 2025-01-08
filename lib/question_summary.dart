import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            return Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: data['correct_answer'] == data['user_answer']
                          ? const Color.fromARGB(222, 108, 2, 14)
                          : const Color.fromARGB(222, 231, 228, 228)
                      // color: Color.fromARGB(70, 80, 255, 30),
                      ),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: GoogleFonts.nunito(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(250, 9, 1, 1)),
                  ),
                ),
                const SizedBox(
                  height: 40,
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: GoogleFonts.nunito(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(222, 108, 2, 14)),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        data['correct_answer'] as String,
                        style: GoogleFonts.nunito(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(235, 7, 90, 31)),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        data['user_answer'] as String,
                        style: GoogleFonts.nunito(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(236, 230, 221, 222)),
                      )
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
