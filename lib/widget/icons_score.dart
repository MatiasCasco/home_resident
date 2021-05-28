import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconsScore extends StatelessWidget {
  double porcentaje;

  IconsScore({this.porcentaje});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 40,
      child: Row(
        children: [
          SvgPicture.asset(porcentaje - 0 >= 0 ? "assets/icons/start.svg":"assets/icons/startDark.svg",width: 20, height: 15,),
          SvgPicture.asset(porcentaje - 25 >= 0 ? "assets/icons/start.svg":"assets/icons/startDark.svg",width: 20, height: 15,),
          SvgPicture.asset(porcentaje - 50 >= 0 ? "assets/icons/start.svg":"assets/icons/startDark.svg",width: 20, height: 15,),
          SvgPicture.asset(porcentaje - 75 >= 0 ? "assets/icons/start.svg":"assets/icons/startDark.svg",width: 20, height: 15,),
        ],
      ),
    );
  }
}
