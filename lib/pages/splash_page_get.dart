
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:home_resident/controllers/splahs_controller.dart';

class SplashPageGet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SplashController(),
        builder: (_)=>Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
        ) ,
    ));
  }
}

