import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void openWebView(BuildContext context, String url, {String title}) {
  Navigator.of(context).push(PageRouteBuilder(
    pageBuilder: (BuildContext context, _, __) {
      return WebviewScaffold(
        url: url,
        appBar: AppBar(
          title: Text(title),
        ),
        withZoom: true,
        withLocalStorage: true,
      );
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
    },
  ));
}