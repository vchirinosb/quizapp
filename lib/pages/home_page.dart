import 'package:flutter/material.dart';
import 'package:quizappg9/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  QuizBrain quizBrain = QuizBrain();
  List<Widget> score = [];

  void checkAnswer(bool userAnswer, String numberQuestion) {
    bool correctAnswer = quizBrain.getQuestionAnswer();
    if (correctAnswer == userAnswer) {
      score.add(itemScore(numberQuestion, true));
    } else {
      score.add(itemScore(numberQuestion, false));
    }
    if (quizBrain.isFinished()) {
      Alert(
          context: context,
          type: AlertType.info,
          title: "Quiz App",
          desc: "El cuestionario ha llego a su fin",
          buttons: [
            DialogButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                  quizBrain.restartQuiz();
                  score.clear();
                  setState(() {});
                })
          ]).show();
    } else {
      quizBrain.nextQuestion();
    }
    setState(() {});
  }

  Widget itemScore(String numberQuestion, bool isCorrect) {
    return Row(
      children: [
        Text(
          numberQuestion,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        Icon(
          isCorrect ? Icons.check : Icons.close,
          color: isCorrect ? Colors.greenAccent : Colors.redAccent,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2B2E42),
      appBar: AppBar(
        backgroundColor: const Color(0xff2B2E42),
        elevation: 10,
        centerTitle: true,
        title: const Text(
          "Quiz App",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  color: Colors.greenAccent,
                  minWidth: double.infinity,
                  onPressed: () {
                    checkAnswer(true, quizBrain.getNumberQuestion());
                  },
                  child: const Text("Verdadero"),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  color: Colors.redAccent,
                  minWidth: double.infinity,
                  onPressed: () {
                    checkAnswer(false, quizBrain.getNumberQuestion());
                  },
                  child: const Text("false"),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: score,
            )
          ],
        ),
      ),
    );
  }
}