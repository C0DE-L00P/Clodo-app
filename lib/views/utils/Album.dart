import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Album extends StatelessWidget {
  final String? title;
  final String? img;

  const Album({Key? key, required this.title, required this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          ClipPath(
            child: Container(color: Colors.amber),
            clipper: AlbumClipPath(),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Text(
              title!,
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}

class AlbumClipPath extends CustomClipper<Path> {
  var radius = 5.0;
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width * 0.0600000, size.height * 0.0980000);
    path0.quadraticBezierTo(size.width * 0.0050000, size.height * 0.1050000, 0,
        size.height * 0.1980000);
    path0.quadraticBezierTo(size.width * 0.0018750, size.height * 0.7260000,
        size.width * 0.0025000, size.height * 0.9020000);
    path0.quadraticBezierTo(size.width * 0.0061500, size.height * 0.9918400,
        size.width * 0.0620875, size.height * 0.9973400);
    path0.lineTo(size.width * 0.9400000, size.height * 0.9940000);
    path0.quadraticBezierTo(size.width * 1.0050000, size.height * 1.0040000,
        size.width * 0.9975000, size.height * 0.8940000);
    path0.cubicTo(
        size.width * 0.9971875,
        size.height * 0.6950000,
        size.width * 0.9965625,
        size.height * 0.2970000,
        size.width * 0.9962500,
        size.height * 0.0980000);
    path0.quadraticBezierTo(size.width * 0.9965625, size.height * 0.0250000,
        size.width * 0.9375000, size.height * 0.0060000);
    path0.quadraticBezierTo(size.width * 0.7031250, size.height * 0.0030000,
        size.width * 0.6250000, size.height * 0.0020000);
    path0.cubicTo(
        size.width * 0.5896875,
        size.height * 0.0260000,
        size.width * 0.6050000,
        size.height * 0.0740000,
        size.width * 0.5650000,
        size.height * 0.0980000);
    path0.cubicTo(
        size.width * 0.4387500,
        size.height * 0.0980000,
        size.width * 0.4387500,
        size.height * 0.0980000,
        size.width * 0.0600000,
        size.height * 0.0980000);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
