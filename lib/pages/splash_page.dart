import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'login_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with AfterLayoutMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((_){
      this._checkLogin();
    });
  }

  _checkLogin()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool wasLogin = prefs.getBool("wasLogin");
    print("wasLogin $wasLogin");
    if(wasLogin == null || wasLogin == false){
      print("ir a login");
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    } else {
      Navigator.pushNamed(context, HomePage.routeName);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CupertinoActivityIndicator(radius: 15,),),);
  }


}
