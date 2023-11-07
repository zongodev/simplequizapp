import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/Model/questions.dart';
import 'package:quizapp/Widgets/progress_bar.dart';
import 'package:quizapp/Widgets/question_card.dart';

import '../Controllers/question_controller.dart';
import 'option.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    QuestionController question = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () =>question.nexQuestion(),
            child: const Text(
              "Skip",
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body:  Stack(
        children: [
          SizedBox(
            height: double.infinity,
            child: Image.asset(
              "assets/images/bg1.jpg",
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: ProgressBar(),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Obx(
                    () =>  Text(
                      "Question   ${question.questionNbr.value}/${question.questions.length}",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: PageView.builder(
                    controller: question.pagecontroller,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged:(value) => question.updateqn(),
                    itemCount: question.questions.length,
                    itemBuilder: (BuildContext context, int index) {
                      return  QuestionCard(question: question.questions[index],);
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
