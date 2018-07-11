import 'package:flutter/material.dart';
import 'dart:math';

Color _color = const Color(0xffc2c5cc);

class AnimatedLogo extends StatefulWidget {
  final bool showAnimation;
  final AnimationStatusListener callback;

  AnimatedLogo({
    Key key,
    this.showAnimation = false,
    this.callback
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _LogoState();
  }
}

class _LogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);
    Animation curve = new CurvedAnimation(
        parent: controller, curve: Curves.easeOut);
    animation = new Tween(begin: 0.0, end: 0.75).animate(curve)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener(widget.callback);
  }


  @override
  void didUpdateWidget(AnimatedLogo oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.showAnimation) {
      controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(8.0),
      decoration: new BoxDecoration(
        border: new Border.all(color: _color),
        borderRadius: new BorderRadius.all(new Radius.circular(6.0)),
      ),
      child: new CustomPaint(painter: new _LogoPainter(animation)),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (controller != null) {
      controller.dispose();
    }
  }
}

class _LogoPainter extends CustomPainter {
  Animation<double> animation;

  _LogoPainter(this.animation);

  @override
  void paint(Canvas canvas, Size size) {
    if (animation != null) {
      Paint paint = new Paint()
        ..color = _color
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 4.5
        ..style = PaintingStyle.stroke;
      int max = (72 * animation.value).toInt();
      double r = size.width / 2;
      Path path = new Path();
      path.moveTo(size.width / 2, size.height);
      for (int i = 0; i < max; i++) {
        double radians = (0.5 + i / 36.0) * pi;
        path.lineTo(r * cos(radians) + r,
            r * sin(radians) + r);
      }
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_LogoPainter other) => true;
}