import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_resident/controllers/cuestionary_controller.dart';
//import 'package:quiz_app/constants.dart';
//import 'package:quiz_app/controllers/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:home_resident/utils/constants.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CuestionaryController _qnController = Get.put(CuestionaryController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/icons/fondo.png", fit: BoxFit.fill, width: double.maxFinite,),
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: kSecondaryColor),
              ),
              Spacer(),
              Text(
               // "${_qnController.correctAns * 10}/${_qnController.questions.length * 10}",
                /*_qnController.selectedAnswer[0].selectedAns.toString() +
                    _qnController.selectedAnswer[1].selectedAns.toString() +
                    _qnController.selectedAnswer[2].selectedAns.toString() +
                    _qnController.selectedAnswer[3].selectedAns.toString(),*/
                _qnController.questions[0].answerSelected.toString() +
                    _qnController.questions[1].answerSelected.toString() +
                    _qnController.questions[2].answerSelected.toString() +
                    _qnController.questions[3].answerSelected.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: kSecondaryColor),
              ),
              Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
