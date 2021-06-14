import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_resident/models/recover_cuestionary_list.dart';

class Ranking extends StatelessWidget {
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
            itemCount: recover.ranking.length,
            itemBuilder: (context, index){
            return ListTile(
              leading: Icon(Icons.account_circle_rounded, size: 50, color:  Colors.lightBlue,),
              title: Center(child: Text(recover.ranking[index].nombre + ' ' + recover.ranking[index].apellido, style: TextStyle(fontSize: 20, color: Colors.purpleAccent),)),
              subtitle: Text("Puntos: "+recover.ranking[index].puntaje.toString(), style: TextStyle(fontSize: 15, color: Colors.white)),
              trailing: SvgPicture.asset("assets/icons/menu-line.svg", width: 50, color: Colors.teal,),
              isThreeLine: false,
              dense: false,
            );
            }),
        ],
      ),
    );
  }
}
