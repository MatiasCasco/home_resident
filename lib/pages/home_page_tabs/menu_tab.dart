import 'package:flutter/material.dart';
import 'package:home_resident/pages/reto/pregunta/quiz.dart';

import '../welcone_challenges.dart';

class MenuTab extends StatefulWidget {
  @override
  _MenuTabState createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> {
  @override
  Widget build(BuildContext context) {
    //return Container();
    print("menu");
    //return Center(child: Text("menu"),);
    return WelcomeChallenges();
    //return Quiz();
  }
}
