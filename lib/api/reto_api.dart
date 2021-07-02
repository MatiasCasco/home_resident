import 'dart:convert';
import 'package:http/http.dart' as http; // Alias

class RetoAPI {
  String api = "http://192.168.0.3:8084/homeApi/rest";
  Future<List<dynamic>> getReto(String sizeList, String cantOptions, String materia, String curso) async {
    try {
      /*final http.Response response = await http.get(
          "http://192.168.0.4:8084/homeApi/rest/retoApi/reto/${sizeList}/opciones/${cantOptions}/materia/${materia}");*/
      final http.Response response = await http.get(
          api+"/retoApi/reto/${sizeList}/opciones/${cantOptions}/materia/${materia}/curso/${curso}");
      print(response.body);
      if (response.statusCode == 200) {
        String body = utf8.decode(response.bodyBytes);
        //String body = Utf8Decoder().convert(response.bodyBytes);
        final parsed = jsonDecode(body);
        print("Obtener la estructura de reto");
        print(parsed.runtimeType);
        return parsed;
      }
      print("error ${response.statusCode}");
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
// Este lista todas las materias de un curso especifico
  Future<List<dynamic>> getMateriasReto(String nameCurso) async {
    try {
      final http.Response response = await http.get(
          api+"/materiaApi/materiasNameCurso/${nameCurso}");
      print(response.body);
      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        print("Obtener la estructura de reto");
        print(parsed.runtimeType);
        return parsed;
      }
      print("error ${response.statusCode}");
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
// Este lista las materias que tienen retos disponibles
  Future<List<dynamic>> getMateriasRetoD(String nameCurso) async {
    try {
      final http.Response response = await http.get(
          api+"/materiaApi/retos/${nameCurso}");
      print(response.body);
      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        print("Obtener la estructura de retos disponibles");
        print(parsed.runtimeType);
        return parsed;
      }
      print("error ${response.statusCode}");
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
// Este lista las materias que tienen test habilitados
  Future<List<dynamic>> getMateriasTest(String nameCurso) async {
    try {
      final http.Response response = await http.get(
          api+"/materiaApi/test/${nameCurso}");
      print(response.body);
      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        print("Obtener la estructura de test disponibles");
        print(parsed.runtimeType);
        return parsed;
      }
      print("error ${response.statusCode}");
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}