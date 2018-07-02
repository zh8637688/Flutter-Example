import 'package:flutter/material.dart';
import 'chess.dart';

class Chessboard extends StatelessWidget {
  final List<int> chess;

  Chessboard({Key key, @required this.chess}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = new List();
    children.add(_buildChessboard());
    children.addAll(_buildChess());
    return new Container(
        width: 330.0,
        height: 330.0,
        decoration: new BoxDecoration(
            color: new Color(0xffbbada3),
            borderRadius: new BorderRadius.all(new Radius.circular(5.0))
        ),
        padding: EdgeInsets.all(4.0),
        margin: EdgeInsets.only(top: 30.0),
        child: new Stack(
            children: children
        )
    );
  }

  List<Widget> _buildChess() {
    List<Widget> children = new List();
    for (int i = 0; i < chess.length; i++) {
      if (chess[i] > 0) {
        children.add(new Positioned(
            top: (i / 4).floor() * (72.5 + 8),
            left: i % 4 * (72.5 + 8),
            child: new Chess(value: chess[i])
        ));
      }
    }
    return children;
  }

  Widget _buildChessboard() {
    return new Column(
      children: <Widget>[
        _buildColumn(),
        _buildColumn(),
        _buildColumn(),
        _buildColumn()
      ],
    );
  }

  Widget _buildColumn() {
    return new Row(
      children: <Widget>[
        _buildCell(),
        _buildCell(),
        _buildCell(),
        _buildCell()
      ],
    );
  }

  Widget _buildCell() {
    return new Container(
      width: 72.5,
      height: 72.5,
      margin: EdgeInsets.all(4.0),
      decoration: new BoxDecoration(
          color: new Color(0xffd5cbc0),
          borderRadius: new BorderRadius.all(new Radius.circular(5.0))
      ),
    );
  }
}