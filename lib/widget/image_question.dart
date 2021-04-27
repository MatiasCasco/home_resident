import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_resident/utils/constants.dart';

class ImageQuestion extends StatelessWidget {

  final String image;

  ImageQuestion({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(kDefaultPadding),
      //color: Colors.amber,
      width: 350,
      height: 250,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/notAvailable.png",), scale: 3.5,
        ),
      ),
      child: Image.network(image, fit: BoxFit.contain,),
    );
  }
}
