import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:home_resident/pages/home_page.dart';
import 'package:home_resident/pages/login_page.dart';
import 'package:home_resident/pages/splash_page.dart';

import 'pages/reto/puntaje/score.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
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
            HomePage.routeName: (BuildContext context)=> HomePage(),
            LoginPage.routeName: (_)=> LoginPage(),
            //Score.routeName: (_)=> Score(),
          },
        )
    );
  }
}
