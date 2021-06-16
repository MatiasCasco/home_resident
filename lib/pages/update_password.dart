import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_resident/api/account_api.dart';
import 'package:home_resident/models/credencial_model.dart';
import 'package:home_resident/pages/splash_page.dart';
import 'package:home_resident/utils/dialogs.dart';
import 'package:home_resident/widget/my_btn.dart';

import 'home_page.dart';

class UpdatePassword extends StatefulWidget {
  static final routeName = "UpdatePassword";
  @override
  _UpdatePasswordState createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  final AccountApi _accountApi = AccountApi();
  final Credencial _credencial = Credencial();
  FocusNode _focusNodePasswordO;
  FocusNode _focusNodePasswordN;
  FocusNode _focusNodePasswordR;
  String _passwordOld = '';
  String _passwordNow='';
  String _passwordRepeat='';
  bool _bandera = false;
  bool _isFetching=false;
  @override
  void initState() {
    super.initState();
     _focusNodePasswordO = FocusNode();
     _focusNodePasswordN = FocusNode();
     _focusNodePasswordR = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    this._focusNodePasswordO.dispose();
    this._focusNodePasswordN.dispose();
    this._focusNodePasswordR.dispose();
  }
   void validar()  async{
     _formkey.currentState.save();
    if(_formkey.currentState.validate()) _bandera = true;
   }
  String _validatePass(String password){
    print(password);
    if(password.length>=8 && password.contains(RegExp(r'\W')) && RegExp(r'\d+\w*\d+').hasMatch(password)) {
    //if(password.isNotEmpty && password.length>=5){
      _passwordNow=password;
      return null;
    }
    Dialogs.alert(context,title: "Debe contener", body: "Por lo menos 1 mayuscula, 1 minuscula, 1 caracter especiales y la longitud de 8 caracteres");
    return "Contraseña invalida";
  }
  String _comparePass(String password){
    print(_passwordNow + "New");
    print(password + "pass");
    print(password.compareTo(_passwordNow));
    if(password.compareTo(_passwordNow) == 0) {
      print(_passwordNow + "New");
      print(password + "pass");
      //if(password.isNotEmpty && password.length>=5){
      _passwordRepeat=password;
      return null;
    }
    return "Contraseña no coinciden";
  }
  _homePage(){
    print("ir a Home Page");
    Navigator.pushReplacementNamed(context, SplashPage.routeName);
  }


  _submit(int id, String curso, int rol) async {
    //validar();
    print(id.toString()+ curso +rol.toString());
    if (_bandera == true) {
      setState(() {
        _isFetching=true;
      });
      //llama a la api
      _credencial.loadUpdatePass(id, _passwordOld, _passwordNow);
      Map<String, dynamic> data = _credencial.data;
      await Future.delayed(Duration(seconds: 3));
      print(data.toString()+'este es el codigo');

      String codigo = _credencial.data["codigo"] as String;
      String descripcion = _credencial.data["descripcion"] as String;
      print(codigo+'codigo');
      print(descripcion+'descripcion');
      if(codigo.compareTo("0000") == 0){
        print(id.toString()+curso);
        Dialogs.alert(context, title: "Actualizacion realizada", body: descripcion);
        _homePage();
      }
      if(codigo.compareTo("0001") == 0){
        setState(()  {
          _isFetching=false;
        });
        Dialogs.alert(context, title: "Actualizacion fallida", body: descripcion);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media=MediaQuery.of(context);
    final Size size=media.size;
    final EdgeInsets padding=media.padding;
    int id;
    String curso;
    int rol;
    Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    id = args["id"] as int;
    curso = args["curso"] as String;
    rol = args["rol"] as int;
    print(id.toString() +curso);
    void requestFocus(BuildContext context, FocusNode focusNode){
      FocusScope.of(context).requestFocus(focusNode);
    }
    return Scaffold(
        body:SafeArea(
          child: Stack(
              children:[
                Container(
                  width: double.infinity,
                  height: (size.width*3),
                  padding: EdgeInsets.symmetric(horizontal:30),
                  child: SingleChildScrollView(
                    child: Container(
                        height: (size.width*3)-padding.top-padding.bottom,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 300,minWidth: 200,),
                              child: Form(
                                  key: _formkey,
                                  child:Column(
                                    children: [
                                      //Image.network('https://placeholder.com/wp-content/uploads/2018/10/placeholder.com-logo1.png'),
                                      Image.asset('assets/student.png',width: size.width/1.3,height:size.height/2.5),
                                      SizedBox(height:size.height/40),
                                      TextFormField(
                                        decoration: InputDecoration(
                                            labelText: "Password",
                                            hintText: "Contraseña Actual",
                                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                                            prefixIcon: Icon(Icons.lock,)
                                        ),
                                        obscureText: true,
                                        focusNode: _focusNodePasswordO,
                                        textInputAction: TextInputAction.next,
                                        onEditingComplete: () => requestFocus(context, _focusNodePasswordN),
                                        onSaved: (value){
                                          _passwordOld = value;
                                        },
                                        // ignore: missing_return
                                        validator: (value){
                                          if(value.isEmpty){
                                            return "Campo vacio";
                                          }
                                        },
                                        //validator: _validatePass,
                                        onFieldSubmitted: (String text){
                                          //_focusNodePassword.nextFocus();
                                          //_submit();
                                        },
                                        //initialValue: '123456',
                                      ),
                                      SizedBox(height:size.height/44),
                                      TextFormField(
                                        decoration: InputDecoration(
                                            labelText: "Password",
                                            hintText: "Contraseña nueva",
                                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                                            prefixIcon: Icon(Icons.vpn_key,)
                                        ),
                                        obscureText: true,
                                        focusNode: _focusNodePasswordN,
                                        textInputAction: TextInputAction.next,
                                        onEditingComplete: () => requestFocus(context, _focusNodePasswordR),
                                        onSaved: (value){
                                          _passwordNow = value;
                                        },
                                        validator: _validatePass,/*(password){
                                          print(password);
                                          if(password.length>=8 && password.contains(RegExp(r'\W')) && RegExp(r'\d+\w*\d+').hasMatch(password)) {
                                            //if(password.isNotEmpty && password.length>=5){
                                            _passwordNow=password;
                                            return null;
                                          }
                                          Dialogs.alert(context,title: "Debe contener", body: "Por lo menos 1 mayuscula, 1 minuscula, 1 caracter especiales y la longitud de 8 caracteres");
                                          return "Contraseña invalida";
                                        },*/
                                        onFieldSubmitted: (String text){
                                          //_validatePass(text);
                                          //_focusNodePasswordR.nextFocus();
                                          //_submit();
                                        },
                                        //initialValue: '123456',
                                      ),
                                      SizedBox(height:size.height/44),
                                      TextFormField(
                                        decoration: InputDecoration(
                                            labelText: "Password",
                                            hintText: " repetir contraseña Actual",
                                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                                            prefixIcon: Icon(Icons.vpn_key,)
                                        ),
                                        obscureText: true,
                                        focusNode: _focusNodePasswordR,
                                        textInputAction: TextInputAction.send,
                                        onSaved: (value){
                                          _passwordRepeat = value;
                                        },
                                        validator: _comparePass,/*(password){
                                          print(_passwordNow + "New");
                                          print(password + "pass");
                                          print(password.compareTo(_passwordNow));
                                          if(password.compareTo(_passwordNow) == 0) {
                                            print(_passwordNow + "New");
                                            print(password + "pass");
                                            //if(password.isNotEmpty && password.length>=5){
                                            _passwordRepeat=password;
                                            return null;
                                          }
                                          return "Contraseña no coinciden";
                                        },*/
                                        onEditingComplete: () {
                                          validar();
                                          _submit(id, curso, rol);
                                        },
                                        onFieldSubmitted: (String text){
                                          //_submit(id, curso, rol);
                                          //print(text);
                                        },
                                        //initialValue: '123456',
                                      ),
                                      SizedBox(height:size.height/44),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: MyBtn(
                                              fullWidth: true,
                                              label: "Cambiar",
                                              onPressed: (){
                                                validar();
                                                _submit(id, curso, rol);
                                              },
                                              backgroundColor: Color(0xff0D47A1),
                                              textColor: Colors.white,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 18, horizontal: 10),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: /*rol == 4? Container() : */MyBtn(
                                              fullWidth: true,
                                              label: "Cancelar",
                                              onPressed: () => rol != 4 ? Navigator.pop(context):Dialogs.alert(context, title: "Cambiar Contraseña", body: "Al inisiar sesion primera vez"),
                                              backgroundColor: rol != 4 ? Color(0xffF50057): Color(0xfffce4ec),
                                              textColor: rol != 4 ? Colors.white:Colors.grey,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 18, horizontal: 10),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                              ),
                            ),
                            SizedBox(height: 30,)
                          ],
                        )
                    ),
                  ),
                ),
                if(_isFetching)
                  Positioned.fill(
                      child: Container(
                        color: Colors.white70,
                        child: Center(
                            child: CupertinoActivityIndicator(
                              radius: 15,
                            )
                        ),
                      )
                  )
              ]
          ) ,
        )
    );
  }
}
