import 'package:flutter/material.dart';
import '../welcone_challenges.dart';

class MenuTab extends StatefulWidget {
  int idAlumno;
 MenuTab({this.idAlumno});

  @override
  _MenuTabState createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> {
  int id;
  @override
  Widget build(BuildContext context) {
    //return Container();
    print("menu");
    print(id);
    //return Center(child: Text("menu"),);
    return WelcomeChallenges(id: id);
    //return Quiz();
  }
  @override
  void initState() {
    id= widget.idAlumno;
  }
}
