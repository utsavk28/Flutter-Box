import 'dart:math';
import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionId = 0;
  int _totalScore = 0;

  @override
  Widget build(BuildContext context) {
    final _questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answerOptions': [
          {'text': 'Blue', 'score': 10},
          {'text': 'Red', 'score': 5},
          {'text': 'Green', 'score': 2},
          {'text': 'White', 'score': 20},
        ]
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answerOptions': [
          {'text': 'Horse', 'score': 7},
          {'text': 'Cat', 'score': 3},
          {'text': 'Dog', 'score': 5},
          {'text': 'Mouse', 'score': 10},
        ]
      },
    ];

    void _answerQuestion(int score) {
      _totalScore += score;
      setState(() {
        _questionId = min(_questionId + 1, _questions.length);
      });
    }

    void _resetQuiz() {
      setState(() {
        _questionId = 0;
        _totalScore = 0;
      });
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('First App'),
        ),
        body: _questionId != _questions.length
            ? Quiz(_questions, _questionId, _answerQuestion)
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
