import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:home_resident/controllers/cuestionary_controller.dart';
import 'package:home_resident/utils/constants.dart';
//import 'package:quiz_app/controllers/question_controller.dart';
//import '../../../constants.dart';

class OptionCuestionary extends StatelessWidget {
  const OptionCuestionary({
    Key key,
    this.text,
    this.index,
    this.press,
    this.page,
  }) : super(key: key);
  final String text;
  final int index;
  final int page;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CuestionaryController>(
        init: CuestionaryController(),
        builder: (qnController) {
          Color getTheRightColor() {
            if(qnController.isAnsweredCorrect){
              //print("page $page");
              //for(int item1 in qnController.questions[page].answer) {
                //print("Respuesta $item1");
                //for(int item2 in qnController.questions[page].answerSelected) {
                //for(int i=0; i<qnController.questions[page].answerSelected.length; i++){
                  /*if (index == item1) {
                    return kGreenColor;
                  } else */
                   /* if (index == qnController.questions[page].answerSelected[i] &&
                      qnController.questions[page].answerSelected[i] != item1) { */
                  if(qnController.questions[page].answerSelected.contains(index) &&
                      !qnController.questions[page].answer.contains(index)){
                    return kRedColor;
                  } else if (qnController.questions[page].answer.contains(index)) {
                  //else if (index == item1) {
                      return kGreenColor;
                    }
                  //print("seleccionada ${qnController.questions[page].answerSelected[i]}");
                  /*if (item1 == qnController.questions[page].answerSelected[i]) {
                    return kGreenColor;
                  } else if(qnController.questions[page].answerSelected[i] != item1){
                    return kRedColor;
                  }*/
                //}
              //}
            } else if (qnController.isAnswered || qnController.questions[page].answerSelected.length > 0) {
              /*for(var i = 0; i < qnController.selectedAns.length; i++) {
                if (index == qnController.selectedAns[i]) {
                  return KOrangeColor;
                }
              }*/
              //print("Page: $page");
              for(var i = 0; i < qnController.questions[page].answerSelected.length; i++) {
                //print(qnController.questions[page].answerSelected[i]);
                if (index == qnController.questions[page].answerSelected[i]) {
                  return KOrangeColor;
                }
              }
             /* if (index == qnController.correctAns) {
                return kGreenColor;
              } else if (index == qnController.selectedAns &&
                  qnController.selectedAns != qnController.correctAns) {
                return kRedColor;
              }*/
            }
            return kGrayColor;
          }

          IconData getTheRightIcon() {
            if(qnController.isAnsweredCorrect){
              //return getTheRightColor() == kRedColor ? Icons.close : Icons.done;
              return getTheRightColor() == kRedColor ? Icons.close : getTheRightColor() == kGreenColor && qnController.questions[page].answerSelected.contains(index) ? Icons.done : Icons.remove_done;
              /*if(getTheRightColor() == kRedColor) return Icons.close;
              if(getTheRightColor() == kGreenColor){
                if(qnController.questions[page].answerSelected.contains(index)){
                  return Icons.done;
                } else {
                  return null;
                }
              }*/
            }
            if(qnController.isAnswered || qnController.questions[page].answerSelected.length > 0){
              return  getTheRightColor() == KOrangeColor ? Icons.ac_unit : null;
            }

          }

          return InkWell(
            onTap: press,
            child: Container(
              margin: EdgeInsets.only(top: kDefaultPadding),
              padding: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                border: Border.all(color: getTheRightColor()),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "${index + 1}. $text",
                      style: TextStyle(color: getTheRightColor(), fontSize: 16),
                    ),
                  ),
                  Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      color: getTheRightColor() == kGrayColor
                          ? Colors.transparent
                          : getTheRightColor(),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: getTheRightColor()),
                    ),
                    child: getTheRightColor() == kGrayColor
                        ? null
                        : Icon(getTheRightIcon(), size: 16),
                  )
                ],
              ),
            ),
          );
        });
  }
}
