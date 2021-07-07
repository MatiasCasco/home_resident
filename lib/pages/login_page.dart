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
import 'update_password.dart';

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
      //_credencial.loadData(_email, _password);
      bool isOk=await _accountApi.login(_email,_password);
      if(isOk){
        SharedPreferences prFr =await SharedPreferences.getInstance();///guara waslogin en memeoria
        await prFr.setBool("wasLogin", true);
        int rol =  prFr.getInt("rol") ;
        int idAlumno =   prFr.getInt("Alumno");
        String curso =  prFr.getString("Curso");
        String name =  prFr.getString("name");
        String email = prFr.getString("email").toString();
        print("trae datos?");
        print(rol);
        print(idAlumno);
        print(curso);
        print(name);
        print(email);
        if(rol == 4) {
          Navigator.pushReplacementNamed(context, UpdatePassword.routeName, arguments: {"id":idAlumno, "curso":curso,"rol":rol},);
        }else{
          Navigator.pushReplacementNamed(context, HomePage.routeName, arguments: {"alumno": idAlumno,"curso": curso, "email":email, "name":name});
        }

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
                                        //initialValue: 'ss02.@gmail.com',
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
                                        //initialValue: '123456',
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