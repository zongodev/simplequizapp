import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/Controllers/question_controller.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.white),
        borderRadius: BorderRadius.circular(15),
      ),
      child: GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (controller) {
          return Stack(
          children: [
            LayoutBuilder(
              builder: (context, constraints) => Container(
                width: constraints.maxWidth * controller.animation.value,
                decoration: BoxDecoration(
                  color: const Color(0xffd7c1b6),
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
             Positioned.fill(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${(controller.animation.value * 30 ).round()} sec",style: TextStyle(fontWeight: FontWeight.bold),),
                    Icon(Icons.timer_sharp),
                  ],
                ),
              ),
            )
          ],
        );
        },
      ),
    );
  }
}