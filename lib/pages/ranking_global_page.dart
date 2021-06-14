import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_resident/models/recover_cuestionary_list.dart';
import 'package:home_resident/widget/icons_score.dart';

import 'splash_page_get.dart';

class RankingGlobalM extends StatelessWidget {
  RecoverCuestionaryList recover = Get.put(RecoverCuestionaryList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/icons/fondo.png",
            fit: BoxFit.fill,
            width: double.maxFinite,
          ),
          ListView.separated(
              separatorBuilder: (context, index) => Divider(color: Colors.black,),
              itemCount: recover.rankingGlobal.length,
              itemBuilder: (context, index){
                return ListTile(
                  leading: Icon(Icons.account_circle_rounded, size: 50, color:  Colors.lightBlue,),
                  title: Text(recover.rankingGlobal[index].nombre + ' ' + recover.rankingGlobal[index].apellido, style: TextStyle(fontSize: 20, color: Colors.purple),),
                  subtitle: Text("Porcentaje: "+(recover.rankingGlobal[index].puntosObtenidos*100/recover.rankingGlobal[index].puntos).toString() + "%", style: TextStyle(fontSize: 15, color: Colors.white)),
                  trailing: IconsScore(porcentaje: recover.rankingGlobal[index].puntosObtenidos*100/recover.rankingGlobal[index].puntos),
                  onTap: (){
                    /* Seguir esta estructura para ranking profesor
                    recover.loadCuestionariosOFMateria(Get.arguments["Curso"], Get.arguments["Materia"]);
                    Get.to(SplashPageGet(), arguments: {"Page":"ChooseTest"});

                     */
                  },
                  isThreeLine: false,
                  dense: false,
                );
              }),
        ],
      ),
    );
  }
}