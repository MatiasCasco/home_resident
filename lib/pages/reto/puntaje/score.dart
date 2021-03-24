import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_resident/controllers/questions_controller.dart';
import 'package:home_resident/utils/constants.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Score extends StatelessWidget {
  //static final routeName = "score";
  @override
  Widget build(BuildContext context) {
    QuestionsController _qnController = Get.put(QuestionsController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Column(
            children: [
              Spacer(flex: 3,),
              Text(
                "Puntaje",
                style: Theme.of(context)
                .textTheme
                .headline3
                .copyWith(color: kSecondaryColor),
              ),
              Spacer(),
              Text(
                "${_qnController.correctAns * 10}/${_qnController.questions.length * 10}",
                style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color:  kSecondaryColor),
              ),
              Spacer(flex: 3,),
            ],
          ),
        ],
      ),
    );
  }
}
