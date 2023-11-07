

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quizapp/Model/questions.dart';
import 'package:quizapp/Screens/scorre.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  final RxInt _questionNbr = 1.obs;

  RxInt get questionNbr => _questionNbr;

  late final PageController _pagecontroller;

  PageController get pagecontroller => _pagecontroller;

  Animation get animation => _animation;
  final List<Questions> _question = data
      .map((e) => Questions(
          question: e["question"],
          answer: e["answer"],
          id: e["id"],
          options: e["options"]))
      .toList();

  bool _isAnswerd = false;

  bool get isAnswerd => _isAnswerd;

   int _correctAnswer =0;

  int get correctanswer => _correctAnswer;

  int? _selectedAnswer;

  int? get selectAnswer => _selectedAnswer;

  RxInt nubOfCorrectAns = 0.obs;

  void updateqn() {
    questionNbr.value++;
    update();
  }

  void checkans(Questions question, int selcectedIndex) {
    _isAnswerd = true;
    _correctAnswer = question.answer;
    _selectedAnswer = selcectedIndex;
    if (_correctAnswer == _selectedAnswer) {
      nubOfCorrectAns.value++;
      _animationController.stop();
      update();
    }
    Future.delayed(
      const Duration(seconds: 3),
      () {
        nexQuestion();
      },
    );
  }

  List<Questions> get questions => _question;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 30), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });
    _animationController.forward().whenComplete(() => nexQuestion());
    super.onInit();
    _pagecontroller = PageController();
  }

  void nexQuestion() {
    if (_questionNbr.value != questions.length) {
      _isAnswerd = false;
      pagecontroller.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);
      _animationController.reset();
      _animationController.forward().whenComplete(() => nexQuestion());
    }else{
      Get.to(const ScorreScreen());
    }
  }
  @override
  void onClose(){

  }
}
