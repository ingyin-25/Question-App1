import 'package:app1/main.dart';
import 'package:flutter/cupertino.dart';

class Question {
  String? questionText;
  bool? answerText;
  Question({this.questionText, this.answerText});
}//Class-Question

class Quizbrain{
  int questionnum=0;
  List<Question> questiondata=[
    Question(questionText:'Question-1-TRUE', answerText:true),
    Question(questionText:'Question-2-FALSE', answerText:false),
    Question(questionText:'Question-3-TRUE', answerText:true),
    Question(questionText:'Question-4-FALSE', answerText:false),
    Question(questionText:'Question-5-TRUE', answerText:true),
    Question(questionText:'Question-6-FALSE', answerText:false),
  ];
  String getQuestion() {return questiondata[questionnum].questionText.toString();}
  getAnswer() {return questiondata[questionnum].answerText;}
  void next(){
    if (questionnum < questiondata.length-1) {
      print(questionnum);
      print(questiondata.length);
      questionnum++;
    }
    else{
      questionnum=0;
      runApp(MyAlert());
    }
  }
}//Class-Quizbrain