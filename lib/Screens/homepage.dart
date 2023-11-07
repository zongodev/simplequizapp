import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/Screens/question_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            child: Image.asset(
              "assets/images/bg1.jpg",
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text("Let's learn Flutter",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  //Text("Enter your name",style: GoogleFonts.aboreto(fontSize: 15,fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextField(
                    maxLength: 20,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      hintText: "Full name",
                      label: Text(
                        "Enter your name please",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff402f0c)),
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Get.to(const QuestionScreen()),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffe5e0e2).withOpacity(0.8),
                        foregroundColor: const Color(0xff402f0c),
                        padding: const EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        textStyle:GoogleFonts.robotoMono(fontWeight: FontWeight.w600,fontSize: 20 )
                      ),
                      child: const Text("Start Quiz"),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
