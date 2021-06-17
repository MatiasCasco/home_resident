import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_resident/models/recover_cuestionary_list.dart';
import 'package:home_resident/models/recover_questions_list.dart';
import 'splash_page_get.dart';

class ChooseMatterTest extends StatelessWidget {
  RecoverQuestionsList recuperar = Get.put(RecoverQuestionsList());
  RecoverCuestionaryList recover = Get.put(RecoverCuestionaryList());
  @override
  Widget build(BuildContext context) {
    final List<Widget> items = List.generate(
        recuperar.materiasTest.length,
        (index) => Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 10, color: Colors.white38),
                color: Colors.transparent,
              ),
              child: TextButton(
                child: Text(
                  recuperar.materiasTest[index].nameMateria,
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
                onPressed: () {
                  print(recuperar.materiasTest[index].idMateria.toString() + recuperar.materiasTest[index].nameMateria);
                  print("id alumno en welcome id: ${Get.arguments["Alumno"] as int} y el Curso: ${Get.arguments["Curso"]}");
                  recover.loadCuestionariosOFMateriaAndCurso(Get.arguments["Curso"] as String, recuperar.materiasTest[index].nameMateria);
                  recover.loadCuestionariosResueltos(Get.arguments["Alumno"] as int);
                  Get.off(SplashPageGet(), arguments: {"Page":"ChooseCuestionary", "Alumno": Get.arguments["Alumno"]});
                  //recuperar.load(recuperar.materias[index].nameMateria, Get.arguments["Curso"]);
                  //Get.to(SplashPageGet(),arguments: {"Page":"Quiz","Alumno": Get.arguments["Alumno"], "Materia": recover.materias[index].nameMateria, "Curso":Get.arguments["Curso"]});
                },
              ),
            ));
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/icons/fondo.png",
            fit: BoxFit.fill,
            width: double.maxFinite,
          ),
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                title: Text(
                  'Seleccionar Materia',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                ),
                iconTheme: IconThemeData(color: Colors.black, size: 25),
                backgroundColor: Colors.white,
                pinned: true,
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  background: Image.asset(
                    "assets/Asignatura.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SliverList(delegate: SliverChildListDelegate(items)),
            ],
          ),
        ],
      ),
    );
  }
}
