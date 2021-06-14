import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_resident/models/recover_cuestionary_list.dart';
import 'package:home_resident/models/recover_questions_list.dart';
import 'package:home_resident/utils/constants.dart';
import 'splash_page_get.dart';

class WelcomeRanking extends StatelessWidget {
  String nameCurso;
  WelcomeRanking({this.nameCurso});
  RecoverQuestionsList recover = Get.put(RecoverQuestionsList());
  RecoverCuestionaryList recoverC = Get.put(RecoverCuestionaryList());

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = List.generate(
        recover.materias.length,
            (index) => Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(width: 10, color: Colors.white38),
            color: Colors.transparent,
          ),
          //color: Colors.amber,
          child: TextButton(
            child: Text(recover.materias[index].nameMateria, style: TextStyle(fontSize: 40, color: Colors.white),),
            onPressed: () {
              /* Asi seguir los comentarios para armar ranking con profesor en su propia app
              recoverC.loadRankingGlobal(nameCurso, recover.materias[index].nameMateria);
              Get.to(SplashPageGet(), arguments: {"Page":"RankingGlobal","Curso":nameCurso,"Materia":recover.materias[index].nameMateria});
              */
              Get.to(SplashPageGet(), arguments: {"Page":"Rankingnes","Curso":nameCurso,"Materia":recover.materias[index].nameMateria});
            },

          ),
        ));
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/icons/fondo.png", fit: BoxFit.fill, width: double.maxFinite,),
          CustomScrollView(
            slivers: <Widget>[
              SliverList(delegate: SliverChildListDelegate(items)),
            ],
          ),
        ],
      ),
    );
  }
}