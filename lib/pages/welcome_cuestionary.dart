import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_resident/models/recover_cuestionary_list.dart';
import 'package:home_resident/models/recover_questions_list.dart';
import 'package:home_resident/pages/splash_page_get.dart';
import 'package:home_resident/utils/constants.dart';
import 'package:websafe_svg/websafe_svg.dart';


class WelcomeCuestionary extends StatelessWidget {
  int id;
  String curso;
  WelcomeCuestionary({this.id, this.curso});

  @override
  Widget build(BuildContext context) {
    RecoverCuestionaryList recover = Get.put(RecoverCuestionaryList());
    RecoverQuestionsList recuperar = Get.put(RecoverQuestionsList());
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
                        print("id alumno en welcome $id y el $curso");
                        //recuperar.loadMateria(curso);
                        recuperar.loadMateriaTest(curso);
                        Get.to(SplashPageGet(), arguments: {"Page":"ChooseMatterTest", "Alumno": id, "Curso": curso});
                        /*recover.loadCuestionarios(curso);
                        recover.loadCuestionariosResueltos(id);
                        Get.to(SplashPageGet(), arguments: {"Page":"ChooseCuestionary", "Alumno": id});*/
                      },
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(12.0 * 2),
                        decoration: BoxDecoration(
                            gradient: kPrimaryGradient,
                            borderRadius: BorderRadius.all(Radius.circular(12.0))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Comenzar Test",
                              style: Theme.of(context).textTheme.headline6.copyWith(
                                  color: Colors.black),
                            ),
                            WebsafeSvg.asset("assets/icons/clock.svg", height: sizeIcons, color: Colors.white),
                          ],
                        ),
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