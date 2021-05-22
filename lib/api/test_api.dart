import 'dart:convert';
import 'package:http/http.dart' as http; // Alias

class TestApi {
  String api = "http://192.168.0.10:8084/homeApi/rest";

  Future<List<dynamic>> getTest(int Cuestionario) async {
    try {
      final http.Response response = await http.get(
          api + "/testApi/test/${Cuestionario}");
      print(response.body);
      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        print("Obtener la estructura de test");
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

  Future<void> addSelectedAnswer(int idAlumno, int selected) async {
    try {
      final http.Response response = await http.post(api + "/testApi/alumno/${idAlumno}/rta/${selected}");
      if (response.statusCode == 200) {
        final dynamic parsed = jsonDecode(response.body);
        print("Se selecciono: $selected por el usuario: $idAlumno");
      } else {
        print("No se logro agregar ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> addPuntajexPregunta(int idAlumno, int pregunta, int puntaje) async {
    try {
      final http.Response response = await http.post(api + "/testApi/pregunta/${pregunta}/alumno/${idAlumno}/puntos/${puntaje}");
      if (response.statusCode == 200) {
        final dynamic parsed = jsonDecode(response.body);
        print("Se agrego el puntaje: $puntaje a la pregunta: $pregunta respondida por el alumno: $idAlumno");
      } else {
        print("No se logro agregar ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> addPuntajexCuestionario(int idAlumno, int cuestionario, int puntaje) async {
    try {
      final http.Response response = await http.post(api + "/testApi/cuestionario/${cuestionario}/alumno/${idAlumno}/puntos/${puntaje}");
      if (response.statusCode == 200) {
        final dynamic parsed = jsonDecode(response.body);
        print("Se agrego el puntaje: $puntaje al cuestionario: $cuestionario resuelto por el alumno: $idAlumno");
      } else {
        print("No se logro agregar ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
  }
}