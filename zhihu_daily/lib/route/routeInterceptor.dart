import 'routeModel.dart';

abstract class RouteInterceptor {
  bool intercept(RouteModel routeModel);
  RouteModel process(RouteModel routeModel);
}