class Questions {
  final String question;
  final int answer, id;
  final List<String> options;

  Questions(
      {required this.question,
      required this.answer,
      required this.id,
      required this.options});
}

const List data = [
  {
    "id": 1,
    "question": "Which of the following is true regarding Flutter?",
    "options": [
      "Flutter is a UI toolkit for creating fast, beautiful, natively compiled mobile applications ",
      "Flutter use one programming language and a single codebase",
      "Flutter is free and open-source.",
      "All of the above",
    ],
    "answer": 3,
  },
  {
    "id": 2,
    "question": "Flutter developed by?",
    "options": [
      "Oracle ",
      "Facebook",
      "Google",
      "IBM",
    ],
    "answer": 2,
  },
  {
    "id": 3,
    "question": "Flutter is not a language; it is an SDK.",
    "options": [
      "TRUE",
      "FALSE",
      "Can be true or false",
      "Can not say",
    ],
    "answer": 0,
  },
  {
    "id": 4,
    "question": "Flutter is mainly optimized for 2D mobile apps that can run on?",
    "options": [
      "Android",
      "iOS",
      "Both A and B",
      "None of the above",
    ],
    "answer": 2,
  },
  {
    "id": 5,
    "question": "A widget that allows us to refresh the screen is called a ____________.",
    "options": [
      "Stateless widgets",
      "Stateful widget",
      "Statebuild widget",
      "All of the above",
    ],
    "answer": 3,
  },
  {
    "id": 6,
    "question": "The examples of the Stateless widget are?",
    "options": [
      "Text",
      "Row",
      "Column",
      "All of the above",
    ],
    "answer": 3,
  }
];
