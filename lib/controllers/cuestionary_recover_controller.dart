import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_resident/models/cuestionario_model.dart';
import 'package:home_resident/models/question_cuestionary_model.dart';
import 'package:home_resident/models/recover_cuestionary_list.dart';

class CuestionaryRecoverController extends GetxController
    with SingleGetTickerProviderMixin {
  PageController _pageController;
  PageController get pageController => this._pageController;

  List<QuestionCuestionary> _questions = sample_data
      .map(
        (question) => QuestionCuestionary(
        id: question['id'],
        question: question['question'],
        image: question['image'],
        options: question['options'],
        answer: question['answer_index'],
        answerSelected: [],
        //score: 0,
        ),
  ).toList();
  //List<QuestionCuestionary> get questions => this._questions;
  RecoverCuestionaryList recover = Get.put(RecoverCuestionaryList());
  List<QuestionCuestionary> get questions => recover.questions;

  Cuestionario _cuestionario = Cuestionario();
  Cuestionario get cuestionario => this._cuestionario;
  set cuestionario(Cuestionario value) {
    _cuestionario = value;
  }

  int _alumno;
  int get alumno => this._alumno;
  set alumno(int value) {
    _alumno = value;
  }

  int _puntos = 0;
  int get puntos => this._puntos;
  set puntos(int value) {
    _puntos = value;
  }

  int _puntosCuestionario = 0;
  int get puntosCuestionario => this._puntosCuestionario;
  set puntosCuestionario(int value) {
    _puntosCuestionario = value;
  }

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;
  bool _isAnsweredCorrect = true;
  bool get isAnsweredCorrect => this._isAnsweredCorrect;

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

  @override
  void onInit() {
    super.onInit();
    _pageController = PageController();
  }

  @override
  void onClose() {
    super.onClose();
    _pageController.dispose();
  }

  void nextQuestion() {
    if (_questionNumber.value != questions.length) {
      _isAnswered = false;
      _selectedAns.clear();
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }

  void Total() {
    int total = 0;
    int totalC = 0;
    for(int a=0; a<recover.questions.length; a++){
      totalC += recover.questions[a].assignedScore;
    }
    for(int b=0; b<recover.cuestionaryRecover.length; b++){
      total += recover.cuestionaryRecover[b].scoreQuestion;
    }
    puntosCuestionario = total;
    puntos = totalC;
  }
}