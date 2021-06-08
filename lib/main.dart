import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:home_resident/pages/home_page.dart';
import 'package:home_resident/pages/login_page.dart';
import 'package:home_resident/pages/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/reto/puntaje/score.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  /*int id;
  String curso;

  Future<int> recuperar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id =  prefs.getInt("Alumno");
    curso = prefs.getString("Curso");
    print("Recuperamos en el main $id y $curso");
  }*/

  @override
  Widget build(BuildContext context) {
    //Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    //int id = args["alumno"] as int;
    //String curso = args["curso"].toString();
    return GestureDetector(
        onTap: (){
          final FocusScopeNode focus = FocusScope.of(context);
          if(focus.hasPrimaryFocus){
            focus.unfocus();
          }
        },
        child: GetMaterialApp(
          home: SplashPage(),
          routes: {
            // 'homePage': (BuildContext context)=> HomePage(),
            HomePage.routeName: (BuildContext context) {
              //recuperar();
              //print("El valor en la ruta $id Y $curso");
              return HomePage(/*id: id, curso: curso,*/);
            },
            LoginPage.routeName: (_)=> LoginPage(),
            //Score.routeName: (_)=> Score(),
          },
        )
    );
  }
}
