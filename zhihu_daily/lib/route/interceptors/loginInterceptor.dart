import 'package:zhihu_daily/route/routeInterceptor.dart';
import 'package:zhihu_daily/route/routeModel.dart';
import 'package:zhihu_daily/constants/pages.dart';
import 'package:zhihu_daily/manager/usrInfoManager.dart';

class LoginInterceptor extends RouteInterceptor {
  @override
  bool intercept(RouteModel routeModel) {
    if (routeModel.path == Pages.COLLECTION) {
      return !UsrInfoManager().hasLogin();
    }
    return false;
  }

  @override
  RouteModel process(RouteModel routeModel) {
    String params = '?nextPage=' + routeModel.uri;
    return RouteModel(Pages.LOGIN + params);
  }
}