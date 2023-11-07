import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/Controllers/question_controller.dart';

class ScorreScreen extends StatelessWidget {
  const ScorreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              child: Image.asset(
                "assets/images/bg1.jpg",
                fit: BoxFit.fitHeight,
              ),
            ),
            Center(
              child: Column(
                children: [
                  const Spacer(),
                  Text("Your scorre is :",style: GoogleFonts.kanit(fontSize: 25,color:  Colors.black),),
                  const Spacer(),
                  Text("${_questionController.nubOfCorrectAns.value* 10 }/ ${_questionController.questions.length*10}",style: GoogleFonts.kanit(fontSize: 25,color:  Colors.white),),
                  const Spacer(),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
