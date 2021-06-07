import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_resident/controllers/cuestionary_controller.dart';
import 'package:home_resident/pages/cuestionario/componentes/body_cuestionary.dart';
import 'package:home_resident/utils/connection_status.dart';
import 'package:home_resident/utils/dialogs.dart';
import 'componentes/score_screen.dart';

class Cuestionary extends StatelessWidget {
  int _alumno = Get.arguments["Alumno"];
  @override
  Widget build(BuildContext context) {
    bool valor = false;
    CuestionaryController _controller = Get.put(CuestionaryController());
    Future<bool> _onBackPressed(){
      valor = _controller.valor;
      if(valor==true) {
        Navigator.pop(context, true);
        return null;
      } else {
        return showDialog(context: context, builder: (context)=>AlertDialog(
          title: Text("Solo podra salir del text al culminarlo"),
          actions: <Widget>[
            TextButton(child: Text("Aceptar"), onPressed: ()=> Navigator.pop(context, false),),
          ],
        ));
      }

    }
    void connectInternet(String title, String body) async{
      final isOk = await Dialogs.alert(context,
          title: title,
          body: body);
    }
    //CuestionaryController _controller = Get.put(CuestionaryController());
    _controller.puntosCuestionario =  Get.arguments["Puntos"];
    ConnectionStatus connect = Get.put(ConnectionStatus());
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          // Fluttter show the back button automatically
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            TextButton(
                onPressed: () async {
                  bool internet = true;
                  ConnectionStatus();
                  await Future.delayed(Duration(seconds: 3));
                  print('Connect Internet ${connect.isOnline}');
                  internet = connect.isOnline.value;
                  !internet?connectInternet('Conexion no disponible','No salga del test espera a que se restablesca conexion'):connectInternet('Almacenando Test','Inserccion exitosa');
                  if(internet){
                    print("Correcto ya puede insertar datos");
                    //connectInternet('Almacenando Test','Inserccion exitosa');
                    print("skip este es el id: "+_alumno.toString());
                    _controller.alumno =  _alumno;
                    _controller.checkAns();
                    _controller.cargaBD();
                  }/*
                  print("skip este es el id: "+Get.arguments["Alumno"].toString());
                  _controller.alumno =  Get.arguments["Alumno"];
                  _controller.checkAns();
                  _controller.cargaBD();*/
                },
                child: IconButton(icon: Icon(Icons.send, color: Colors.white,)),),
          ],
        ),
        body: BodyCuestionary(),
      ),
    );
  }
}
