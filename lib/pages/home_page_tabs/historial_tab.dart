import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../welcome_cuestionary.dart';

class HistorialTab extends StatefulWidget {
  int idAlumno;
  String nameCurso;
  HistorialTab({this.idAlumno, this.nameCurso});

  @override
  _HistorialTabState createState() => _HistorialTabState();
}

class _HistorialTabState extends State<HistorialTab> {
  int id;
  String curso;
  Future<int> recuperar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id =  prefs.getInt("Alumno");
    curso = prefs.getString("Curso");
  }
  @override
  Widget build(BuildContext context) {

    //return Container();
    print("historial");
    print(id);
    //return Center(child: Text("historial"),);
    return WelcomeCuestionary(id: id,curso: curso);
  }

  @override
  void initState() {
    recuperar();
    id= widget.idAlumno;
    curso = widget.nameCurso;
  }
}
