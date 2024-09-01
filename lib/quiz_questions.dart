class QuizQuestion{
   const QuizQuestion(this.text,this.answers);
  final String text;
 final  List<String> answers;
 List<String> getshufeld(){
  final shufulledlist = List.of(answers);
  shufulledlist.shuffle();
  return shufulledlist;
 }
}