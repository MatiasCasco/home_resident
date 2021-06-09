import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_resident/api/account_api.dart';
import 'package:home_resident/models/alumno_model.dart';
import 'package:home_resident/models/credencial_model.dart';
import 'package:home_resident/utils/dialogs.dart';
import 'package:home_resident/widget/my_btn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
/*
class LoginPage extends StatefulWidget {
  static final routeName = 'login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FocusNode _focusNodePassword = FocusNode();
  AccountAPI _accountAPI = AccountAPI();
  GlobalKey<FormState> _formKey = GlobalKey();
  bool _isFetching = false;
  String _email = ' ', _password = ' ';
  int idAlumno = 40;
  String Curso = "PrimeroTT";
  _submit() async {
    final bool isValid = _formKey.currentState.validate();
    if (isValid) {
      setState(() {
        // setState es para volver a renderizar
        _isFetching = true;
      });
      bool isOk = await _accountAPI.login(_email,
          _password); // como login retorna un bool a futuro usamos await
      if (isOk) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        print("Esto es login page");
        await prefs.setBool("wasLogin", true);
        await prefs.setString("Curso", Curso);
        await prefs.setInt("Alumno", idAlumno);
        Navigator.pushReplacementNamed(context, HomePage.routeName, arguments: {"alumno": idAlumno,"curso": Curso,});
      } else {
        setState(() {
          _isFetching = false;
        });
        await Dialogs.alert(context,
            title: "Error", body: "El email o contraseña es incorrecto");
        print("lalala");
      }
    }
  }

  String _validateEmail(String email) {
    if (email.isNotEmpty && email.contains("@")) {
      _email = email;
      print(_email);
      return null;
    }
    return "Invalid Email";
  }

  String _validatePassword(String password) {
    if (password.isNotEmpty && password.length > 5) {
      _password = password;
      print(_password);
      return null;
    }
    return "Invalid Password";
  }



  @override
  void dispose() {
    _focusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
                child: Container(
              height: 900,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 300,
                        minWidth: 200,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Image.network(
                                'https://placeholder.com/wp-content/uploads/2018/10/placeholder.com-logo4.png'),
                            SizedBox(
                              height: 40,
                            ),
                            // es mas facil describir la logica textFormField que textFied
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "example@gmail.com",
                                labelText: "E-mail",
                                prefixIcon: Container(
                                  width: 70,
                                  height: 40,
                                  padding: EdgeInsets.all(10),
                                  child: SvgPicture.asset(
                                      'assets/icons/gmail.svg'),
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              keyboardAppearance: Brightness.light,
                              textInputAction: TextInputAction.next,
                              validator: _validateEmail,
                              onFieldSubmitted: (String text) {
                                //Se usa en vez onSubmitted
                                _focusNodePassword.nextFocus();
                              },
                              initialValue: "eve.holt@reqres.in",
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: "*******",
                                  labelText: "Password",
                                  prefixIcon: Icon(Icons.lock),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              obscureText: true,
                              textInputAction: TextInputAction.send,
                              focusNode: _focusNodePassword,
                              validator: _validatePassword,
                              onFieldSubmitted: (String text) {
                                _submit();
                              },
                              initialValue: "cityslicka",
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text("Recuperar Contraseña"),
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1, color: Colors.blue)),
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            MyBtn(
                              fullWidth: true,
                              label: "Ingresar",
                              onPressed: _submit,
                              backgroundColor: Color(0xff6A1B9A),
                              textColor: Colors.white,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text("O inicia con"),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: MyBtn(
                                    fullWidth: true,
                                    label: "Facebook",
                                    onPressed: () {},
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
                                  child: MyBtn(
                                    fullWidth: true,
                                    label: "Google",
                                    onPressed: () {},
                                    backgroundColor: Color(0xffF50057),
                                    textColor: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 18, horizontal: 10),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            )),
          ),
          if (_isFetching) // cuando es true ejecuta positioned
            Positioned.fill(
                child: Container(
              color: Colors.black26,
              child: Center(
                child: CupertinoActivityIndicator(
                  radius: 15,
                ), // es el simbolo de cargando
              ),
            ))
        ],
      )),
    );
  }
}*/
class LoginPage extends StatefulWidget {
  static final routeName = 'login';
  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  final FocusNode _focusNodePassword= FocusNode();
  final AccountApi _accountApi=AccountApi();
  final Credencial _credencial = Credencial();
  GlobalKey<FormState> _formkey= GlobalKey();

  String _email="", _password='';
  bool _isFetching=false;

  @override
  void dispose() {
    // TODO: implement dispose
    _focusNodePassword.dispose();
    super.dispose();
  }
  _submit() async {
    bool isValid= _formkey.currentState.validate();//llama a las funciones validators y si pasa todo retorna true
    if (isValid) {
      setState(() {
        _isFetching=true;
      });
      //llama a la api
      _credencial.loadData(_email, _password);
      bool isOk=await _accountApi.login(_email,_password);
      if(isOk){
        SharedPreferences prFr =await SharedPreferences.getInstance();///guara waslogin en memeoria
        await prFr.setBool("wasLogin", true);
        int idAlumno = _credencial.data["alumno"] as int;
        String curso = _credencial.data["curso"].toString();
        print("El id del alumno es $idAlumno y el curso es $curso");
        await prFr.setString("Curso", curso);
        await prFr.setInt("Alumno", idAlumno);
        Navigator.pushReplacementNamed(context, HomePage.routeName, arguments: {"alumno": idAlumno,"curso": curso,});
      }else{
        setState(()  {
          _isFetching=false;
        });
        SharedPreferences prFr =await SharedPreferences.getInstance();///guara waslogin en memeoria
        print (prFr.getString('Error'));
        await Dialogs.alert(context,body:prFr.getString('Error'),title:"Error");
      }
    }else{
      await Dialogs.alert(context,body:"email o contraseña incorrecta",title:"Error");
    }
  }

  String _validateEmail(String email){
    if(email.isNotEmpty && email.contains("@")){
      _email=email;
      return null;
    }
    return "invalid Email";

  }
  String _validatePass(String password){
    if(password.isNotEmpty && password.length>=5){
      _password=password;
      return null;
    }
    return "invalid password";

  }
  @override
  Widget build(BuildContext context) {
    final MediaQueryData media=MediaQuery.of(context);
    final Size size=media.size;
    final EdgeInsets padding=media.padding;
    return Scaffold(
        body:SafeArea(
          child: Stack(
              children:[
                Container(
                  width: double.infinity,
                  height: size.height,
                  padding: EdgeInsets.symmetric(horizontal:30),
                  child: SingleChildScrollView(
                    child: Container(
                        height: size.height-padding.top-padding.bottom,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
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
                                          contentPadding: EdgeInsets.symmetric(vertical:20),
                                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                                          hintText: "example@domaim.com",
                                          labelText: "E-mail",
                                          prefixIcon: Icon(Icons.email,),

                                        ),
                                        keyboardType: TextInputType.emailAddress,
                                        keyboardAppearance: Brightness.light,
                                        textInputAction: TextInputAction.next,
                                        validator:_validateEmail,
                                        onFieldSubmitted: (String text){
                                          // _focusNodePassword.nextFocus();
                                        },
                                        initialValue: 'ss02.@gmail.com',
                                        //initialValue: 'ss02.@gmail.com',
                                      ),
                                      SizedBox(height: size.height/44,),
                                      TextFormField(
                                        decoration: InputDecoration(

                                            labelText: "Password",
                                            hintText: "*********",
                                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                                            prefixIcon: Icon(Icons.lock,)
                                        ),
                                        obscureText: true,
                                        focusNode: _focusNodePassword,
                                        textInputAction: TextInputAction.send,
                                        validator: _validatePass,
                                        onFieldSubmitted: (String text){
                                          _submit();
                                        },
                                        initialValue: '123456',
                                      ),
                                      SizedBox(height:size.height/44),
                                      MyBtn(label: "Ingresar",fullWidth: true,onPressed: _submit,backgroundColor: Color(0xff304ffE),textColor: Colors.white,)
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