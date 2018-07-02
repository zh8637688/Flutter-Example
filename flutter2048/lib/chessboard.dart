import 'package:flutter/material.dart';

class Chessboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 330.0,
      height: 330.0,
      decoration: new BoxDecoration(
          color: new Color(0xffbbada3),
          borderRadius: new BorderRadius.all(new Radius.circular(5.0))
      ),
      padding: EdgeInsets.all(4.0),
      margin: EdgeInsets.only(top: 30.0),
      child: new Column(
        children: <Widget>[
          _buildColumn(),
          _buildColumn(),
          _buildColumn(),
          _buildColumn()
        ],
      ),
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