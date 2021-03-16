import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyAppbar extends StatelessWidget{
  final String leftIcon, rightIcon;
  final VoidCallback onLeftClick, onRightClick;
  // "https://image.flaticon.com/icons/svg/520/520149.svg"
  // "https://image.flaticon.com/icons/svg/2190/2190508.svg"
  MyAppbar({@required this.leftIcon, @required this.rightIcon, this.onLeftClick, this.onRightClick});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.indigoAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CupertinoButton(
            onPressed: onLeftClick,
            padding: EdgeInsets.all(15),
            child: SvgPicture.asset(leftIcon, width: 30,),
            //SvgPicture.network(leftIcon , width: 30,),
          ),
          Text("LOGO", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          CupertinoButton(
            onPressed: onRightClick,
            padding: EdgeInsets.all(0),
            child: Stack(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(15),
                  child: SvgPicture.asset(rightIcon, width: 30,),
                  //SvgPicture.network(rightIcon, width: 30,),
                ),
                Positioned(right: 12, top: 12, child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                ),),
              ],
            ),
          ),
        ],
      ),
    );
  }


}