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
}