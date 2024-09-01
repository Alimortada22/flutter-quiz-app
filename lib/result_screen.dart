import 'package:flutter/material.dart';
import 'package:flutter_quiz/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.selectedanswers, this.resartquiz, {super.key});
  final void Function() resartquiz;
  final List<String> selectedanswers;
  List<Map<String, Object>> getselectedanswer() {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < selectedanswers.length; i++) {
      summary.add({
        "question-index": i,
        "question": quieztions[i].text,
        "selected answer": selectedanswers[i],
        "correct answer": quieztions[i].answers[0]
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    var numcorrect = 0;
    final summarydata = getselectedanswer();
    for (var i = 0; i < summarydata.length; i++) {
      if (summarydata[i]["correct answer"] ==
          summarydata[i]["selected answer"]) {
        numcorrect++;
      }
    }
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
              "You answers $numcorrect of ${quieztions.length} questions correctly ",
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 350,
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(left: 10,right: 10),
                decoration:  BoxDecoration(
                  borderRadius:BorderRadius.circular(15) ,
                    gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 75, 11, 185),
                  Color.fromARGB(255, 77, 44, 170),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...getselectedanswer().map((e) {
                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 16,
                                  backgroundColor: e["selected answer"] ==
                                          e["correct answer"]
                                      ? Colors.greenAccent
                                      : Colors.redAccent,
                                  child: Text(
                                    (((e["question-index"]) as int) + 1)
                                        .toString(),
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e["question"].toString(),
                                        style: GoogleFonts.lato(
                                            color: Colors.purpleAccent,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        e["selected answer"].toString(),
                                        style: GoogleFonts.lato(
                                          color: const Color.fromARGB(
                                              255, 245, 239, 239),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        e["correct answer"].toString(),
                                        style: GoogleFonts.lato(
                                          color: Colors.green[800],
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          OutlinedButton.icon(
            onPressed: resartquiz,
            icon: const Icon(Icons.restart_alt_outlined),
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                backgroundColor: const Color.fromARGB(255, 28, 3, 72),
                foregroundColor: Colors.white),
            label: const Text(
              "Restart Quiz",
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
