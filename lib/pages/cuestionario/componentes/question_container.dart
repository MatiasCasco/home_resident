/*
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class QuestionContainer extends StatelessWidget {
  final String question;
  final double heightImage;
  final double heightBetween;
  final double sizeLetter;

  QuestionContainer({@required this.question, @required this.heightImage, @required this.heightBetween, @required this.sizeLetter});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.grey,
        child: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Center(
              child: Column(
                children: [
                  Container(
                      color: Colors.blueAccent,
                      width: double.maxFinite,
                      height: heightImage,
                      child: Image.asset('assets/default/thinking.png')
                    //child: Image.asset('assets/default/thinking.png') no anda
                    //child: Image.network('https://image.freepik.com/vector-gratis/personas-sujetando-interrogaciones_23-2148159604.jpg', fit: BoxFit.fill)
                  ),
                  SizedBox(height: heightBetween, width: double.maxFinite,),
                  Container(
                    child: Center(
                      child: Text(
                        "Hello",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: sizeLetter,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    color: Colors.blue,
                    height: heightBetween,
                    width: double.maxFinite,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';

class QuestionContainer extends StatelessWidget {
  final String question;

  QuestionContainer({@required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              question,
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

