import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart'; // Alias

class AccountApi {
  _changeValue(parsed)async{
    SharedPreferences prFr = await SharedPreferences.getInstance();
    /*await prFr.setBool("waslogin", true);
    await prFr.setString("email",parsed['email']);
    await prFr.setString("nombreCurso",parsed['nombreCurso']);
    await prFr.setInt("id",parsed['idP']);*/
    final Map<String, dynamic> data1 = Map<String, dynamic>();
    data1['alumno'] = parsed['idP'];
    data1['curso'] = parsed['nombreCurso'];
    data1['rol'] = parsed['rol'];
    data1['email'] = parsed['email'];
    data1['name'] = parsed['name'];
    int idAlumno = data1["alumno"] as int;
    String curso = data1["curso"].toString();
    int rol = data1["rol"] as int;
    String name =data1["name"].toString();
    String email = data1["email"].toString();
    await prFr.setString("Curso", curso);
    await prFr.setInt("Alumno", idAlumno);
    await prFr.setString("email", email);
    await prFr.setString("name", name);
    await prFr.setInt("rol", rol);
   
  }

  Future<bool> login(String email, String password) async
  {
    SharedPreferences prFr =await SharedPreferences.getInstance();///guara waslogin en memeoria

    // Uri uri =Uri.http("192.168.43.116:8084/proyectoapiMySql/rest/personapi/log");
    Uri uri=new Uri(scheme: 'http',host: '192.168.43.116',path: 'proyectoapiMySql/rest/personapi/log',port: 8084);//funciona
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
        print("login ok ${parsed['idP']}: user: ${parsed['email']}: islog?${parsed['isLog']}");
        if(parsed['isLog']){
          await _changeValue(parsed);
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
    Uri uri=new Uri(scheme: 'http',host: '192.168.43.116', path: 'proyectoapiMySql/rest/personapi/log', port: 8084);//funciona
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
    Uri uri=new Uri(scheme: 'http',host: '192.168.43.116', path: 'proyectoapiMySql/rest/personapi/password', port: 8084);//funciona
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