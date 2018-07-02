import 'package:flutter/material.dart';
import 'scoreTitle.dart';
import 'chessboard.dart';

class Flutter2048 extends StatefulWidget {
  @override
  _Flutter2048State createState() => new _Flutter2048State();
}

class _Flutter2048State extends State<Flutter2048> {
  int score;
  int best;

  @override
  void initState() {
    super.initState();
    setState(() {
      score = 0;
      best = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Flutter 2048'),
          backgroundColor: new Color(0xff3c3c3a),
        ),
        body: new Container(
          color: new Color(0xfffaf8ef),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new ScoreTitle(score: score, best: best),
              new Chessboard()
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(new Flutter2048());
}