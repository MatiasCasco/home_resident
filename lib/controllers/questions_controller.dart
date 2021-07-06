import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:home_resident/models/question_model.dart';
import 'package:home_resident/models/recover_questions_list.dart';
import 'package:home_resident/pages/home_page.dart';
import 'package:home_resident/pages/reto/puntaje/score.dart';

//Open screens/snackbars/dialogs without context, manage states and inject dependencies easily with GetX.
class QuestionsController extends GetxController
    with SingleGetTickerProviderMixin {
  // Vamos a darles efectos de sonido
  final play =AudioCache();
  AudioPlayer player;
  //AudioPlayer audioPlayer = AudioPlayer();
  // Vamos animar nuestro progress bar
  AnimationController _animationController;
  Animation _animation;

  // para que podamos acceder a nuestra animación outside
  Animation get animation => this._animation;

  PageController _pageController;

  PageController get pageController => this._pageController;

  RecoverQuestionsList recover = Get.put(RecoverQuestionsList());

  List<Question> get questions => recover.questions;

  bool _isAnswered = false;

  bool get isAnswered => this._isAnswered;

  int _alumno;

  int get alumno => this._alumno;

  set alumno(int value) {
    _alumno = value;
  }

  String _curso;

  String get curso => this._curso;

  set curso(String value) {
    _curso = value;
  }

  String _email;

  String get email => this._email;

  set email(String value) {
    _email = value;
  }

  String _name;

  String get name => this._name;

  set name(String value) {
    _name = value;
  }
  bool _response = false;

  bool get response => this._response;

  set response(bool value){
    _response = value;
  }

  String _materia;

  String get materia => this._materia;

  set materia(String value) {
    _materia = value;
  }

  int _correctAns;

  int get correctAns => this._correctAns;

  int _selectedAns;

  int get selectedAns => this._selectedAns;

  RxInt _questionNumber = 1.obs;

  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;

  int get numOfCorrectAns => this._numOfCorrectAns;

  // llamado inmediatamente después de que se asigna memoria al widget
  @override
  void onInit() {
    //_questions  = Get.arguments;
    print("onInit controller questions");
    print(recover.questions.toString());
    print(questions);
    print("Cargar la lista con nuestra api");

    // La duración de nuestra animación es de 60 segundos.
    // por lo que nuestro plan es llenar la barra de progreso en 60 segundos
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // actualizar setState
        update();
      });
    // Comenzar nuestra animacion
    // Una vez que se completen los 60 seg, pase al siguiente pregunta
    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onReady() {
    print("onReady controller questions");
    print(recover.questions.toString());
    print(questions);
    super.onReady();
  } // Llamado justo antes de que el controlador se elimine de la memoria
  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
    play.clearCache();
  }

  void checkAns(Question question, int selectedIndex) {
    // porque una vez que el usuario presione cualquier opción, se ejecutará
    _response = true;
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;
    if (_correctAns == _selectedAns) {
      _numOfCorrectAns++;
      //play.play('sound/correcto.mp3');
      if(materia?.toLowerCase() == "Guarani"?.toLowerCase()){
        play.play('sound/bien1.mp3');
      } else {
        play.play('sound/correcto.mp3');
      }
    } else {
      //final play =AudioCache();
      //play.play('sound/error.mp3');
      if(materia?.toLowerCase() == "Guarani"?.toLowerCase()) {
        play.play('sound/mal1.mp3');
      } else {
        play.play('sound/error.mp3');
      }
    }
    // Detendrá el contador
    _animationController.stop();
    update();
    // Una vez que el usuario seleccione una opción después de 3 seg,
    // pasara a la siguiente pregunta
    Future.delayed(Duration(seconds: 5), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != recover.questions.length) {
    //if (_questionNumber.value != _questions.length) {
      _response = false;
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(microseconds: 250), curve: Curves.ease);
      // Reiniciar el contador
      _animationController.reset();
      // Entonces empieza de nuevo
      // El tiempo es finalizado al ir a la siguiente pregunta
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      // Detendrá el contador
      _animationController.stop();
      // Obtener paquete nos proporciona una forma sencilla de cambiar otra página
      Get.off(Score());
      //play.loop('sound/finish.mp3');
      _playFile();
      Future.delayed(Duration(seconds: 5), () {
        _stopFile();
        Get.off(HomePage(), arguments: {"alumno": alumno,"curso": curso,"email":email, "name":name});
      });
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }

  void back(){
    // Detendrá el contador
    _animationController.stop();
    _animationController.reset();

  }

  void _playFile() async{
    player = await play.loop('sound/finish.mp3');
  }

  void _stopFile(){
    player?.stop();
  }
}
