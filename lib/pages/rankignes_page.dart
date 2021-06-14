import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_resident/models/recover_cuestionary_list.dart';
import 'package:home_resident/utils/constants.dart';

import 'splash_page_get.dart';

class Rankignes extends StatelessWidget {
  RecoverCuestionaryList recoverC = Get.put(RecoverCuestionaryList());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Lista de Materias"),
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: Container(
        height:  double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/icons/fondo.png"), fit: BoxFit.fill,)),
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/icon/fondo.png"),
              Spacer(),
              /*Container(
                  width: double.infinity,
                  height: 70,
                  color: Colors.red,
                  child: TextButton(
                    child: Text(
                      "Ranking Global",
                      style: TextStyle(fontSize: 25),
                    ),
                    onPressed: () {
                      recoverC.loadRankingGlobal(Get.arguments['Curso'], Get.arguments['Materia']);
                      Get.off(SplashPageGet(), arguments: {"Page": "RankingGlobal"});
                    },
                  ),
                ),*/
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.all(12.0 * 2),
                decoration: BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                child: TextButton(
                  child: Text(
                    "Ranking Global",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  onPressed: () {
                    recoverC.loadRankingGlobal(Get.arguments['Curso'], Get.arguments['Materia']);
                    Get.off(SplashPageGet(), arguments: {"Page": "RankingGlobal"});
                  },
                ),
              ),
              Spacer(),
              /*Container(
                  width: double.infinity,
                  height: 70,
                  color: Colors.red,
                  child: TextButton(
                    child: Text(
                      "Ranking por Cuestionario",
                      style: TextStyle(fontSize: 25),
                    ),
                    onPressed: () {
                      recoverC.loadCuestionariosOFMateria(Get.arguments['Curso'], Get.arguments['Materia']);
                      Get.off(SplashPageGet(), arguments: {"Page": "ChooseTest", "Curso":Get.arguments['Curso']});
                    },
                  ),
                ),*/
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.all(12.0 * 2),
                decoration: BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                child: TextButton(
                  child: Text(
                    "Ranking por Cuestionario",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  onPressed: () {
                    recoverC.loadCuestionariosOFMateria(Get.arguments['Curso'], Get.arguments['Materia']);
                    Get.off(SplashPageGet(), arguments: {"Page": "ChooseTest", "Curso":Get.arguments['Curso']});
                  },
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
