import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:home_resident/models/question_cuestionary_model.dart';
import 'package:home_resident/models/selected_model.dart';
//import 'package:home_resident/models/question_model.dart';
import 'package:home_resident/pages/cuestionario/componentes/score_screen.dart';
//import 'package:quiz_app/models/Questions.dart';
//import 'package:quiz_app/screens/score/score_screen.dart';

// We use get package for our state management

class CuestionaryController extends GetxController
    with SingleGetTickerProviderMixin {
  /*
  // Lets animated our progress bar

  AnimationController _animationController;
  Animation _animation;
  // so that we can access our animation outside
  Animation get animation => this._animation;
  */
  PageController _pageController;
  PageController get pageController => this._pageController;

  List<QuestionCuestionary> _questions = sample_data
      .map(
        (question) => QuestionCuestionary(
        id: question['id'],
        question: question['question'],
        options: question['options'],
        answer: question['answer_index'],
        answerSelected: [],
        ),
  )
      .toList();
  List<QuestionCuestionary> get questions => this._questions;
/*
  void questionsAnswer(List<int> selectedAnswer, int index) {
    _questions[index].selectedAnswer = selectedAnswer;
  }
*/
  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;
/*
  // ignore: deprecated_member_use
  List<Selected> _answerSelected = [];
  List<Selected> get selectedAnswer => this._answerSelected;

  set answerSelected(List<Selected> value) {
    _answerSelected = value;
  }
*/
  List<int> _correctAns;
  List<int> get correctAns => this._correctAns;

  // ignore: deprecated_member_use
  List<int> _selectedAns = List();
  List<int> get selectedAns => this._selectedAns;

  // for more about obs please check documentation
  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  // called immediately after the widget is allocated memory
  @override
  void onInit() {
    /*
    // Our animation duration is 60 s
    // so our plan is to fill the progress bar within 60s
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });

    // start our animation
    // Once 60s is completed go to the next qn
    _animationController.forward().whenComplete(nextQuestion);
    */
    _pageController = PageController();
    super.onInit();
  }

  // // called just before the Controller is deleted from memory
  @override
  void onClose() {
    super.onClose();
    //_animationController.dispose();
    _pageController.dispose();
  }
  /*
  void checkAns(QuestionCuestionary question, List<int> selectedIndex) {
    // because once user press any option then it will run
    int _count = 0;
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;
    for(int item1 in _correctAns) {
      for(int item2 in _selectedAns) {
        if (_correctAns == _selectedAns) _count++;
      }
    }
    _numOfCorrectAns = (_count*10/_numOfCorrectAns).round();
    //if (_correctAns == _selectedAns) _numOfCorrectAns++;

    // It will stop the counter
    //_animationController.stop();
    update();
    // Once user select an ans after 3s it will go to the next qn
    Future.delayed(Duration(seconds: 3), () {
      nextQuestion();
    });
  }
  */
  void checkAns(QuestionCuestionary question, int selectedIndex, int page) {
    // because once user press any option then it will run
    //print(questionNumber);
    //print(_pageController.page.toString());
    _isAnswered = true;
    _correctAns = question.answer; // esta es una lista
    //_selectedAns.add(selectedIndex) ;
    //print(_selectedAns.toString());
    //_questions[page].answerSelected.add(selectedIndex);
    if(_questions[page].answerSelected.contains(selectedIndex)){
      _questions[page].answerSelected.remove(selectedIndex);
      //print(_questions[page].answerSelected.length);
      //_questions[page].answerSelected.add(selectedIndex);
    }else{
      _questions[page].answerSelected.add(selectedIndex);
      //print(_questions[page].answerSelected.length);
      //_questions[page].answerSelected.remove(selectedIndex);
    }
    //_questions.forEach((element)=> print(element.selectedAnswer.toString()));

    /*if(_questions[page].answerSelected.length > 0){
      for(int item in _questions[page].answerSelected){
        if(item == selectedIndex){
          _questions[page].answerSelected.remove(item);
        }
      }
    } else {
      _questions[page].answerSelected.add(selectedIndex);
    }*/
    update();
    /*for(Selected item in _answerSelected){
      print(item.selectedAns.toString());
    }*/

    /*Future.delayed(Duration(seconds: 3), () {
      nextQuestion();
    });*/
  }
 /* void carga(){
    _answerSelected.add(Selected(_selectedAns));
  }*/
  void nextQuestion() {
    //_answerSelected.add(Selected(selectedAns));
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      //_answerSelected.add(Selected(_selectedAns));
      //_answerSelected.add(Selected(selectedAns));

      _selectedAns.clear();

      /*_pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease
      );*/

      // Reset the counter
      //_animationController.reset();

      // Then start it again
      // Once timer is finish go to the next qn
      //_animationController.forward().whenComplete(nextQuestion);
    }
    /*else {
      // Get package provide us simple way to naviigate another page
      Get.to(ScoreScreen());
      //_questions.forEach((element)=> print(element));
    }*/

  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
