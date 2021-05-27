import 'dart:convert';
import 'package:http/http.dart' as http; // Alias

class CuestionarioApi {
  String api = "http://192.168.0.10:8084/homeApi/rest";

  Future<List<dynamic>> getCuestionariosOFCurso(String nameCurso) async {
    try {
      final http.Response response = await http.get(
          api + "/cuestionarioApi/cuestionariosOFCurso/${nameCurso}");
      print(response.body);
      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        print("Obtener la lista de cuestionarios");
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

  Future<List<dynamic>> getCuestionariosOFMateria(String nameCurso, String nameMateria) async {
    try {
      final http.Response response = await http.get(
          api + "/cuestionarioApi/cursoName/${nameCurso}/materiaName/${nameMateria}");
      print(response.body);
      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        print("Obtener la lista de cuestionarios");
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

  Future<List<dynamic>> getRankingGlobal(String nameCurso, String nameMateria) async {
    try {
      final http.Response response = await http.get(
          api + "/puntajeApi/rankingGlobal/curso/${nameCurso}/materia/${nameMateria}");
      print(response.body);
      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        print("Obtener la lista de rankin global");
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

  Future<List<dynamic>> getListCuestionariosResueltos(int idAlumno) async {
    try {
      final http.Response response = await http.get(
          api + "/puntajeApi/resueltos/${idAlumno}");
      print(response.body);
      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        print("Obtener la lista de cuestionarios");
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

  Future<List<dynamic>> getRanking(int idCuestionario) async {
    try {
      final http.Response response = await http.get(
          api + "/puntajeApi/ranking/${idCuestionario}");
      print(response.body);
      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        print("Obtener la lista de cuestionarios");
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