import 'package:flutter/material.dart';
import 'constants/pages.dart';
import 'package:zhihu_daily/manager/skinManager.dart';
import 'package:zhihu_daily/utils/routeUtil.dart';

void main() {
  RouteUtil route = RouteUtil(
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