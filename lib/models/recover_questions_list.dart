import 'package:get/get.dart';
import 'package:home_resident/api/reto_api.dart';
import 'package:home_resident/models/question_model.dart';

import 'materia_model.dart';

class RecoverQuestionsList {
  List<Question> _questions = [];
  RetoAPI _retoAPI = RetoAPI();
  List<Question> get questions => this._questions;


  Future<void> load(String materia, String curso) async {
    print("Carga de list<Question>");
    final _reto = await _retoAPI.getReto("6", "4", materia, curso);
    _questions = _reto
        .map(
          (question) => Question(
          id: question['id'],
          question: question['question'],
          image: question['image'],
          options: question['options'].cast<String>(),
          answer: question['answer']),
    ).toList();
    print(_questions);
    //this._loading = false;

  }
  /********************************************************************************/
  List<Materia> _materias = [];
  List<Materia> get materias => this._materias;

  Future<void> loadMateria(String curso) async {
    print("Carga de list<Materia>");
    final _mat = await _retoAPI.getMateriasReto(curso);
    _materias = _mat
        .map(
          (materia) => Materia(
          idMateria: materia['idMateria'],
          nameMateria: materia['nombre'],
          idCurso: materia['idCurso'],
          nameCurso: materia['nombreCurso']),
    ).toList();
    print(_materias);
    //this._loading = false;

  }
}
