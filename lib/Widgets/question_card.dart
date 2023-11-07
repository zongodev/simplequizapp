
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/Controllers/question_controller.dart';

import '../Model/questions.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.question,
  });

  final Questions question;

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Text(
              question.question,
              style: GoogleFonts.kanit(color: Colors.black, fontSize: 25),
            ),
            ...List.generate(
              question.options.length,
              (index) => Option(
                text: question.options[index],
                index: index,
                press: () {
                  _questionController.checkans(question, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
