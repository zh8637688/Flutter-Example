import 'package:flutter/widgets.dart';
import 'package:zhihu_daily/route/routeInterceptor.dart';
import 'package:zhihu_daily/route/routeModel.dart';

typedef Widget PageBuilder(BuildContext context, Map<String, String> params);

class RouteGenerator {
  final Map<String, PageBuilder> routes;
  List<RouteInterceptor> interceptors;

  RouteGenerator({this.routes});

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    String uri = settings.name;
    RouteModel routeModel = RouteModel(uri);

    if (interceptors != null) {
      for(RouteInterceptor interceptor in interceptors) {
        if(interceptor.intercept(routeModel)) {
          routeModel = interceptor.process(routeModel);
          break;
        }
      }
    }
    PageBuilder builder = routes[routeModel.path];
    if (builder != null) {
      return _genSlideTransitionPageRoute(builder, routeModel.params);
    }
    return null;
  }

  void addInterceptor(RouteInterceptor interceptor) {
    if (interceptors == null) {
      interceptors = [];
    }

    if (interceptor != null) {
      interceptors.add(interceptor);
    }
  }

  void removeInterceptor(RouteInterceptor interceptor) {
    if (interceptors != null) {
      interceptors.remove(interceptor);
    }
  }

  PageRouteBuilder _genSlideTransitionPageRoute(PageBuilder builder,
      Map<String, String> params) {
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
}