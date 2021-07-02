import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_resident/controllers/cuestionary_controller.dart';
import 'package:home_resident/models/recover_cuestionary_list.dart';
import 'package:home_resident/pages/splash_page_get.dart';

class ChooseCuestionaryRecover extends StatelessWidget {
  RecoverCuestionaryList recover = Get.put(RecoverCuestionaryList());
  int id;
  ChooseCuestionaryRecover({@required this.id});

  @override
  Widget build(BuildContext context) {

    final List<Widget> items = List.generate(
            recover.listTestConPuntaje.length,
            (index) => Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(width: 10, color: Colors.brown),
            color: Colors.transparent,
          ),
          //color: Colors.amber,
          child: TextButton(
            child: Column(
              children: [
                Text(
                  "Cuestionario N°${(index+1)} \n" + recover.listTestConPuntaje[index].nameMateria, style: TextStyle(fontSize: 30, color: Colors.teal),
                ),
                Text("${recover.listTestConPuntaje[index].descripcion.replaceAll("\"", "")}", style: TextStyle(fontSize: 26, color: Colors.green),),
                Text("Puntos: ${recover.listTestConPuntaje[index].puntos}", style: TextStyle(fontSize: 26, color: Colors.green),),
                Text(
                  "Fecha Apertura: ${recover.listTestConPuntaje[index].fechaApertura}\n" + "Fecha Cierre: ${recover.listTestConPuntaje[index].fechaCierre}" , style: TextStyle(fontSize: 18, color: Colors.cyanAccent),
                ),
              ],
            ),
            onPressed: () {
                  recover.loadTestRecover(recover.listTestConPuntaje[index].idCuestionario, id);
                  recover.loadTest(recover.listTestConPuntaje[index].idCuestionario);
                  Get.off(SplashPageGet(), arguments: {"Page":"BodyCuestionaryRecover","Cuestionario":recover.listTestConPuntaje[index], "Alumno": id, "Puntos": recover.listTestConPuntaje[index].puntos});
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
                title: Text('Seleccionar Cuestionario', style: TextStyle(fontSize:20, color: Colors.black87,),),
                iconTheme: IconThemeData(color: Colors.black, size: 25 ),
                backgroundColor: Colors.white,
                //floating: true,
                pinned: true,
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  //title: Text('Seleccionar Cuestionario a resolver', style: TextStyle(fontSize:30, color: Colors.black87,),),
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
