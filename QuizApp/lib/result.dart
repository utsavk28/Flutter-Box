import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetQuiz;
  const Result(this.resultScore,this.resetQuiz, {Key? key}) : super(key: key);

  String get resultPhrase {
    String resultText = 'Your Score is \n';
    resultText += resultScore.toString();
    resultText += ' Points!!';
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          child: Text(
            resultPhrase,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.white,
            ),
            onPressed: resetQuiz,
            child: const Text('Reset'),
          ),
        )
      ],
    );
  }
}
