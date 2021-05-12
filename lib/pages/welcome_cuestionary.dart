import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_resident/models/recover_questions_list.dart';
import 'package:home_resident/pages/choose_matter.dart';
import 'package:home_resident/pages/splash_page_get.dart';
import 'package:home_resident/utils/constants.dart';

import 'cuestionario/cuestionary.dart';

class WelcomeCuestionary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //RecoverQuestionsList recover = Get.put(RecoverQuestionsList());
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/icons/fondo.png", fit: BoxFit.fill, width: double.maxFinite,),
          SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Text("Sigamos aprendiendo ;)",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text("Formulario de evaluación!!", style: TextStyle(color: Colors.blue, fontSize: 20.0),),
                    Spacer(),
                    InkWell(
                      /*onTap: (){
                        final route = MaterialPageRoute(builder: (BuildContext _)=>Quiz());
                        // final route = MaterialPageRoute(builder: (BuildContext _)=>Score());
                        Navigator.push(context, route);
                      },*/
                      onTap: () {
                        //recover.loadMateria();
                        //Get.to(SplashPageGet(), arguments: "ChooseMatter");
                        //Get.to(ChosseMatter());
                        /*  Este es el que anda
                        recover.load();
                        Get.to(SplashPageGet());
                        */
                        Get.to(Cuestionary());
                        /*
                        load();
                        Get.to(Quiz(),arguments: _questions);
                         */
                        //Get.to(Quiz(), duration: Duration(seconds: 3));
                      },
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(12.0 * 2),
                        decoration: BoxDecoration(
                            gradient: kPrimaryGradient,
                            borderRadius: BorderRadius.all(Radius.circular(12.0))),
                        child: Text("Comenzar Test",
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