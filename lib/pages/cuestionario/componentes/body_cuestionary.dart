import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_resident/controllers/cuestionary_controller.dart';
import 'package:home_resident/models/selected_model.dart';
import 'package:home_resident/pages/cuestionario/componentes/progress_bartC.dart';
//import 'package:quiz_app/constants.dart';
//import 'package:quiz_app/controllers/question_controller.dart';
//import 'package:quiz_app/models/Questions.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:home_resident/utils/constants.dart';

import 'cuestionary_card.dart';
//import 'progress_bar.dart';
//import 'question_card.dart';

class BodyCuestionary extends StatelessWidget {
  const BodyCuestionary({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
    //QuestionController _questionController = Get.put(QuestionController());
    CuestionaryController _cuestionaryController = Get.put(CuestionaryController());
    return GetBuilder<CuestionaryController>(
      init: _cuestionaryController,
      builder: (_) => Stack(
          children: [
            Image.asset("assets/icons/fondo.png", fit: BoxFit.fill, width: double.maxFinite,),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: ProgressBarC(),
                  ),
                  SizedBox(height: kDefaultPadding),
                  Obx(
                      ()=> Text.rich(TextSpan(
                        text: "Score: ${_cuestionaryController.questions[(_cuestionaryController.questionNumber.value-1)].score}/${_cuestionaryController.questions[(_cuestionaryController.questionNumber.value-1)].assignedScore}",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(color: kSecondaryColor),
                      )),
                  ),
                  /*Text(
                    //${_cuestionaryController.questions[(_cuestionaryController.questionNumber.value-1)].score}
                    "Score: ${_cuestionaryController.questionNumber}/${_cuestionaryController.puntos}"
                  ),*/
                  SizedBox(height: kDefaultPadding),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Obx(
                          () => Text.rich(
                        TextSpan(
                          text:
                          "Question ${_cuestionaryController.questionNumber.value}",
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(color: kSecondaryColor),
                          children: [
                            TextSpan(
                              text: "/${_cuestionaryController.questions.length}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(color: kSecondaryColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(thickness: 1.5),
                  SizedBox(height: kDefaultPadding),
                  Expanded(
                    child: PageView.builder(
                      // Block swipe to next qn
                      //physics: NeverScrollableScrollPhysics(),
                      allowImplicitScrolling: true,
                      onPageChanged: _cuestionaryController.updateTheQnNum,
                      itemCount: _cuestionaryController.questions.length,
                      /*itemBuilder: (context, index) => CuestionaryCard(
                          question: _cuestionaryController.questions[index]),*/

                      itemBuilder: (context, index) {
                        //_cuestionaryController.carga();
                        _cuestionaryController.nextQuestion();
                        return CuestionaryCard(
                            question: _cuestionaryController.questions[index],
                            page: index,
                        );

                      }
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
    );
  }
}
