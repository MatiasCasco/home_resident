class QuestionCuestionary {
  final int id;
  final List<int> answer;
  final int idQuestion;
  final String question;
  final String image;
  final List<int> listIdR;
  final List<String> options;
  final List<int> answerSelected;
  final int assignedScore;
  int score = 0;

  QuestionCuestionary({
    this.id,
    this.answer,
    this.idQuestion,
    this.question,
    this.image,
    this.listIdR,
    this.options,
    this.answerSelected,
    this.assignedScore,
    this.score});
//QuestionCuestionary ({this.id, this.question, this.image, this.answer, this.options, this.answerSelected, this.score});

}

const List sample_data = [
  {
    "id": 1,
    "question":
    "Flutter is an open-source UI software development kit created by ______",
    "image" : "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": [1,2],
  },
  {
    "id": 2,
    "question": "When google release Flutter.",
    "image" : " ",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": [2],
  },
  {
    "id": 3,
    "question": "A memory location that holds a single letter or number.",
    "image": "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": [2],
  },
  {
    "id": 4,
    "question": "What command do you use to output data to the screen?",
    "image" : " ",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": [1,2],
  }
  /*
  {
    "id": 5,
    "question":
    "Flutter is an open-source UI software development kit created by ______",
    "image" : "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": [1,2],
  },
  {
    "id": 6,
    "question": "When google release Flutter.",
    "image" : " ",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": [2],
  },
  {
    "id": 7,
    "question": "A memory location that holds a single letter or number.",
    "image": "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": [2],
  },
  {
    "id": 8,
    "question": "What command do you use to output data to the screen?",
    "image" : " ",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": [1,2],
  },
  {
    "id": 9,
    "question":
    "Flutter is an open-source UI software development kit created by ______",
    "image" : "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": [1,2],
  },
  {
    "id": 10,
    "question": "When google release Flutter.",
    "image" : " ",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": [2],
  },
  {
    "id": 11,
    "question": "A memory location that holds a single letter or number.",
    "image": "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": [2],
  },
  {
    "id": 12,
    "question": "What command do you use to output data to the screen?",
    "image" : " ",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": [1,2],
  },
  {
    "id": 13,
    "question":
    "Flutter is an open-source UI software development kit created by ______",
    "image" : "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": [1,2],
  },
  {
    "id": 14,
    "question": "When google release Flutter.",
    "image" : " ",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": [2],
  },
  {
    "id": 15,
    "question": "A memory location that holds a single letter or number.",
    "image": "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": [2],
  },
  {
    "id": 16,
    "question": "What command do you use to output data to the screen?",
    "image" : " ",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": [1,2],
  },
  {
    "id": 17,
    "question":
    "Flutter is an open-source UI software development kit created by ______",
    "image" : "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": [1,2],
  },
  {
    "id": 18,
    "question": "When google release Flutter.",
    "image" : " ",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": [2],
  },
  {
    "id": 19,
    "question": "A memory location that holds a single letter or number.",
    "image": "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": [2],
  },
  {
    "id": 20,
    "question": "What command do you use to output data to the screen?",
    "image" : " ",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": [1,2],
  },
  {
    "id": 21,
    "question":
    "Flutter is an open-source UI software development kit created by ______",
    "image" : "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": [1,2],
  },
  {
    "id": 22,
    "question": "When google release Flutter.",
    "image" : " ",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": [2],
  },
  {
    "id": 23,
    "question": "A memory location that holds a single letter or number.",
    "image": "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": [2],
  },
  {
    "id": 24,
    "question": "What command do you use to output data to the screen?",
    "image" : " ",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": [1,2],
  },
  {
    "id": 25,
    "question":
    "Flutter is an open-source UI software development kit created by ______",
    "image" : "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": [1,2],
  },
  {
    "id": 26,
    "question": "When google release Flutter.",
    "image" : " ",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": [2],
  },
  {
    "id": 27,
    "question": "A memory location that holds a single letter or number.",
    "image": "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": [2],
  },
  {
    "id": 28,
    "question": "What command do you use to output data to the screen?",
    "image" : " ",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": [1,2],
  },
  {
    "id": 29,
    "question":
    "Flutter is an open-source UI software development kit created by ______",
    "image" : "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": [1,2],
  },
  {
    "id": 30,
    "question": "When google release Flutter.",
    "image" : " ",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": [2],
  },
  {
    "id": 31,
    "question": "A memory location that holds a single letter or number.",
    "image": "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": [2],
  },
  {
    "id": 32,
    "question": "What command do you use to output data to the screen?",
    "image" : " ",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": [1,2],
  },
  {
    "id": 33,
    "question":
    "Flutter is an open-source UI software development kit created by ______",
    "image" : "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": [1,2],
  },
  {
    "id": 34,
    "question": "When google release Flutter.",
    "image" : " ",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": [2],
  },
  {
    "id": 35,
    "question": "A memory location that holds a single letter or number.",
    "image": "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": [2],
  },
  {
    "id": 36,
    "question": "What command do you use to output data to the screen?",
    "image" : " ",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": [1,2],
  },
  {
    "id": 37,
    "question":
    "Flutter is an open-source UI software development kit created by ______",
    "image" : "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": [1,2],
  },
  {
    "id": 38,
    "question": "When google release Flutter.",
    "image" : " ",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": [2],
  },
  {
    "id": 39,
    "question": "A memory location that holds a single letter or number.",
    "image": "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": [2],
  },
  {
    "id": 40,
    "question": "What command do you use to output data to the screen?",
    "image" : " ",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": [1,2],
  },
  {
    "id": 41,
    "question":
    "Flutter is an open-source UI software development kit created by ______",
    "image" : "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": [1,2],
  },
  {
    "id": 42,
    "question": "When google release Flutter.",
    "image" : " ",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": [2],
  },
  {
    "id": 43,
    "question": "A memory location that holds a single letter or number.",
    "image": "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": [2],
  },
  {
    "id": 44,
    "question": "What command do you use to output data to the screen?",
    "image" : " ",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": [1,2],
  },
  {
    "id": 45,
    "question":
    "Flutter is an open-source UI software development kit created by ______",
    "image" : "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": [1,2],
  },
  {
    "id": 46,
    "question": "When google release Flutter.",
    "image" : " ",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": [2],
  },
  {
    "id": 47,
    "question": "A memory location that holds a single letter or number.",
    "image": "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": [2],
  },
  {
    "id": 48,
    "question": "What command do you use to output data to the screen?",
    "image" : " ",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": [1,2],
  },
  {
    "id": 49,
    "question":
    "Flutter is an open-source UI software development kit created by ______",
    "image" : "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": [1,2],
  },
  {
    "id": 50,
    "question": "When google release Flutter.",
    "image" : " ",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": [2],
  },
  {
    "id": 51,
    "question": "A memory location that holds a single letter or number.",
    "image": "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": [2],
  },
  {
    "id": 52,
    "question": "What command do you use to output data to the screen?",
    "image" : " ",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": [1,2],
  },
  {
    "id": 53,
    "question":
    "Flutter is an open-source UI software development kit created by ______",
    "image" : "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": [1,2],
  },
  {
    "id": 54,
    "question": "When google release Flutter.",
    "image" : " ",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": [2],
  },
  {
    "id": 55,
    "question": "A memory location that holds a single letter or number.",
    "image": "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": [2],
  },
  {
    "id": 56,
    "question": "What command do you use to output data to the screen?",
    "image" : " ",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": [1,2],
  },
  {
    "id": 57,
    "question":
    "Flutter is an open-source UI software development kit created by ______",
    "image" : "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": [1,2],
  },
  {
    "id": 58,
    "question": "When google release Flutter.",
    "image" : " ",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": [2],
  },
  {
    "id": 59,
    "question": "A memory location that holds a single letter or number.",
    "image": "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": [2],
  },
  {
    "id": 60,
    "question": "What command do you use to output data to the screen?",
    "image" : " ",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": [1,2],
  },
  {
    "id": 61,
    "question":
    "Flutter is an open-source UI software development kit created by ______",
    "image" : "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": [1,2],
  },
  {
    "id": 62,
    "question": "When google release Flutter.",
    "image" : " ",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": [2],
  },
  {
    "id": 63,
    "question": "A memory location that holds a single letter or number.",
    "image": "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": [2],
  },
  {
    "id": 64,
    "question": "What command do you use to output data to the screen?",
    "image" : " ",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": [1,2],
  },
  {
    "id": 65,
    "question":
    "Flutter is an open-source UI software development kit created by ______",
    "image" : "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": [1,2],
  },
  {
    "id": 66,
    "question": "When google release Flutter.",
    "image" : " ",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": [2],
  },
  {
    "id": 67,
    "question": "A memory location that holds a single letter or number.",
    "image": "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": [2],
  },
  {
    "id": 68,
    "question": "What command do you use to output data to the screen?",
    "image" : " ",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": [1,2],
  },
  {
    "id": 69,
    "question":
    "Flutter is an open-source UI software development kit created by ______",
    "image" : "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": [1,2],
  },
  {
    "id": 70,
    "question": "When google release Flutter.",
    "image" : " ",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": [2],
  },
  {
    "id": 71,
    "question": "A memory location that holds a single letter or number.",
    "image": "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": [2],
  },
  {
    "id": 72,
    "question": "What command do you use to output data to the screen?",
    "image" : " ",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": [1,2],
  },
  {
    "id": 73,
    "question":
    "Flutter is an open-source UI software development kit created by ______",
    "image" : "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": [1,2],
  },
  {
    "id": 74,
    "question": "When google release Flutter.",
    "image" : " ",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": [2],
  },
  {
    "id": 75,
    "question": "A memory location that holds a single letter or number.",
    "image": "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": [2],
  },
  {
    "id": 76,
    "question": "What command do you use to output data to the screen?",
    "image" : " ",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": [1,2],
  },
  {
    "id": 77,
    "question":
    "Flutter is an open-source UI software development kit created by ______",
    "image" : "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": [1,2],
  },
  {
    "id": 78,
    "question": "When google release Flutter.",
    "image" : " ",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": [2],
  },
  {
    "id": 79,
    "question": "A memory location that holds a single letter or number.",
    "image": "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": [2],
  },
  {
    "id": 80,
    "question": "What command do you use to output data to the screen?",
    "image" : " ",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": [1,2],
  },
  {
    "id": 81,
    "question":
    "Flutter is an open-source UI software development kit created by ______",
    "image" : "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": [1,2],
  },
  {
    "id": 82,
    "question": "When google release Flutter.",
    "image" : " ",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": [2],
  },
  {
    "id": 83,
    "question": "A memory location that holds a single letter or number.",
    "image": "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": [2],
  },
  {
    "id": 84,
    "question": "What command do you use to output data to the screen?",
    "image" : " ",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": [1,2],
  },
  {
    "id": 85,
    "question":
    "Flutter is an open-source UI software development kit created by ______",
    "image" : "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": [1,2],
  },
  {
    "id": 86,
    "question": "When google release Flutter.",
    "image" : " ",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": [2],
  },
  {
    "id": 87,
    "question": "A memory location that holds a single letter or number.",
    "image": "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": [2],
  },
  {
    "id": 88,
    "question": "What command do you use to output data to the screen?",
    "image" : " ",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": [1,2],
  },
  {
    "id": 89,
    "question":
    "Flutter is an open-source UI software development kit created by ______",
    "image" : "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": [1,2],
  },
  {
    "id": 90,
    "question": "When google release Flutter.",
    "image" : " ",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": [2],
  },
  {
    "id": 91,
    "question": "A memory location that holds a single letter or number.",
    "image": "https://cdn.pixabay.com/photo/2021/03/22/11/40/bonsai-6114252_960_720.jpg",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": [2],
  },
  {
    "id": 92,
    "question": "What command do you use to output data to the screen?",
    "image" : " ",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": [1,2],
  },*/

];