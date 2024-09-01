import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
   const AnswerButton({super.key, required this.answertext,required this.tapaction});
final String answertext;
final void Function() tapaction;
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
                  onPressed: tapaction,
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 40),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                      backgroundColor: const Color.fromARGB(255, 28, 3, 72),
                      foregroundColor: Colors.white),
                  child:  Text(answertext,textAlign: TextAlign.center,));
  }
}