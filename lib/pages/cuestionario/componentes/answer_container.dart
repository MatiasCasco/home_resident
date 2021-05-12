import 'package:flutter/material.dart';
//import 'package:trivia_flutter_demo/model/answer.dart';

class AnswerContainer extends StatelessWidget {
  /*
  final String title;
  final Answer answer;
  final Color color;

  AnswerContainer({this.title, @required this.answer, @required this.color});
   */
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        //color: color,
        color: Colors.teal,
        child: SizedBox(
          width: double.maxFinite,
          height: 60.0,
          child: Center(
            child: Text(
              //answer.text,
              "Matias",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}