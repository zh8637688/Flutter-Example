import 'package:flutter/material.dart';
import 'constants/pages.dart';
import 'pages/splash.dart';
import 'pages/home.dart';

void main() {
  runApp(new MaterialApp(
    home: new Scaffold(
      body: new PageSplash(),
    ),
    routes: <String, WidgetBuilder>{
      Pages.splash: (BuildContext context) => new PageSplash(),
      Pages.home: (BuildContext context) => new PageHome()
    },
  ));
}