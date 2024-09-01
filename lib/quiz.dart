
import 'package:flutter/material.dart';
import 'package:flutter_quiz/questions.dart';
import 'package:flutter_quiz/result_screen.dart';
import 'package:flutter_quiz/firstscreen.dart';
import 'package:flutter_quiz/questionscreen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedanswers = [];
  void addselcanswers(String sanswer) {
    selectedanswers.add(sanswer);
    if (selectedanswers.length == quieztions.length) {
      setState(() {
        activescreen = "result-screen";
      });
    }
  }

  var activescreen = "first-screen";
  void switchscreen() {
    setState(() {
      activescreen = "Question-Screen";
    });
  }

  void homescreen() {
    setState(() {
      activescreen = "first-screen";
      selectedanswers = [];
    });
  }

  @override
  Widget build(context) {
    Widget runscreen = FirstScreen(switchscreen);
    if (activescreen == "Question-Screen") {
      runscreen = QuestionScreen(addselcanswers);
    } else if (activescreen == "result-screen") {
      runscreen = ResultScreen(selectedanswers, homescreen);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 28, 3, 72),
            Color.fromARGB(255, 77, 44, 170),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: runscreen,
        ),
      ),
    );
  }
}
