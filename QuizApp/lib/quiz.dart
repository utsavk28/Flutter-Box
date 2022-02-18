import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String,Object>> questions;
  final int questionId;
  final Function answerQuestion;

  const Quiz(this.questions,this.questionId,this.answerQuestion,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
          (questions[questionId]['questionText'] as String),
        ),
        ...(questions[questionId]['answerOptions'] as List<Map<String,Object>>)
            .map((answer) {
          return Answer((answer['text'] as String), () => answerQuestion(answer['score']));
        }).toList(),
      ],
    );
  }
}
