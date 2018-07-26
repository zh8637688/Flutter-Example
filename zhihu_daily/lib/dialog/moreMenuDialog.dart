import 'package:flutter/material.dart';

class MoreMenuDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DialogState();
  }
}

class _DialogState extends State<MoreMenuDialog> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 180.0),
        child: Material(
          elevation: 24.0,
          child: SingleChildScrollView(child: _buildMenu()),
          type: MaterialType.card,),
      ),);
  }

  Widget _buildMenu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildMenuItem('夜间模式', () {}),
        _buildMenuItem('设置选项', () {})
      ],
    );
  }

  Widget _buildMenuItem(String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Text(title, style: TextStyle(fontSize: 17.0),),
      ),);
  }
}