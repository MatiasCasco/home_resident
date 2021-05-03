import 'package:get/get.dart';
import 'package:home_resident/pages/choose_matter.dart';
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
      Future.delayed(Duration(seconds: 2),(){
        Get.off(ChosseMatter());
      });
    }
  }
}