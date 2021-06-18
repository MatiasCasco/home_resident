import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../welcone_challenges.dart';

class MenuTab extends StatefulWidget {
  int idAlumno;
  String curso, email, name;
 MenuTab({@required this.idAlumno, @required this.curso, @required this.email, @required this.name});

  @override
  _MenuTabState createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> {
  String Curso, email, name;
  int id;
  Future<int> recuperar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id =  prefs.getInt("Alumno");
    Curso = prefs.getString("Curso");
    email = prefs.getString("email");
    name = prefs.getString("name");
  }
  @override
  Widget build(BuildContext context) {
    //return Container();
    print("menu");
    print(id.toString() + "Este es el iddddddddddddddddddddddddd");
    print(Curso + "Este es el cursooooooooooo");
    //return Center(child: Text("menu"),);
    //recuperar();
    return WelcomeChallenges(id: id, curso: Curso, email: email, name: name);
    //return Quiz();
  }
  @override
  void initState() {
    recuperar();
    id= widget.idAlumno;
    Curso = widget.curso;
    email = widget.email;
    name = widget.name;
  }
}
