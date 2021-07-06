import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:home_resident/controllers/cuestionary_controller.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';
//import 'package:quiz_app/controllers/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:home_resident/utils/constants.dart';
//import '../../../constants.dart';

class ProgressBarC extends StatelessWidget {
  const ProgressBarC({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int countS =0;
    int countM =0;
    int countH =0;
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF3F4768), width: 3),
        borderRadius: BorderRadius.circular(50),
      ),
      child: GetBuilder<CuestionaryController>(
        init: CuestionaryController(),
        builder: (controller) {
          //print(controller.animation.value);
          return Stack(
            children: [
              // LayoutBuilder provide us the available space for the conatiner
              // constraints.maxWidth needed for our animation
              LayoutBuilder(
                builder: (context, constraints) => Container(
                  // from 0 to 1 it takes 60s
                  width: constraints.maxWidth * controller.animation.value,
                  //width: constraints.maxWidth,
                  decoration: BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      controller.viewTemporizador?
                      SlideCountdownClock(duration: Duration(seconds: controller.Tiempo()), separator: ':', textStyle: TextStyle(color: Colors.white, fontSize: 20)):
                      Text("00 : 00 : 00",style: TextStyle(color: Colors.white, fontSize: 20),),
                      /*
                      Text(
                          "${controller.countH} hr "
                          +"${controller.countM} min "
                          +"${controller.countS} sec",
                          style: TextStyle(color: Colors.purpleAccent),
                      ),*/
                      WebsafeSvg.asset("assets/icons/clock.svg"),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
