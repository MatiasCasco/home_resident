import 'dart:convert';
import 'package:http/http.dart' as http; // Alias

class TestApi {
  String api = "http://192.168.0.14:8084/homeApi/rest";

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
}