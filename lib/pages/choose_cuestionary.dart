import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_resident/controllers/cuestionary_controller.dart';
import 'package:home_resident/models/cuestionario_model.dart';
import 'package:home_resident/models/recover_cuestionary_list.dart';
import 'package:home_resident/utils/dialogs.dart';

import 'splash_page_get.dart';

class ChooseCuestionary extends StatelessWidget {
  RecoverCuestionaryList recover = Get.put(RecoverCuestionaryList());
  CuestionaryController controller = Get.put(CuestionaryController());

  @override
  Widget build(BuildContext context) {
    void noficacion(String inicio, String fin) async{
      final isOk = await Dialogs.alert(context,
          title: "Test no disponible",
          body: "La disponibilidad del Test esta entre las fechas $inicio y $fin");
    }
    void noficacionResuelto() async{
      final isOk = await Dialogs.alert(context,
          title: "Completado",
          body: "El alumno ya tiene puntuacion en este test");
    }
    final List<Widget> items = List.generate(
        recover.cuestionarios.length,
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
            child: Text(
              "Cuestionario N°$index \n"
              + recover.cuestionarios[index].nameMateria, style: TextStyle(fontSize: 30, color: Colors.brown),
              //recover.materias[index].nameMateria, style: TextStyle(fontSize: 40, color: Colors.white38),
            ),
            onPressed: () {
              if(controller.findCuestionary(16, recover.cuestionarios[index].idCuestionario)){
                noficacionResuelto();
              } else {
                if (!controller.fechaEnTiempoCorrecto(
                    recover.cuestionarios[index])) {
                  noficacion(recover.cuestionarios[index].fechaApertura,
                      recover.cuestionarios[index].fechaCierre);
                } else {
                  recover.loadTest(recover.cuestionarios[index].idCuestionario);
                  Get.off(SplashPageGet(), arguments: {"Page":"Cuestionary","Cuestionario":recover.cuestionarios[index]});
                }
              }
              //recover.loadTest(recover.cuestionarios[index].idCuestionario);
              //Get.to(SplashPageGet(), arguments: {"Page":"Cuestionary","Cuestionario":recover.cuestionarios[index]});
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
                iconTheme: IconThemeData(color: Colors.black, size: 25 ),
                backgroundColor: Colors.teal,
                //floating: true,
                pinned: true,
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  title: Text('Seleccionar Cuestionario a resolver', style: TextStyle(fontSize:30, color: Colors.black87,),),
                  //background: Image.asset("assets/asignaturas.png", fit: BoxFit.fitWidth,),
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