import 'package:get/get.dart';
import 'package:home_resident/models/cuestionario_model.dart';
import 'package:home_resident/pages/choose_cuestionary.dart';
import 'package:home_resident/pages/choose_matter.dart';
import 'package:home_resident/pages/cuestionario/cuestionary.dart';
import 'package:home_resident/pages/reto/pregunta/quiz.dart';

class SplashController extends GetxController {

  @override
  void onReady() {
    super.onReady();
    //final  argument = Get.arguments.toString();
    if(Get.arguments["Page"] == "Quiz"){
      Future.delayed(Duration(seconds:6),(){
        Get.off(Quiz(), arguments: {"Alumno": Get.arguments["Alumno"] as int});
      });
    }
    if(Get.arguments["Page"] == "ChooseMatter") {
      Future.delayed(Duration(seconds: 3),(){
        Get.off(ChosseMatter(), arguments: {"Alumno": Get.arguments["Alumno"] as int});
      });
    }
    if(Get.arguments["Page"] == "Cuestionary") {
      Future.delayed(Duration(seconds: 3),(){
        Get.off(Cuestionary(), arguments: {"Cuestionario":Get.arguments["Cuestionario"], "Alumno": Get.arguments["Alumno"], "Puntos": Get.arguments["Puntos"]});
      });
    }
    if(Get.arguments["Page"] == "ChooseCuestionary") {
      Future.delayed(Duration(seconds: 3),(){
        Get.off(ChooseCuestionary(id: Get.arguments["Alumno"]));
      });
    }
  }
}