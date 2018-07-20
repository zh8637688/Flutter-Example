import 'package:flutter/material.dart';
import 'package:zhihu_daily/model/theme.dart';

class ThemeFragment extends StatefulWidget {
  final ThemeModel theme;

  ThemeFragment(this.theme, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FragmentState();
  }
}

class _FragmentState extends State<ThemeFragment> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.theme.name);
  }
}