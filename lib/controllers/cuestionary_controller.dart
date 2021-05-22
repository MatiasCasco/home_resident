import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:home_resident/api/test_api.dart';
import 'package:home_resident/models/cuestionario_model.dart';
import 'package:home_resident/models/puntaje_cuestionario_model.dart';
import 'package:home_resident/models/question_cuestionary_model.dart';
import 'package:home_resident/models/recover_cuestionary_list.dart';
import 'package:intl/intl.dart';


class CuestionaryController extends GetxController
    with SingleGetTickerProviderMixin {
  double tiempo = 0;
  int count = 0;
  int countS = 0;
  int countM = 0;
  int countH = 0;
  List hora = [];
  // Lets animated our progress bar
  AnimationController _animationController;
  Animation _animation;
  // so that we can access our animation outside
  Animation get animation => this._animation;
  AnimationController get animationController => this._animationController;
  PageController _pageController;
  PageController get pageController => this._pageController;

 /* List<QuestionCuestionary> _questions = sample_data
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
  )
      .toList();*/
  Cuestionario _cuestionario = Cuestionario();
  Cuestionario get cuestionario => this._cuestionario;

  set cuestionario(Cuestionario value) {
    _cuestionario = value;
  }

  RecoverCuestionaryList recover = Get.put(RecoverCuestionaryList());

  List<QuestionCuestionary> get questions => recover.questions;
  int _puntos = 0;
  int get puntos => this._puntos;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;
  bool _isAnsweredCorrect = false;
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

  // called immediately after the widget is allocated memory
  @override
  void onInit() {
    super.onInit();
    _cuestionario = Get.arguments["Cuestionario"] as Cuestionario;
    print(cuestionario.toString());
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        if ((_animation.value*60).round() > countS) {
          count++;
          countS++;
          if (countS == 60) {
            countM++;
            countS = 0;
            _animationController.repeat();
          } else if (countM == 60) {
            countH++;
            countM = 0;
          } else if (countH == 24) {
            countH = 0;
          }
          /*if (_animationController.isCompleted) {
            if (tiempo.round() != count) _animationController.repeat();
          }*/
          if (Tiempo() == count){
            _animationController.stop();
            checkAns();
            cargaBD();
          }

          update();

      }
        update();
      });


    // start our animation
    _animationController.forward();
    _pageController = PageController();
  }

   // called just before the Controller is deleted from memory
  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns() {
    _isAnsweredCorrect = true;
    _animationController.stop();
    for(int i=0; i < questions.length; i++) {
      int countCorrect = 0;
      int countIncorrect = 0;
      for(int item in questions[i].answerSelected){
        questions[i].answer.contains(item)?countCorrect++:countIncorrect++;
      }
      if(questions[i].answer.length == 1){
        if(countIncorrect==1 && countCorrect==1){
          questions[i].score = (questions[i].assignedScore*(1/3)).round();
        } else if((countIncorrect>1 && countCorrect==1)||(countIncorrect>=0 && countCorrect==0)){
          questions[i].score = 0;
        } else {
          questions[i].score = questions[i].assignedScore;
        }
      }
      if(questions[i].answer.length > 1){
        if(countIncorrect >= 0 && countCorrect == 0){
          questions[i].score = 0;
        } else if(countIncorrect >= 0 && countCorrect > 0){
          questions[i].score = (countCorrect*questions[i].assignedScore/questions[i].answer.length).round()-(countIncorrect*questions[i].assignedScore/questions[i].answer.length*(2/3)).round();
        }
      }
      _puntos +=  questions[i].score;
      print("puntos de la pregunta $i es : ${questions[i].score}");
    }
    print(puntos);
    update();
  }

  void markAns(QuestionCuestionary question, int selectedIndex, int page) {
    _isAnswered = true;
    if(questions[page].answerSelected.contains(selectedIndex)){
      questions[page].answerSelected.remove(selectedIndex);
    }else{
      questions[page].answerSelected.add(selectedIndex);
    }
    update();
  }
  int Tiempo(){
    hora = cuestionario.tiempoLimite.split('-');
    tiempo = (int.parse(hora[0])*3600/1)+(int.parse(hora[1])*60/1)+int.parse(hora[2]);
    return tiempo.round();
  }
  void cargaBD(){
    int idAlumno = 16;
    int test = cuestionario.idCuestionario;
    TestApi _testAPI = TestApi();
    for(int i=0; i < questions.length; i++) {
      for(int x=0; x < questions[i].answerSelected.length; x++) {
        // falta pasarle el id de la rta correccto
        _testAPI.addSelectedAnswer(idAlumno, questions[i].listIdR[questions[i].answerSelected[x]]);
        //print(questions[i].listIdR[questions[i].answerSelected[x]]);
      }
      _testAPI.addPuntajexPregunta(idAlumno, questions[i].idQuestion, questions[i].score);
      //print(questions[i].score);
    }
    _testAPI.addPuntajexCuestionario(idAlumno, test, puntos);
    //print(puntos);
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

  bool fechaEnTiempoCorrecto(Cuestionario _test){
    bool value =  true;
    String cadena = "El test se encuentra disponible";
    int x = 0, y = 0;
    var now = new DateTime.now();
    x = now.compareTo( DateTime.parse(_test.fechaApertura));
    y = now.compareTo( DateTime.parse(_test.fechaCierre));
    if(x < 0 || y > 0) {
      cadena = "El test no se encuentra disponible";
      value = false;
    }
    return value;
  }

  bool findCuestionary(int idAlumno, int test){
    bool value = false;
    List<PuntajeCuestionario> _cuestionariosResueltos = recover.cuestionariosResueltos;
    if(_cuestionariosResueltos.isEmpty){
      value = false;
    }
    for(PuntajeCuestionario item in _cuestionariosResueltos){
      if(item.idAlumno == idAlumno && item.idCuestionario == test){
        value = true;
      }
    }
    return value;
  }
}
