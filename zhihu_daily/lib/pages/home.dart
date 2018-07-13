import 'package:flutter/material.dart';
import '../widgets/drawerHeader.dart';

class PageHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _PageState();
  }
}

class _PageState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildDrawer(),
      body: new Container(),
    );
  }

  Widget _buildDrawer() {
    return new Drawer(
      child: new ListView(
          padding: EdgeInsets.only(),
          children: <Widget>[
            new UserDrawerHeader(),
          ]
      ),
    );
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
}