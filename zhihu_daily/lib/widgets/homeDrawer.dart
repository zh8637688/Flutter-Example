import 'package:flutter/material.dart';
import 'package:zhihu_daily/widgets/circleImage.dart';
import 'package:zhihu_daily/model/theme.dart';
import 'package:zhihu_daily/model/usrInfo.dart';
import 'package:zhihu_daily/constants/pages.dart';
import 'package:zhihu_daily/manager/usrInfoManager.dart';

typedef void ThemeChangedCallback(ThemeModel model);

class HomeDrawer extends StatefulWidget {
  final int activatedThemeId;
  final List<ThemeModel> themeList;
  final ThemeChangedCallback themeChangedCallback;

  HomeDrawer(this.activatedThemeId, this.themeList, this.themeChangedCallback,
      {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DrawerState();
  }
}

class _DrawerState extends State<HomeDrawer> {
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
    return new Drawer(
      child: Column(children: <Widget>[
        _buildHeader(),
        _buildHomeItem(),
        Expanded(
          child: new ListView(
            padding: EdgeInsets.only(),
            children: _buildDrawerList(),
          ),
        ),
      ]),
    );
  }

  Widget _buildHeader() {
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;
    final ThemeData theme = Theme.of(context);
    return Container(
      color: theme.primaryColor,
      padding: EdgeInsets.fromLTRB(16.0, 16.0 + statusBarHeight, 16.0, 16.0),
      child: new Column(
        children: <Widget>[
          _buildUserInfo(),
          _buildMenu()
        ],
      ),
    );
  }

  Widget _buildUserInfo() {
    ImageProvider avatar;
    String usrName;
    if (usrInfoManager.hasLogin()) {
      UsrInfo usrInfo = usrInfoManager.usrInfo;
      usrName = usrInfo.name;
      if (usrInfo.avatar != null && usrInfo.avatar.length > 0) {
        avatar = NetworkImage(usrInfo.avatar);
      } else {
        avatar = AssetImage('res/images/avatar.png');
      }
    } else {
      usrName = '请登录';
      avatar = AssetImage('res/images/avatar.png');
    }
    return GestureDetector(
      onTap: _onTapUsrInfo,
      child: new Row(
        children: <Widget>[
          new Container(
            width: 32.0, height: 32.0,
            margin: EdgeInsets.only(right: 14.0),
            child: new CircleImage(avatar),
          ),
          new Text(usrName, style: new TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ))
        ],
      ),);
  }

  Widget _buildMenu() {
    return new Container(
      margin: EdgeInsets.only(top: 30.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildItemCollect(),
          _buildItemDownload()
        ],
      ),
    );
  }

  Widget _buildItemCollect() {
    return _buildMenuItem('我的收藏', Icons.star, () {
      Navigator.pushNamed(context, Pages.COLLECTION);
    });
  }

  Widget _buildItemDownload() {
    return _buildMenuItem('离线下载', Icons.file_download, () {

    });
  }

  Widget _buildMenuItem(String text, IconData icon, GestureTapCallback onTap) {
    return Expanded(child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: 8.0),
        child: Row(children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: Icon(icon, color: Colors.white, size: 17.0),
          ),
          Text(text, style: new TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ))
        ]),
      ),
    ));
  }

  List<Widget> _buildDrawerList() {
    return widget.themeList.map((ThemeModel theme) {
      return _wrapPaddingAndTouch(
          _buildThemeItem(theme), widget.activatedThemeId == theme.id, () {
        widget.themeChangedCallback(theme);
        Navigator.pop(context);
      });
    }).toList(growable: false);
  }

  Widget _buildHomeItem() {
    return _wrapPaddingAndTouch(
        Row(children: <Widget>[
          Icon(Icons.home, color: Colors.blue),
          Container(
            margin: EdgeInsets.only(left: 16.0),
            child: Text(
                '首页', style: TextStyle(color: Colors.blue, fontSize: 17.0)),
          ),
        ]),
        widget.activatedThemeId == 0,
            () {
          widget.themeChangedCallback(null);
          Navigator.pop(context);
        }
    );
  }

  Widget _buildThemeItem(ThemeModel theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(theme.name, style: TextStyle(color: Colors.black, fontSize: 17.0)),
        Icon(Icons.add, color: Colors.grey, size: 22.0,),
      ],
    );
  }

  Widget _wrapPaddingAndTouch(Widget item, bool activated,
      GestureTapCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: item,
        color: activated ? Colors.grey[300] : null,
        padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
      ),
    );
  }

  void _onTapUsrInfo() {
    if (usrInfoManager.hasLogin()) {
      _showLogoutDialog();
    } else {
      Navigator.pushNamed(context, Pages.LOGIN);
    }
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('是否退出登录?', style: TextStyle(fontSize: 18.0)),
          actions: <Widget>[
            new FlatButton(
              child: new Text('取消'),
              textColor: Colors.grey,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text('退出'),
              onPressed: () {
                Navigator.of(context).pop();
                usrInfoManager.logout();
              },
            ),
          ],
        );
      },);
  }

  void onLoginStateChanged(LoginState state, UsrInfo usrInfo) {
    if (state == LoginState.logout) {
      setState(() {});
    }
  }
}