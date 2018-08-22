import 'package:flutter/material.dart';
import 'package:zhihu_daily/model/usrInfo.dart';
import 'package:zhihu_daily/manager/usrInfoManager.dart';

class PageLogin extends StatefulWidget {
  final String nextPage;

  PageLogin(this.nextPage);

  PageLogin.fromParams(Map<String, String> params)
      :this(params != null ? params['nextPage'] : null);

  @override
  State<StatefulWidget> createState() {
    return _PageState();
  }
}

class _PageState extends State<PageLogin> {
  UsrInfoManager usrInfoManager = UsrInfoManager();

  @override
  void initState() {
    super.initState();
    usrInfoManager.addLoginListener(onLoginStateChanged);
  }

  @override
  void dispose() {
    super.dispose();
    usrInfoManager.removeLoginListener(onLoginStateChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('登录')),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset('res/images/login.png', fit: BoxFit.fill),
          Container(
            alignment: Alignment.center,
            child: _buildLogoAndButton(),
          )
        ],
      ),
    );
  }

  Widget _buildLogoAndButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset('res/images/logo.png',
          width: 141.0,
          height: 51.0,),
        Container(
          margin: EdgeInsets.only(top: 50.0),
          child: _buildInkButton(
              Container(
                width: 230.0,
                height: 50.0,
                alignment: Alignment.center,
                child: new Text('登  录', style: TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.w500)),
              ), _onTapLoginBtn),
        )
      ],
    );
  }

  Widget _buildInkButton(Widget child, GestureTapCallback onTap) {
    return Material(
      borderRadius: new BorderRadius.all(new Radius.circular(6.0)),
      child: Ink(
        child: new InkWell(
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }

  _onTapLoginBtn() {
    UsrInfoManager().mockLogin();
  }

  onLoginStateChanged(LoginState state, UsrInfo usrInfo) {
    if (state == LoginState.login) {
      if (widget.nextPage != null) {
        Navigator.pushReplacementNamed(context, widget.nextPage);
      } else {
        Navigator.pop(context);
      }
    }
  }
}