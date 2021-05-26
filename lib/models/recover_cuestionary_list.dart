import 'package:home_resident/api/cuestionario_api.dart';
import 'package:home_resident/api/test_api.dart';
import 'package:home_resident/models/cuestionario_model.dart';

import 'puntaje_cuestionario_model.dart';
import 'question_cuestionary_model.dart';

class RecoverCuestionaryList {
  List<QuestionCuestionary> _questions = [];
  TestApi _testAPI = TestApi();
  List<QuestionCuestionary> get questions => this._questions;


  Future<void> loadTest(int Cuestionario) async {
    print("Carga de list<Question> de los cuestionarios");
    final _test = await _testAPI.getTest(Cuestionario);
    _questions = _test
        .map(
          (question) => QuestionCuestionary(
          id: question['id'],
          idQuestion: question['idquestion'],
          question: question['question'],
          assignedScore: question['assignedscore'],
          image: question['image'],
          listIdR: question['listidR'].cast<int>(),
          options: question['options'].cast<String>(),
          answer: question['answer'].cast<int>(),
          answerSelected: [],
          score: 0,
          ),

    ).toList();
    print(_questions);
    //print(_questions[1].score);
    //print(_questions[1].answer);
    //this._loading = false;

  }
  /********************************************************************************/
  CuestionarioApi _cuestionarioApi = CuestionarioApi();
  List<Cuestionario> _cuestionarios = [];
  List<Cuestionario> get cuestionarios => this._cuestionarios;

  Future<void> loadCuestionarios(String nameCurso) async {
    print("Carga de list<Cuestionario>");
    final _listCuestionario = await _cuestionarioApi.getCuestionariosOFCurso(nameCurso);
    _cuestionarios = _listCuestionario
        .map(
          (cuestionary) => Cuestionario(
              idCuestionario: cuestionary['idCuestionario'],
              puntos: cuestionary['puntos'],
              idCurso: cuestionary['idCurso'],
              idMateria: cuestionary['idMateria'],
              nameMateria: cuestionary['nombreMateria'],
              nameCurso: cuestionary['nombreCurso'],
              fechaApertura: cuestionary['fechaInicio'],
              fechaCierre: cuestionary['fechaCierre'],
              tiempoLimite: cuestionary['tiempoLimite']),
    ).toList();
    print(_cuestionarios);
  }

  List<Cuestionario> _cuestionariosOFMateria = [];
  List<Cuestionario> get cuestionariosOFMateria => this._cuestionariosOFMateria;

  Future<void> loadCuestionariosOFMateria(String nameCurso, String nameMateria) async {
    print("Carga de list<Cuestionario> de una materia especifica");
    final _listCuestionarioM = await _cuestionarioApi.getCuestionariosOFMateria(nameCurso, nameMateria);
    _cuestionariosOFMateria = _listCuestionarioM
        .map(
          (cuestionary) => Cuestionario(
          idCuestionario: cuestionary['idCuestionario'],
          puntos: cuestionary['puntos'],
          idCurso: cuestionary['idCurso'],
          idMateria: cuestionary['idMateria'],
          nameMateria: cuestionary['nombreMateria'],
          nameCurso: cuestionary['nombreCurso'],
          fechaApertura: cuestionary['fechaInicio'],
          fechaCierre: cuestionary['fechaCierre'],
          tiempoLimite: cuestionary['tiempoLimite']),
    ).toList();
    print(_cuestionariosOFMateria);
  }
  /********************************************************************************/
  List<PuntajeCuestionario> _cuestionariosResueltos = [];
  List<PuntajeCuestionario> get cuestionariosResueltos => this._cuestionariosResueltos;

  Future<void> loadCuestionariosResueltos(int idAlumno) async {
    print("Carga de lista de cuestionarios resueltos");
    final _listCuestionarioResueltos = await _cuestionarioApi.getListCuestionariosResueltos(idAlumno);
    _cuestionariosResueltos = _listCuestionarioResueltos
        .map(
          (resuelto) => PuntajeCuestionario(
          idAlumno: resuelto['idAlumno'],
          idCuestionario: resuelto['idCuestionario'],
          puntaje: resuelto['puntuacion']),
    ).toList();
    print(_cuestionariosResueltos);
    //print(_cuestionariosResueltos[0].idAlumno);
  }

  /********************************************************************************/
  List<PuntajeCuestionario> _ranking = [];
  List<PuntajeCuestionario> get ranking => this._ranking;

  Future<void> loadRanking(int idCuestionario) async {
    print("Carga el ranking de un cuestionario especifico");
    final _rankingC = await _cuestionarioApi.getRanking(idCuestionario);
    _ranking = _rankingC
        .map(
          (ranking) => PuntajeCuestionario(
          nombre: ranking['nombre'],
          apellido: ranking['apellido'],
          puntaje: ranking['puntos']),
    ).toList();
    print(_ranking);
    //print(_cuestionariosResueltos[0].idAlumno);
  }
}