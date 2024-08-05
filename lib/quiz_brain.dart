import 'package:quizappg9/models/question_model.dart';

class QuizBrain {
  List<QuestionModel> questionList = [
    QuestionModel(question: "¿Has almorzado hoy??", answer: false),
    QuestionModel(question: "¿El hombre llego a la luna?", answer: true),
    QuestionModel(question: "¿Saliste ayer?", answer: false),
    QuestionModel(question: "¿Has desayunado?", answer: true),
    QuestionModel(question: "¿Sientes frio?", answer: false),
  ];
  int questionIndex = 0;

  String getQuestionText() {
    return questionList[questionIndex].question;
  }

  bool getQuestionAnswer() {
    return questionList[questionIndex].answer;
  }

  void nextQuestion() {
    if (questionIndex < questionList.length - 1) {
      questionIndex++;
    }
  }

  String getNumberQuestion() {
    return (questionIndex + 1).toString();
  }

  bool isFinished() {
    return questionIndex >= questionList.length - 1;
  }

  void restartQuiz() {
    questionIndex = 0;
  }
}