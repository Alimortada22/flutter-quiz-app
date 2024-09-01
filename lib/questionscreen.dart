import 'package:flutter/material.dart';
import 'package:flutter_quiz/answer_button.dart';
import 'package:flutter_quiz/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.selcanswer, {super.key});
  final void Function(String) selcanswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  int i = 0;
  void switchquestion(String selanswer) {
    widget.selcanswer(selanswer);

    setState(() {
      i += 1;
    });
  }

  @override
  Widget build(context) {
    final currentquestion = quieztions[i];

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 28, 3, 72),
            Color.fromARGB(255, 77, 44, 170),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  currentquestion.text,
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
                ...currentquestion.getshufeld().map((answer) {
                  return AnswerButton(
                    answertext: answer,
                    tapaction: () {
                      switchquestion(answer);
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
