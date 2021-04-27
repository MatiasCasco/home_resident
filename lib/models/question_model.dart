class Question {
  final int id, answer;
  final String question;
  final String image;
  final List<String> options;

  Question ({this.id, this.question, this.image, this.answer, this.options});

/*
  factory Question.fromJson(Map<String, dynamic> parsedJson) {
    var optionsFromJson  = parsedJson['options'];
    //print(streetsFromJson.runtimeType);
    // List<String> streetsList = new List<String>.from(streetsFromJson);
    List<String> optionsList = optionsFromJson.cast<String>();
    return new Question(
      id: parsedJson['id'],
      question: parsedJson['question'],
      image: parsedJson['image'],
      answer: parsedJson['answer'],
      options: optionsList,
    );
  } */

}

const List sample_data = [
  {
    "id": 1,
    "question":
    "Flutter is an open-source UI software development kit created by ______",
    "image" : "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "When google release Flutter.",
    "image" : " ",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "A memory location that holds a single letter or number.",
    "image": "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "What command do you use to output data to the screen?",
    "image" : " ",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": 2,
  },
];