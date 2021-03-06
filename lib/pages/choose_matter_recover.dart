import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_resident/models/recover_cuestionary_list.dart';
import 'package:home_resident/models/recover_questions_list.dart';

import 'splash_page_get.dart';

class ChooseMatterRecover extends StatelessWidget {
  RecoverQuestionsList recover = Get.put(RecoverQuestionsList());
  RecoverCuestionaryList recoverC = Get.put(RecoverCuestionaryList());
  @override
  Widget build(BuildContext context) {
    final List<Widget> items = List.generate(
        recover.materiasReto.length,
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
            child: Text(recover.materiasReto[index].nameMateria, style: TextStyle(fontSize: 40, color: Colors.white),),
            onPressed: () {
              recoverC.loadCuestionariosConPuntaje(Get.arguments['Alumno'] as int, recover.materiasReto[index].idMateria as int);
              //recoverC.loadCuestionariosResueltos(Get.arguments["Alumno"]);
              Get.off(SplashPageGet(), arguments: {"Page":"ChooseCuestionaryRecover", "Alumno": Get.arguments["Alumno"]});
            },
          ),
        ));
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/icons/fondo.png", fit: BoxFit.fill, width: double.maxFinite,),
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                title: Text('Seleccionar Materia', style: TextStyle(fontSize:20, color: Colors.black87,),),
                iconTheme: IconThemeData(color: Colors.black, size: 25 ),
                backgroundColor: Colors.white,
                //floating: true,
                pinned: true,
                //title: Center(child: Text('Seleccionar Materia', style: TextStyle(fontSize:40, color: Colors.black87),)),
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  //title: Text('Seleccionar Materia', style: TextStyle(fontSize:30, color: Colors.black87,),),
                  background: Image.asset("assets/test.jpeg",),
                ),
                //Image.asset("assets/asignaturas.png", fit: BoxFit.fitWidth,),
              ),
              SliverList(delegate: SliverChildListDelegate(items)),
            ],
          ),
        ],
      ),
    );
  }
}
