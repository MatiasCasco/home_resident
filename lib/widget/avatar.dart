import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

//import 'circle_container.dart';

class Avatar extends StatefulWidget {
  final double size;
  Avatar({this.size});

  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: widget.size,
      height: widget.size,
      child: Stack(
        children: <Widget>[
          SvgPicture.asset('assets/icons/user.svg',width:  widget.size, height:  widget.size, color: Colors.black,),
          /*Positioned(
            child: CircleContainer(
                child: Icon(Icons.edit),
                size: 60
            ),
            right: 0,
            top: 0,
          )*/
        ],
      ),
    );
  }
}