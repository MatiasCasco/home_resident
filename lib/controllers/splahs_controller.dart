import 'package:get/get.dart';
import 'package:home_resident/pages/choose_matter.dart';
import 'package:home_resident/pages/cuestionario/cuestionary.dart';
import 'package:home_resident/pages/reto/pregunta/quiz.dart';


class SplashController extends GetxController {

  @override
  void onReady() {
    super.onReady();
    final argument = Get.arguments.toString();
    if(argument == "Quiz"){
      Future.delayed(Duration(seconds:6),(){
        Get.off(Quiz());
      });
    }
    if(argument == "ChooseMatter") {
      Future.delayed(Duration(seconds: 3),(){
        Get.off(ChosseMatter());
      });
    }
    if(argument == "Cuestionary") {
      Future.delayed(Duration(seconds: 3),(){
        Get.off(Cuestionary());
      });
    }
  }
}