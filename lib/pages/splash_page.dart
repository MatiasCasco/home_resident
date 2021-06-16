import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'login_page.dart';

class SplashPage extends StatefulWidget {
  static final routeName = "Splash";
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with AfterLayoutMixin {
  int id;
  String curso;
  @override
  void initState() {
    super.initState();
    recuperar();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((_){
      this._checkLogin();
    });
  }
  Future<void> recuperar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id =  prefs.getInt("Alumno");
    curso = prefs.getString("Curso");
  }

  _checkLogin()async{
    recuperar();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool wasLogin = prefs.getBool("wasLogin");
    print("wasLogin $wasLogin");
    if(wasLogin == null || wasLogin == false){
      print("ir a login");
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    } else {
      //Navigator.pushNamed(context, HomePage.routeName);
      print("para ir a home page desde plash page $id y $curso");
      Navigator.pushReplacementNamed(context, HomePage.routeName, arguments: {"alumno": id,"curso": curso,});
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CupertinoActivityIndicator(radius: 15,),),);
  }
}
