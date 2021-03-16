import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyBtn extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor, textColor;
  final bool fullWidth;
  final EdgeInsets padding;

  MyBtn({
    @required this.label,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.fullWidth = false,
    this.padding})
      : assert(label != null);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        minSize: 20,
        padding: EdgeInsets.zero,
        child: Container(
          width: fullWidth ? double.infinity:null,
          padding: this.padding?? EdgeInsets.symmetric(vertical: 18, horizontal: 45),
          child: Text(
            this.label,
            textAlign: TextAlign.center,
            style: TextStyle(color: this.textColor ?? Colors.black,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5),
          ),
          decoration: BoxDecoration(
            color: this.backgroundColor ?? Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5)],
          ),
        ), onPressed: (){
      FocusScope.of(context).unfocus();
      this.onPressed();
    }
    );
  }
}
