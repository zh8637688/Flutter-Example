import 'package:flutter/material.dart';
import 'package:zhihu_daily/widgets/circleImage.dart';
import 'package:zhihu_daily/model/theme.dart';

typedef void ThemeChangedCallback(ThemeModel model);

class HomeDrawer extends StatelessWidget {
  final int activatedThemeId;
  final List<ThemeModel> themeList;
  final ThemeChangedCallback themeChangedCallback;

  HomeDrawer(this.activatedThemeId, this.themeList, this.themeChangedCallback,
      {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: Column(children: <Widget>[
        _buildHeader(context),
        _buildHomeItem(context),
        Expanded(
          child: new ListView(
            padding: EdgeInsets.only(),
            children: _buildDrawerList(context),
          ),
        ),
      ]),
    );
  }

  Widget _buildHeader(BuildContext context) {
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
    return new Row(
      children: <Widget>[
        new Container(
          width: 32.0, height: 32.0,
          margin: EdgeInsets.only(right: 14.0),
          child: new CircleImage(new AssetImage('res/images/avatar.png')),
        ),
        new Text('请登录', style: new TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ))
      ],
    );
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

  List<Widget> _buildDrawerList(BuildContext context) {
    return themeList.map((ThemeModel theme) {
      return _wrapPaddingAndTouch(
          _buildThemeItem(theme), activatedThemeId == theme.id, () {
        themeChangedCallback(theme);
        Navigator.pop(context);
      });
    }).toList(growable: false);
  }

  Widget _buildHomeItem(BuildContext context) {
    return _wrapPaddingAndTouch(
        Row(children: <Widget>[
          Icon(Icons.home, color: Colors.blue),
          Container(
            margin: EdgeInsets.only(left: 16.0),
            child: Text(
                '首页', style: TextStyle(color: Colors.blue, fontSize: 17.0)),
          ),
        ]),
        activatedThemeId == 0,
            () {
          themeChangedCallback(null);
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
}