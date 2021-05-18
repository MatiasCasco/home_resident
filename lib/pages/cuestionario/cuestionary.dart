import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_resident/controllers/cuestionary_controller.dart';
import 'package:home_resident/pages/cuestionario/componentes/body_cuestionary.dart';

import 'componentes/score_screen.dart';
//import 'package:quiz_app/controllers/question_controller.dart';

//import 'components/body.dart';

class Cuestionary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //QuestionController _controller = Get.put(QuestionController());
    CuestionaryController _controller = Get.put(CuestionaryController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Fluttter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: (){
                 //Get.to(ScoreScreen());
                _controller.checkAns();
                //Get.to(Cuestionary());
              },
              //onPressed: _controller.nextQuestion(),
              child: Text("Skip")),
        ],
      ),
      body: BodyCuestionary(),
    );
  }
}
