import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_resident/controllers/cuestionary_recover_controller.dart';
import 'package:home_resident/models/recover_cuestionary_list.dart';
import 'package:home_resident/utils/constants.dart';

import 'cuestionary_card_recover.dart';

class BodyCuestionaryRecover extends StatelessWidget {
  RecoverCuestionaryList recover = Get.put(RecoverCuestionaryList());
  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
    //QuestionController _questionController = Get.put(QuestionController());
    CuestionaryRecoverController _cuestionaryController = Get.put(CuestionaryRecoverController());
    return GetBuilder<CuestionaryRecoverController>(
      init: _cuestionaryController,
      builder: (_) => Stack(
        children: [
          Image.asset("assets/icons/fondo.png", fit: BoxFit.fill, width: double.maxFinite,),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                      () {
                        _cuestionaryController.Total();
                        return Text.rich(TextSpan(
                            text: "Puntos: ${recover
                                .cuestionaryRecover[(_cuestionaryController
                                .questionNumber.value - 1)]
                                .scoreQuestion}/${_cuestionaryController
                                .questions[(_cuestionaryController
                                .questionNumber.value - 1)].assignedScore}"
                                + " Total: ${_cuestionaryController
                                    .puntosCuestionario}/${_cuestionaryController.puntos}",
                            style: Theme
                                .of(context)
                                .textTheme
                                .headline4
                                .copyWith(color: kSecondaryColor)
                        ));
                      }
                ),
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
                        return CuestionaryCardRecover(
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
