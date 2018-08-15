import 'package:flutter/widgets.dart';

typedef Widget PageBuilder(BuildContext context, Map<String, String> params);

class RouteUtil {
  final Map<String, PageBuilder> routes;

  RouteUtil({this.routes});

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    String uri = settings.name;
    Map<String, dynamic> resolvedURI = _resolveURI(uri);
    String path = resolvedURI['path'];
    Map<String, String> params = resolvedURI['params'];
    PageBuilder builder = routes[path];
    if (builder != null) {
      return PageRouteBuilder(
        pageBuilder: (BuildContext context, _, __) {
          return builder(context, params);
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
      );
    }
    return null;
  }

  Map<String, dynamic> _resolveURI(String uri) {
    List<String> resoled = uri.split('?');
    String path = resoled[0];
    Map<String, String> params;
    if (resoled.length > 1) {
      params = Map();
      resoled[1].split('&').forEach((paramStr) {
        List<String> item = paramStr.split('=');
        params.putIfAbsent(Uri.decodeComponent(item[0]), () => Uri.decodeComponent(item[1]));
      });
    }
    return {
      'path': path,
      'params': params
    };
  }
}