import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_resident/controllers/questions_controller.dart';
import 'componentes/body.dart';

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionsController _controller = Get.put(QuestionsController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(onPressed: _controller.nextQuestion, child: Text("Avanzar", style: TextStyle(color: Colors.black),),)
        ],
      ),
      body: Body(),
    );
  }
}


