import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LeftRightIconButton extends StatelessWidget {
  final String leftIcon/*, rightIcon*/, label;
  final Widget rightContent;
  final VoidCallback onPressed;
  LeftRightIconButton({this.leftIcon/*, this.rightIcon*/, this.label=' ', this.onPressed, this.rightContent});
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: this.onPressed,
      padding: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  if(leftIcon != null) Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: SvgPicture.asset(leftIcon, width: 30,),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.indigo, fontSize: 16),
                      ),
                    ),
                  ),
                  // if(rightIcon != null) Padding(
                  if(rightContent != null) Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: rightContent,
                    /*child: SvgPicture.asset(rightIcon, width: 25,),*/
                  ),
                ],
              ),
            ),
          ],),),
    );
  }
}