import 'package:flutter/material.dart';

class ScoreTitle extends StatelessWidget {
  final int score;
  final int best;

  ScoreTitle({
    Key key,
    @required this.score,
    @required this.best
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 110.0,
      margin: EdgeInsets.only(left: 15.0, right: 15.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildLogo(),
          _buildScorePanel()
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return new Container(
      decoration: new BoxDecoration(
          color: new Color(0xffecc140),
          borderRadius: new BorderRadius.all(new Radius.circular(5.0))
      ),
      width: 110.0,
      height: 110.0,
      margin: EdgeInsets.only(right: 20.0),
      child: new Center(
        child: new Text(
          '2048',
          style: new TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: new Color(0xfffbfdfb)
          ),
        ),
      ),
    );
  }

  Widget _buildScorePanel() {
    return new Expanded(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildScore('SCORE', score),
              _buildScore('BEST', best),
            ],
          ),
          new Expanded(
              child: new Center(
                child: new Text(
                  'Join numbers to reach 2048.',
                  style: new TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: new Color(0xff736d64)
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }

  Widget _buildScore(String title, int score) {
    return new Container(
      decoration: new BoxDecoration(
          color: new Color(0xffbbada3),
          borderRadius: new BorderRadius.all(new Radius.circular(5.0))
      ),
      width: 90.0,
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          new Text(
            title,
            style: new TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: new Color(0xfff0e9db)
            ),
          ),
          new Container(
            margin: EdgeInsets.only(top: 4.0),
            child: new Text(
              score.toString(),
              style: new TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: new Color(0xfffbfdfb)
              ),
            ),
          )
        ],
      ),
    );
  }
}