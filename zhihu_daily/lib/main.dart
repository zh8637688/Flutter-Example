import 'package:flutter/material.dart';
import 'constants/pages.dart';
import 'package:zhihu_daily/manager/skinManager.dart';
import 'package:zhihu_daily/route/routeGenerator.dart';

void main() {
  RouteGenerator route = RouteGenerator(
      routes: Pages.routes
  );
  runApp(SkinManager().wrap(
    themeBuilder: (brightness) =>
        ThemeData(brightness: brightness),
    themedWidgetBuilder: (context, theme) {
      return MaterialApp(
        theme: theme,
        home: Scaffold(
          body: Pages.firstPage(context),
        ),
        onGenerateRoute: route.onGenerateRoute
      );
    },
  ));
}