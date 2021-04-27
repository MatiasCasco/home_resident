import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:home_resident/controllers/questions_controller.dart';
import 'package:home_resident/pages/home_page.dart';
import 'componentes/body.dart';

class Quiz extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    QuestionsController _controller = Get.put(QuestionsController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text("Reto!"),
        leading: CupertinoButton(
          onPressed: (){
            _controller.back();
            //_controller.onClose();
            Get.off(HomePage());
          },
          padding: EdgeInsets.all(15),
          child: SvgPicture.asset("assets/icons/back.svg", width: 30,),),
        elevation: 0,
        actions: [
          TextButton(onPressed: _controller.nextQuestion, child: Text("Avanzar", style: TextStyle(color: Colors.black, fontSize: 25),),),
        ],
      ),
      body: Body(),
    );
  }
}


