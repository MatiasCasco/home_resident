import 'package:get/get.dart';
import 'package:home_resident/pages/reto/pregunta/quiz.dart';


class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds:6),(){
      Get.off(Quiz());
    });
  }
}