import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_resident/models/credencial_model.dart';
import 'package:home_resident/pages/update_password.dart';
import 'package:home_resident/utils/dialogs.dart';
import 'package:home_resident/widget/avatar.dart';
import 'package:home_resident/widget/left_right_icon_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login_page.dart';

class AjusteTab extends StatefulWidget {
  int idAlumno;
  String curso;
  int rol;
  String email;
  String name;

  AjusteTab({@required this.idAlumno, @required this.curso,@required this.rol, @required this.email, @required this.name});

  @override
  _AjusteTabState createState() => _AjusteTabState();
}

class _AjusteTabState extends State<AjusteTab> {
  int id;
  String curso;
  int rol;
  String email = " ";
  String name = " ";
  _confirm() async{
    final isOk = await Dialogs.Confirm(context,
        title: "Confirmacion Requerida",
        body: "Desea salir de la app?");
    print("isOK $isOk");
    if(isOk){
      _logOut();
    }
  }

  _logOut() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    await prefs.setString("email",email);
    Navigator.pushNamedAndRemoveUntil(context, LoginPage.routeName, (_)=>false);
  }

  _setEmail(){
    Dialogs.intputEmail(context, onOk: (String text){
      print("input dialog $text");
    }, label: "Ingrese un email",
        placeholder: "example@gmail.com");
  }

  @override
  void initState() {
    super.initState();
    id = widget.idAlumno;
    curso = widget.curso;
    rol = widget.rol;
    email = widget.email;
    name = widget.name;
  }

  @override
  Widget build(BuildContext context) {

    //return Container();
    print("Ajuste"); // la idea se los print es saber cuando se renderiza los tabs
    //return Center(child: Text("Ajuste"),);
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
            children: <Widget>[
              Container(
                  color: Colors.blueGrey,
                  padding: EdgeInsets.symmetric(vertical: 30),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Avatar(size: 150),
                      TextButton(child: Text(name, style: TextStyle(fontSize: 25, color: Colors.white),),
                        onPressed: (){},),
                    ],
                  )
              ),
              LeftRightIconButton(
                leftIcon: "assets/icons/mail.svg",
                rightContent: Text(email, style: TextStyle(color: Colors.blueGrey),), /*SvgPicture.asset("assets/icons/downArrow.svg"),*/
                label:"Email",
                onPressed: (){},
                //onPressed: _setEmail,
              ),
              LeftRightIconButton(
                leftIcon: "assets/icons/security.svg",
                rightContent: SvgPicture.asset("assets/icons/rightArrow.svg", width: 25,),/*SvgPicture.asset("assets/icons/downArrow.svg"),*/
                label:"Cambiar contraseña",
                onPressed: (){
                  print("Esto son los parametros pasados por navigator");
                  print(id.toString() + curso + rol.toString());
                  Navigator.pushNamed(context, UpdatePassword.routeName, arguments: {"id":id, "curso":curso,"rol":rol},);
                },),
             /*LeftRightIconButton(
                leftIcon: "assets/icons/Bell.svg",
                rightContent: Text("ACTIVADO", style: TextStyle(color: Colors.blueGrey),),/*SvgPicture.asset("assets/icons/downArrow.svg"),*/
                label:"Notificaciones Push",
                onPressed: _confirm,),*/
              LeftRightIconButton(
                leftIcon: "assets/icons/exit.svg",
                rightContent: SvgPicture.asset("assets/icons/downArrow.svg", width: 25,),
                label:"Cerrar Sesion",
                onPressed: _confirm,),
            ]),
      ),
    );
  }
}
