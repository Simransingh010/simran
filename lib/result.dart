import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'you did it';
    if (resultScore <= 15) {
      resultText = 'you are awesome and Innocent';
    } else if (resultScore <= 20) {
      resultText = "you are Pretty Likable";
    } else {
      resultText = "you are bad";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          resultPhrase,
          style: TextStyle(
              fontSize: 50, color: Colors.red, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        TextButton(
          onPressed: resetHandler as void Function(),
          child: Text(
            "Restart Quiz",
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ),
      ],
    ));
  }
}
