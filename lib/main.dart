import 'package:flutter/material.dart';
import 'package:simran/result.dart';
import './quiz.dart';

void main() => runApp(MyFirstApp());

class MyFirstApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyFirstAppState();
  }
}

class MyFirstAppState extends State<MyFirstApp> {
  var questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      questionIndex = 0;
      _totalScore = 0;
    });
  }

  final questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Red', 'score': 5},
        {'text': 'Blue', 'score': 4},
        {'text': 'Black', 'score': 10}
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Tiger', 'score': 10},
        {'text': 'Panda', 'score': 3},
        {'text': 'Monkey', 'score': 5}
      ],
    },
    {
      'questionText': 'Where do you Live?',
      'answers': [
        {'text': 'Mohali', 'score': 10},
        {'text': 'Chandigarh', 'score': 5},
        {'text': 'Panchkula', 'score': 6}
      ],
    },
  ];

  void answerQuestion(int score) {
    _totalScore += score;
    if (questionIndex < questions.length) {
      print("we have more questions");
    }
    setState(() {
      questionIndex = questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            color: Colors.purple,
            child: Text(
              "My First App",
              style: TextStyle(fontSize: 40),
            ),
          ),
        ),
        body: questionIndex < questions.length
            ? Quiz(
                answerQuestion: answerQuestion,
                questionIndex: questionIndex,
                questions: questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
