import 'package:flutter/material.dart';
import 'drawerHeader.dart';
import 'package:zhihu_daily/model/theme.dart';

class HomeDrawer extends StatelessWidget {
  final int activatedThemeId;
  final List<ThemeModel> themeList;
  final ThemeChangedCallback themeChangedCallback;

  HomeDrawer(this.activatedThemeId, this.themeList, this.themeChangedCallback);

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: Column(children: <Widget>[
        new UserDrawerHeader(),
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
        Row(
          children: <Widget>[
            Icon(Icons.home, color: Colors.blue),
            Container(
              margin: EdgeInsets.only(left: 16.0),
              child: Text(
                  '首页', style: TextStyle(color: Colors.blue, fontSize: 17.0)),
            ),
          ],
        ),
        activatedThemeId == 0, () {
      themeChangedCallback(null);
      Navigator.pop(context);
    });
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

typedef void ThemeChangedCallback(ThemeModel model);