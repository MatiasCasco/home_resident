import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_resident/models/recover_cuestionary_list.dart';

import 'splash_page_get.dart';

class ChooseTest extends StatelessWidget {
  RecoverCuestionaryList recoverC = Get.put(RecoverCuestionaryList());

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = List.generate(
        recoverC.cuestionariosOFMateria.length,
        (index) => Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 10, color: Colors.white38),
                color: Colors.transparent,
              ),
              child: TextButton(
                child: Text(
                  recoverC.cuestionariosOFMateria[index].idCuestionario.toString(),
                  style: TextStyle(fontSize: 40, color: Colors.white38),
                ),
                onPressed: () {
                  recoverC.loadRanking(recoverC.cuestionariosOFMateria[index].idCuestionario);
                  Get.to(SplashPageGet(), arguments: {"Page":"Ranking"});
                },
              ),
            ));
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/icons/fondo.png",
            fit: BoxFit.fill,
            width: double.maxFinite,
          ),
          CustomScrollView(
            slivers: <Widget>[
              SliverList(delegate: SliverChildListDelegate(items)),
            ],
          ),
        ],
      ),
    );
  }
}
