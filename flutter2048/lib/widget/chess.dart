import 'package:flutter/material.dart';

class Chess extends StatelessWidget {
  final int value;

  Chess({
    Key key,
    @required this.value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = _getBackgroundColor();
    TextStyle textStyle = _getTextStyle();
    return new Container(
      width: 72.5,
      height: 72.5,
      margin: EdgeInsets.all(4.0),
      decoration: new BoxDecoration(
          color: backgroundColor,
          borderRadius: new BorderRadius.all(new Radius.circular(5.0))
      ),
      alignment: Alignment.center,
      child: new Text(
          value.toString(),
          style: textStyle
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (value) {
      case 2:
        return new Color(0xffeee4da);
      case 4:
        return new Color(0xffeee1ca);
      case 8:
        return new Color(0xfff1b17e);
      case 16:
        return new Color(0xfff49669);
      case 32:
        return new Color(0xfff57c63);
      case 64:
        return new Color(0xfff46043);
      case 128:
        return new Color(0xffeccf79);
      case 256:
        return new Color(0xffeccb6a);
      case 512:
        return new Color(0xffecc85a);
      case 1024:
        return new Color(0xffecc44c);
      default:
        return new Color(0xffecc140);
    }
  }

  TextStyle _getTextStyle() {
    double fontSize;
    Color fontColor;
    if (value >= 8) {
      fontColor = new Color(0xfff9f6f2);
    } else {
      fontColor = new Color(0xff776d68);
    }

    if (value < 128) {
      fontSize = 28.0;
    } else if (value < 256) {
      fontSize = 26.0;
    } else if (value < 1024) {
      fontSize = 24.0;
    } else {
      fontSize = 22.0;
    }
    return new TextStyle(
        fontSize: fontSize,
        color: fontColor,
        fontWeight: FontWeight.bold
    );
  }
}