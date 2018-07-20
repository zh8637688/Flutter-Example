import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:zhihu_daily/widgets/homeDrawer.dart';
import 'package:zhihu_daily/model/theme.dart';
import 'package:zhihu_daily/constants/urls.dart';
import 'package:zhihu_daily/fragment/homeFragment.dart';
import 'package:zhihu_daily/fragment/themeFragment.dart';

class PageHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _PageState();
  }
}

class _PageState extends State<PageHome> {
  int activatedThemeId;
  ThemeModel activatedTheme;
  List<ThemeModel> themeList;

  @override
  void initState() {
    super.initState();
    setState(() {
      activatedThemeId = 0;
      themeList = [];
    });

    _loadThemeList();
  }

  @override
  Widget build(BuildContext context) {
    Widget body;
    if (activatedThemeId == 0) {
      body = HomeFragment();
    } else {
      body = ThemeFragment(activatedTheme);
    }
    return new Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildDrawer(),
      body: body,
    );
  }

  Widget _buildDrawer() {
    return new HomeDrawer(activatedThemeId, themeList, (ThemeModel theme) {
      if (theme == null) {
        setState(() {
          activatedThemeId = 0;
          activatedTheme = null;
        });
      } else {
        setState(() {
          activatedThemeId = theme.id;
          activatedTheme = theme;
        });
      }
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(icon: Icon(Icons.notifications), onPressed: _pressMsgBtn,),
        IconButton(icon: Icon(Icons.more_vert), onPressed: _pressMoreBtn,)
      ],
    );
  }

  _pressMsgBtn() {

  }

  _pressMoreBtn() {

  }

  _loadThemeList() async {
    Response response = await get(Urls.THEME_LIST);
    Map<String, dynamic> result = json.decode(response.body);
    if (result['others'] != null) {
      result['others'].forEach((item) {
        themeList.add(ThemeModel.fromJson(item));
      });
      setState(() {});
    }
  }
}