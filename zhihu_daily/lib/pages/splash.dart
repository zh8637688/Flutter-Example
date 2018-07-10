import 'dart:async';
import 'package:flutter/material.dart';
import '../pages/home.dart';
import '../widgets/animatedLogo.dart';

class PageSplash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _PageState();
  }
}

class _PageState extends State<PageSplash> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = new Tween(begin: 84.0, end: 0.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Expanded(child: _buildBackgroundImage()),
        new Container(
          height: 84.0,
          color: new Color(0xff17181a),
          child: _buildLogoAndSlogan(context),
        )
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget _buildBackgroundImage() {
    return Image.asset(
      'res/images/splash.png',
      fit: BoxFit.fill,
      width: 360.0,
    );
  }

  Widget _buildLogoAndSlogan(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(top: animation.value),
      child: new Row(
        children: <Widget>[
          _buildLogo(context),
          _buildSlogan()
        ],
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return new Container(
      width: 45.0,
      height: 45.0,
      margin: EdgeInsets.only(left: 25.5, right: 12.5),
      child: new AnimatedLogo(callback: (status) {
        if (status == AnimationStatus.completed) {
          new Future.delayed(new Duration(milliseconds: 800), () {
            _openHomePage(context);
          });
        }
      }),
    );
  }

  Widget _buildSlogan() {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Text(
          '知乎日报',
          style: new TextStyle(
            fontSize: 20.0,
            color: new Color(0xffced2d9),
          ),
        ),
        new Text(
          '每天三次，每次七分钟',
          style: new TextStyle(
            fontSize: 14.0,
            color: new Color(0xff85888c),
          ),
        )
      ],
    );
  }

  _openHomePage(BuildContext context) {
    Navigator.pushReplacement(context,
        new PageRouteBuilder(
            pageBuilder: (BuildContext context, _, __) {
              return new PageHome();
            },
            transitionsBuilder: (_, Animation<double> animation, __,
                Widget child) {
              return new SlideTransition(
                  position: new Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: const Offset(0.0, 0.0),
                  ).animate(animation),
                  child: child
              );
            }
        )
    );
  }
}