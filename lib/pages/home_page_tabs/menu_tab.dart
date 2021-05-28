import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../welcone_challenges.dart';

class MenuTab extends StatefulWidget {
  int idAlumno;
 MenuTab({this.idAlumno});

  @override
  _MenuTabState createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> {
  String Curso;
  int id;
  Future<int> recuperar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id =  prefs.getInt("Alumno");
    Curso = prefs.getString("Curso");
  }
  @override
  Widget build(BuildContext context) {
    //return Container();
    print("menu");
    print(id);
    //return Center(child: Text("menu"),);
    return WelcomeChallenges(id: id, curso: Curso);
    //return Quiz();
  }
  @override
  void initState() {
    id= widget.idAlumno;
    recuperar();
  }
}
