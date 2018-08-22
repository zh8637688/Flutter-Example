import 'package:shared_preferences/shared_preferences.dart';
import 'package:zhihu_daily/model/usrInfo.dart';

const String _sp_key_usr_uid = 'usr_uid';
const String _sp_key_usr_name = 'usr_name';
const String _sp_key_usr_avatar = 'usr_avatar';

enum LoginState {
  login,
  logout
}

typedef void OnLoginStateChanged(LoginState state, UsrInfo usrInfo);

class UsrInfoManager {
  static UsrInfoManager _instance;

  List<OnLoginStateChanged> _loginListeners = [];

  UsrInfo usrInfo;

  UsrInfoManager._internal() {
    _loadFromLocal();
  }

  factory UsrInfoManager() {
    if (_instance == null) {
      _instance = UsrInfoManager._internal();
    }
    return _instance;
  }

  void addLoginListener(OnLoginStateChanged listener) {
    _loginListeners.add(listener);
  }

  void removeLoginListener(OnLoginStateChanged listener) {
    _loginListeners.remove(listener);
  }

  bool hasLogin() {
    return usrInfo != null;
  }

  void mockLogin() {
    usrInfo = UsrInfo(0, '测试用户', '');
    _dispatchLoginStateChanged(LoginState.login, usrInfo);
    _saveToLocal(usrInfo);
  }

  void logout() {
    usrInfo = null;
    _dispatchLoginStateChanged(LoginState.logout, null);
    _clearLocalInfo();
  }

  void _loadFromLocal() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    int uid = sp.getInt(_sp_key_usr_uid);
    String name = sp.getString(_sp_key_usr_name);
    String avatar = sp.getString(_sp_key_usr_avatar);
    if (uid != null) {
      usrInfo = UsrInfo(uid, name, avatar);
      _dispatchLoginStateChanged(LoginState.login, usrInfo);
    }
  }

  void _saveToLocal(UsrInfo usrInfo) async {
    if (usrInfo != null) {
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setInt(_sp_key_usr_uid, usrInfo.uid);
      sp.setString(_sp_key_usr_name, usrInfo.name);
      sp.setString(_sp_key_usr_avatar, usrInfo.avatar);
    }
  }

  void _clearLocalInfo() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove(_sp_key_usr_uid);
    sp.remove(_sp_key_usr_name);
    sp.remove(_sp_key_usr_avatar);
  }

  void _dispatchLoginStateChanged(LoginState state, UsrInfo usrInfo) {
    _loginListeners.forEach((listener) {
      listener(state, usrInfo);
    });
  }
}