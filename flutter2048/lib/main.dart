import 'package:flutter/material.dart';
import 'package:flutter2048/widget/scoreTitle.dart';
import 'package:flutter2048/widget/chessboard.dart';
import 'package:flutter2048/logic/game.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Flutter2048 extends StatefulWidget {
  @override
  _Flutter2048State createState() => new _Flutter2048State();
}

class _Flutter2048State extends State<Flutter2048> {
  int score;
  int best;
  List<int> chess;

  @override
  void initState() {
    super.initState();
    setState(() {
      score = 0;
      best = 0;
      chess = initChess();
    });
    _getBestFromLocal();
  }

  _getBestFromLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      best = prefs.getInt('best') ?? 0;
    });
  }

  _saveBestToLocal(int best) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('best', best);
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
            child: new GestureDetector(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new ScoreTitle(score: score, best: best),
                  new Chessboard(chess: chess)
                ],
              ),
              onHorizontalDragEnd: onHorizontalDragEnd,
              onVerticalDragEnd: onVerticalDragEnd,
            )
        ),
      ),
    );
  }

  onHorizontalDragEnd(details) {
    var result;
    if (details.primaryVelocity > 0.0) {
      result = flingTo(this.chess, 0);
    } else {
      result = flingTo(this.chess, 1);
    }
    int score = this.score + result['score'];
    if (score > best) {
      best = score;
      _saveBestToLocal(best);
    }
    setState(() {
      this.score = score;
      this.best = best;
      this.chess = result['chess'];
    });
  }

  onVerticalDragEnd(details) {
    var result;
    if (details.primaryVelocity < 0.0) {
      result = flingTo(this.chess, 2);
    } else {
      result = flingTo(this.chess, 3);
    }
    int score = this.score + result['score'];
    if (score > best) {
      best = score;
      _saveBestToLocal(best);
    }
    setState(() {
      this.score = score;
      this.best = best;
      this.chess = result['chess'];
    });
  }
}

void main() {
  runApp(new Flutter2048());
}