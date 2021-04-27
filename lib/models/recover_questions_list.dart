import 'package:get/get.dart';
import 'package:home_resident/api/reto_api.dart';
import 'package:home_resident/models/question_model.dart';

class RecoverQuestionsList {
  List<Question> _questions = [];
  RetoAPI _retoAPI = RetoAPI();
  List<Question> get questions => this._questions;


  Future<void> load() async {
    print("Carga de list<Question>");
    final _reto = await _retoAPI.getReto("6", "4", "matematica");
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

}
