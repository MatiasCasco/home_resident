import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_resident/controllers/questions_controller.dart';
import 'package:home_resident/utils/constants.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35.0,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF3F4768), width: 3.0),
        borderRadius: BorderRadius.circular(50),
      ),
     child: GetBuilder<QuestionsController>(
        init: QuestionsController(),
        builder: (controller) {
          print(controller.animation.value);
          return Stack(
            children: [
              //LayoutBuilder nos proporciona el espacio disponible para las restricciones del contenedor.
              // MaxWidth necesario para nuestra animación
              LayoutBuilder(builder: (context, constraints)=> Container(
                // de 0 a 1 se necesitan 60 segundos
                width: constraints.maxWidth * controller.animation.value,
                decoration: BoxDecoration(
                  gradient: kPrimaryGradient,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),),
              Positioned.fill(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${(controller.animation.value * 60).round()} sec"),
                    WebsafeSvg.asset("assets/icons/clock.svg"),
                  ],
                ),
              ))
            ],
          );
        },),
    );
  }
}