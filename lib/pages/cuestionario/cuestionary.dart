import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_resident/controllers/cuestionary_controller.dart';
import 'package:home_resident/pages/cuestionario/componentes/body_cuestionary.dart';

import 'componentes/score_screen.dart';

class Cuestionary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CuestionaryController _controller = Get.put(CuestionaryController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Fluttter show the back button automatically
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: (){
                _controller.checkAns();
                _controller.cargaBD();
              },
              child: Text("Skip")),
        ],
      ),
      body: BodyCuestionary(),
    );
  }
}
