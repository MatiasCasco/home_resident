import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_resident/controllers/cuestionary_controller.dart';
import 'package:home_resident/models/cuestionario_model.dart';
import 'package:home_resident/models/puntaje_cuestionario_model.dart';
import 'package:home_resident/models/recover_cuestionary_list.dart';
import 'package:home_resident/utils/dialogs.dart';
import 'splash_page_get.dart';

class ChooseCuestionary extends StatelessWidget {
  RecoverCuestionaryList recover = Get.put(RecoverCuestionaryList());
  //CuestionaryController controller = Get.put(CuestionaryController());
  int id;
  ChooseCuestionary({this.id});

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
            child: Column(
              children: [
                Text(
                  "Cuestionario N°${index + 1} \n"
                  + recover.cuestionarios[index].nameMateria.replaceAll("\"", "")
                  //+ "\n idC: ${recover.cuestionarios[index].idCuestionario}"
                  + "\n ${recover.cuestionarios[index].descripcion.replaceAll("\"", "")}"
                  , style: TextStyle(fontSize: 30, color: Colors.green),
                  //recover.materias[index].nameMateria, style: TextStyle(fontSize: 40, color: Colors.white38),
                ),
                Text(
                   "Puntos: ${recover.cuestionarios[index].puntos}"
                    + "\n Fecha Cierre: ${recover.cuestionarios[index].fechaCierre}"
                  , style: TextStyle(fontSize: 20, color: Colors.teal),
                  //recover.materias[index].nameMateria, style: TextStyle(fontSize: 40, color: Colors.white38),
                ),
              ],
            ),
            onPressed: () {
              //controller.alumno = id;
              //print('Este es el idAlumno en choose_cuestionary'+controller.alumno.toString());
              if(findCuestionary(id, recover.cuestionarios[index].idCuestionario)){
                noficacionResuelto();
              } else {
                if (!fechaEnTiempoCorrecto(
                    recover.cuestionarios[index])) {
                  noficacion(recover.cuestionarios[index].fechaApertura,
                      recover.cuestionarios[index].fechaCierre);
                } else {
                  recover.loadTest(recover.cuestionarios[index].idCuestionario);
                  Get.off(SplashPageGet(), arguments: {"Page":"Cuestionary","Cuestionario":recover.cuestionarios[index], "Alumno": id, "Puntos": recover.cuestionarios[index].puntos, "Tiempo": recover.cuestionarios[index].tiempoLimite});
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
                title: Text('Seleccionar Cuestionario', style: TextStyle(fontSize:20, color: Colors.black87,),),
                iconTheme: IconThemeData(color: Colors.black, size: 25),
                backgroundColor: /*Colors.teal*/Colors.white,
                //floating: true,
                pinned: true,
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  //title: Text('Seleccionar Cuestionario a resolver', style: TextStyle(fontSize:30, color: Colors.black87,),),
                  background: Image.asset("assets/test1.jpg", fit: BoxFit.cover,),
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

  bool fechaEnTiempoCorrecto(Cuestionario _test){
    bool value =  true;
    String cadena = "El test se encuentra disponible";
    int x = 0, y = 0;
    var now = new DateTime.now();
    x = now.compareTo( DateTime.parse(_test.fechaApertura));
    y = now.compareTo( DateTime.parse(_test.fechaCierre));
    if(x < 0 || y > 0) {
      cadena = "El test no se encuentra disponible";
      value = false;
    }
    return value;
  }

  bool findCuestionary(int idAlumno, int test){
    bool value = false;
    List<PuntajeCuestionario> _cuestionariosResueltos = recover.cuestionariosResueltos;
    if(_cuestionariosResueltos.isEmpty){
      value = false;
    }
    for(PuntajeCuestionario item in _cuestionariosResueltos){
      if(item.idAlumno == idAlumno && item.idCuestionario == test){
        value = true;
      }
    }
    return value;
  }
}
