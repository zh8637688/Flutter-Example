import 'package:flutter/widgets.dart';

class CircleImage extends StatelessWidget {
  final ImageProvider image;

  CircleImage(this.image, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(image: image)
        )
    );
  }
}