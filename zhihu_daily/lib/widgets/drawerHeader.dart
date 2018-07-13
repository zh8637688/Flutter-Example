import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'circleImage.dart';

class UserDrawerHeader extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HeaderState();

}

class _HeaderState extends State<UserDrawerHeader> {
  @override
  Widget build(BuildContext context) {
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
            width: 32.0,
            height: 32.0,
            margin: EdgeInsets.only(right: 14.0),
            child: new CircleImage(
                new AssetImage('res/images/avatar.png'))
        ),
        new Text(
            '请登录',
            style: new TextStyle(
                fontSize: 16.0,
                color: Colors.white
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
    return _buildMenuItem('我的收藏', Icons.star);
  }

  Widget _buildItemDownload() {
    return _buildMenuItem('离线下载', Icons.file_download);
  }

  Widget _buildMenuItem(String text, IconData icon) {
    return Expanded(child: Container(
        padding: EdgeInsets.only(left: 8.0),
        child: Row(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(right: 20.0),
                child: Icon(icon, color: Colors.white, size: 17.0)
            ),
            Text(
                text,
                style: new TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
            )
          ],
        ))
    );
  }
}