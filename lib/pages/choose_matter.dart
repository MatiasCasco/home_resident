
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_resident/models/recover_questions_list.dart';

import 'splash_page_get.dart';

class ChosseMatter extends StatelessWidget {
  RecoverQuestionsList recover = Get.put(RecoverQuestionsList());
  @override
  Widget build(BuildContext context) {
    final List<Widget> items = List.generate(
        recover.materias.length,
            (index) => Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 10, color: Colors.white38),
                color: Colors.transparent,
              ),
              //color: Colors.amber,
              child: TextButton(
                            child: Text(recover.materias[index].nameMateria, style: TextStyle(fontSize: 40, color: Colors.white38),),
                            onPressed: () {
                              recover.load(recover.materias[index].nameMateria);
                              Get.to(SplashPageGet(),arguments: {"Page":"Quiz"});
                            },
              ),
            ));
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/icons/fondo.png", fit: BoxFit.fill, width: double.maxFinite,),
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                iconTheme: IconThemeData(color: Colors.black, size: 25 ),
                backgroundColor: Colors.teal,
                //floating: true,
                pinned: true,
                //title: Center(child: Text('Seleccionar Materia', style: TextStyle(fontSize:40, color: Colors.black87),)),
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  title: Text('Seleccionar Materia', style: TextStyle(fontSize:30, color: Colors.black87,),),
                  background: Image.asset("assets/asignaturas.png", fit: BoxFit.fitWidth,),
                ),
                //Image.asset("assets/asignaturas.png", fit: BoxFit.fitWidth,),
              ),
              SliverList(delegate: SliverChildListDelegate(items)),
            ],
          ),
        ],
      ),
    );
  }
  /*  return Scaffold(
     /* extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text("Materias", style: TextStyle(color: Colors.black),),
        leading: CupertinoButton(
          onPressed: (){

          },
          padding: EdgeInsets.all(15),
          child: SvgPicture.asset("assets/icons/back.svg", width: 30,),),
        elevation: 0,
        /*actions: [
          TextButton(onPressed: _controller.nextQuestion, child: Text("Avanzar", style: TextStyle(color: Colors.black, fontSize: 25),),),
        ],*/
      ),*/
      body: ListView.builder(
          itemCount: recover.materias.length,
          itemBuilder: (context, position){
            return TextButton(child: Text(recover.materias[position].nameMateria), onPressed: () {
              recover.load();
              Get.to(SplashPageGet());
            }, );
          }),
    );
  }*/
}
