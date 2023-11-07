import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/Controllers/question_controller.dart';

class Option extends StatelessWidget {
  const Option({
    super.key,
    required this.text,
    required this.index,
    required this.press,
  });

  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      init: QuestionController(),
      builder: (controller) {
        Color getColors() {
          if (controller.isAnswerd) {
            if (controller.correctanswer == index) {
              return Colors.green;
            } else if (index == controller.selectAnswer &&
                controller.correctanswer != controller.selectAnswer) {
              return Colors.red;
            }
          }
          return Colors.black;
        }

        return InkWell(
          onTap: press,
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: getColors()),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      // "1 - ${data[0]["options"][0]}",
                      "${index + 1} - $text",
                      style:
                          GoogleFonts.rubik(color: getColors(), fontSize: 15),
                    ),
                  ),
                  Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: getColors()),
                    ),
                    child: getColors() == Colors.green
                        ? Icon(
                            Icons.check,
                            color: getColors(),
                          )
                        : getColors() == Colors.red
                            ? Icon(Icons.close, color: getColors())
                            : null,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
