/*
import 'dart:convert';
import 'package:http/http.dart' as http; // Alias

class AccountAPI {
  Future<bool> login(String email, String password) async{
    try{
      final  http.Response response = await http.post(
          "https://reqres.in/api/login",
          body: jsonEncode({"email": email, "password": password, "age":25}),
          headers: {'Content-Type':'application/json'});
      if(response.statusCode==200) {
        final dynamic parsed = jsonDecode(response.body);
        print("Login OK ${parsed["token"]}");
        return true;
      }
      return false;
      /*}else{
      //print("StatusCode is ${response.statusCode}");
    }*/
    }catch(e){
      print(e);
    }
  }
  Future<List<dynamic>> getUsers(int page) async {
    try {
      final http.Response response = await http.get("https://reqres.in/api/users?page=$page&delay=3");
      print(response.body);
      if(response.statusCode==200) {
        final parsed = jsonDecode(response.body);
        print("getUsers ok");
        print(parsed['data'].runtimeType); //averigua que tipo de dato retorna
        return parsed['data'];

      }
      print("error ${response.statusCode}");
      return [];
    }catch(e){
      print(e);
      return [];
    }
  }

/* Este es un ejemplo conectado a nuestro proyecto
   Future<String> getCurso(String id) async {
    try {
      final http.Response response = await http.get(
          "http://192.168.0.19:8084/homeApi/rest/cursoapi/curso/${id}");
      print(response.body);
      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        print("getCurso");
        print(parsed.runtimeType);
        return parsed['nombre'];
      }
      print("error ${response.statusCode}");
      return " ";
    } catch(e){
        print(e);
        return " ";
    }
  }
*/
  /*
  Future<Curso> getCurso(String id) async {
    try {
      final http.Response response = await http.get(
          "http://192.168.0.3:8084/homeApi/rest/cursoapi/curso/${id}");
      print(response.body);
      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        print("getCurso");
        print(parsed.runtimeType);
        Curso curso = new Curso.fromJson(parsed);
        return curso;
      }
      print("error ${response.statusCode}");
      return null;
    } catch(e){
      print(e);
      return null;
    }
  }*/
}*/
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart'; // Alias

class AccountApi {
  _changeValue(parsed)async{
    SharedPreferences prFr = await SharedPreferences.getInstance();
    await prFr.setBool("waslogin", true);
    await prFr.setString("email",parsed['email']);
    await prFr.setString("nombreCurso",parsed['nombreCurso']);
    await prFr.setInt("id",parsed['idP']);
    print("cargando datos en memoria...");
  }

  Future<bool> login(String email, String password) async
  {
    SharedPreferences prFr =await SharedPreferences.getInstance();///guara waslogin en memeoria

    // Uri uri =Uri.http("192.168.43.116:8084/proyectoapiMySql/rest/personapi/log");
    Uri uri=new Uri(scheme: 'http',host: '192.168.0.3',path: 'proyectoapiMySql/rest/personapi/log',port: 8084);//funciona
    try{
      final http.Response response= await http.post(
          uri,
          body: jsonEncode({
            "id":15,
            "email":email,
            "password":password,
            "rol":3
          }),
          headers: {'Content-Type':'application/json'}
      );
      print(response.body);
      if(response.statusCode==200){
        //preguntar el codigo de error guardarlo para el mensaje
        //si todo bie  guardar el id del usuario y el nombre tal vez tambien
        //await prFr.setBool("waslogin", true);
        final  parsed= json.decode(response.body);
        //_changeValue(parsed);
        print("login ok ${parsed['idP']}: user: ${parsed['email']}: islog?${parsed['isLog']}");
        if(parsed['isLog']){
          //_changeValue(parsed);
          return true;
        }
        if (parsed['codError']=="0001"){
          await prFr.setString("Error","Usuario no registrado para el uso de la app");
          return false;
        }
        await prFr.setString("Error","Error de password");
        return false;
      }else{
        return false;
      }
    }catch(e){
      print(e);//tal vez guardar en prfs para imprimir
      return false;
    }

  }

  Future<Map<String, dynamic>> dataUser(String email, String password) async {
    Uri uri=new Uri(scheme: 'http',host: '192.168.0.3', path: 'proyectoapiMySql/rest/personapi/log', port: 8084);//funciona
    try{
      final http.Response response= await http.post(
          uri,
          body: jsonEncode({
            "id":15,
            "email":email,
            "password":password,
            "rol":3
          }),
          headers: {'Content-Type':'application/json'}
      );
      print(response.body);
      if(response.statusCode==200){
        final  parsed= json.decode(response.body);
        final Map<String, dynamic> data1 = Map<String, dynamic>();
        data1['alumno'] = parsed['idP'];
        data1['curso'] = parsed['nombreCurso'];
        data1['rol'] = parsed['rol'];
        data1['email'] = parsed['email'];
        data1['name'] = parsed['name'];
        return data1;
      }else{
        return null;
      }
    }catch(e){
      print(e);//tal vez guardar en prfs para imprimir
      return null;
    }
  }

  Future<Map<String, dynamic>> updatePassword(int id , String passwordOld, String passwordNew) async {
    Uri uri=new Uri(scheme: 'http',host: '192.168.0.3', path: 'proyectoapiMySql/rest/personapi/password', port: 8084);//funciona
    try{
      final http.Response response= await http.post(
          uri,
          body: jsonEncode({
            "rol":3,
            "password":passwordNew,
            "passwordOld":passwordOld,
            "id":id
          }),
          headers: {'Content-Type':'application/json'}
      );
      print(response.body);
      if(response.statusCode==200){
        String body = utf8.decode(response.bodyBytes);
        //String body = Utf8Decoder().convert(response.bodyBytes);
        final parsed = jsonDecode(body);
        final Map<String, dynamic> data1 = Map<String, dynamic>();
        data1['codigo'] = parsed['codigo'];
        data1['descripcion'] = parsed['descripcion'];
        print(data1);
        return data1;
      }else{
        return null;
      }
    }catch(e){
      print(e);//tal vez guardar en prfs para imprimir
      return null;
    }
  }

  Future<List<dynamic>> getUsers(int page) async {
    try {
      final http.Response response = await http.get("https://reqres.in/api/users?page=$page&delay=3");
      print(response.body);
      if(response.statusCode==200) {
        String body = utf8.decode(response.bodyBytes);
        //String body = Utf8Decoder().convert(response.bodyBytes);
        final parsed = jsonDecode(body);
        print("getUsers ok");
        print(parsed['data'].runtimeType); //averigua que tipo de dato retorna
        return parsed['data'];

      }
      print("error ${response.statusCode}");
      return [];
    }catch(e){
      print(e);
      return [];
    }
  }
}