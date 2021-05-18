import 'package:home_resident/api/test_api.dart';

import 'question_cuestionary_model.dart';

class RecoverCuestionaryList {
  List<QuestionCuestionary> _questions = [];
  TestApi _testAPI = TestApi();
  List<QuestionCuestionary> get questions => this._questions;


  Future<void> loadTest(int Cuestionario) async {
    print("Carga de list<Question>");
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
}