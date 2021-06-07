import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_resident/controllers/cuestionary_recover_controller.dart';
import 'package:home_resident/models/recover_cuestionary_list.dart';
import 'package:home_resident/utils/constants.dart';

class OptionCuestionaryRecover extends StatelessWidget {
  const OptionCuestionaryRecover({
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
    RecoverCuestionaryList recover = Get.put(RecoverCuestionaryList());
    return GetBuilder<CuestionaryRecoverController>(
        init: CuestionaryRecoverController(),
        builder: (qnController) {
          Color getTheRightColor() {
            if(qnController.isAnsweredCorrect){
              if(recover.cuestionaryRecover[page].listIdR.contains(qnController.questions[page].listIdR[index]) &&
                  !qnController.questions[page].answer.contains(index)){
                return kRedColor;
              } else if (qnController.questions[page].answer.contains(index)) {
                return kGreenColor;
              }
            } 
            return kGrayColor;
          }

          IconData getTheRightIcon() {
            if(qnController.isAnsweredCorrect){
              return getTheRightColor() == kRedColor ? Icons.close : getTheRightColor() == kGreenColor && recover.cuestionaryRecover[page].listIdR.contains(qnController.questions[page].listIdR[index]) ? Icons.done : Icons.remove_done;
            }
          }

          return Material(
            child: InkWell(
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
            ),
          );
        });
  }
}
