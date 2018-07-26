import 'package:flutter/material.dart';
import 'constants/pages.dart';
import 'pages/splash.dart';
import 'pages/home.dart';
import 'package:zhihu_daily/manager/skinManager.dart';

void main() {
  runApp(SkinManager().wrap(
    themeBuilder: (brightness) =>
        ThemeData(brightness: brightness),
    themedWidgetBuilder: (context, theme) {
      return MaterialApp(
        theme: theme,
        home: Scaffold(
          body: PageSplash(),
        ),
        routes: <String, WidgetBuilder>{
          Pages.splash: (BuildContext context) => PageSplash(),
          Pages.home: (BuildContext context) => PageHome()
        },
      );
    },
  ));
}