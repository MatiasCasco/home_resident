
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_resident/pages/reto/pregunta/quiz.dart';
import 'package:home_resident/utils/constants.dart';
import 'package:websafe_svg/websafe_svg.dart';

class WelcomeChallenges extends StatelessWidget {
  double size;


  WelcomeChallenges({this.size});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Text("Vamos a divertirnos ;)",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text("Bienvenidos al juego de Retos!!", style: TextStyle(color: Colors.blue, fontSize: 20.0),),
                    Spacer(),
                    InkWell(
                      /*onTap: (){
                        final route = MaterialPageRoute(builder: (BuildContext _)=>Quiz());
                        // final route = MaterialPageRoute(builder: (BuildContext _)=>Score());
                        Navigator.push(context, route);
                      },*/
                      onTap: () => Get.to(Quiz()),
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(12.0 * 2),
                        decoration: BoxDecoration(
                          gradient: kPrimaryGradient,
                          borderRadius: BorderRadius.all(Radius.circular(12.0))),
                        child: Text("Comenzar Reto",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Colors.black),),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }


}
