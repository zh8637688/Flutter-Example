import 'package:flutter/material.dart';
import 'constants/pages.dart';
import 'package:zhihu_daily/manager/usrInfoManager.dart';
import 'package:zhihu_daily/manager/skinManager.dart';
import 'package:zhihu_daily/route/routeGenerator.dart';
import 'package:zhihu_daily/route/interceptors/loginInterceptor.dart';

class Application extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ApplicationState();
  }
}

class _ApplicationState extends State<Application> with WidgetsBindingObserver {
  RouteGenerator route;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    initRoute();
    initUsrInfo();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      onAppResumed();
    } else if (state == AppLifecycleState.paused) {
      onAppPaused();
    }
  }

  void onAppResumed() {

  }

  void onAppPaused() {

  }

  @override
  Widget build(BuildContext context) {
    return SkinManager().wrap(
      themeBuilder: (brightness) =>
          ThemeData(brightness: brightness),
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
            theme: theme,
            home: Pages.firstPage(context),
            onGenerateRoute: route.onGenerateRoute
        );
      },
    );
  }

  void initRoute() {
    route = RouteGenerator(
        routes: Pages.routes
    );
    route.addInterceptor(LoginInterceptor());
  }

  void initUsrInfo() {
    UsrInfoManager();
  }
}