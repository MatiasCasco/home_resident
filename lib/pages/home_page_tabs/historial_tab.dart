import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../welcome_cuestionary.dart';

class HistorialTab extends StatefulWidget {
  int idAlumno;
  HistorialTab({this.idAlumno});

  @override
  _HistorialTabState createState() => _HistorialTabState();
}

class _HistorialTabState extends State<HistorialTab> {
  int id;
  @override
  Widget build(BuildContext context) {

    //return Container();
    print("historial");
    print(id);
    //return Center(child: Text("historial"),);
    return WelcomeCuestionary(id: id);
  }

  @override
  void initState() {
    id= widget.idAlumno;
  }
}
