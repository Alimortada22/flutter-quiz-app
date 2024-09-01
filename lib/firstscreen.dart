import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen(this.startquiz,{super.key});
final void Function() startquiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 200,color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            "Learn Flutter the fun way",
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          const SizedBox(
            height: 25,
          ),
          OutlinedButton.icon(
              onPressed: startquiz,
              icon: const Icon(Icons.arrow_right_alt_outlined),
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              label: const Text("Start Qiz",style: TextStyle(fontSize: 15,color: Colors.white),))
        ],
      ),
    );
  }
}
