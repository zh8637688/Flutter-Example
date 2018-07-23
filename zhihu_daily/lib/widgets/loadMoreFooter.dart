import 'package:flutter/material.dart';

class LoadMoreFooter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FooterState();
  }
}

class _FooterState extends State<LoadMoreFooter> with TickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RotationTransition(
              turns: controller,
              child: Icon(Icons.loop, color: Colors.grey, size: 16.0),
            ),
            Text('  正在加载...', style: TextStyle(color: Colors.grey))
          ]),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}