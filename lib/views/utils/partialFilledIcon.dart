import 'package:flutter/material.dart';

class PartialFilledIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;
  final double percent;

  PartialFilledIcon(
    this.icon,
    this.size,
    this.color,
    this.percent,
  );

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (Rect rect) {
        return LinearGradient(
          stops: [0, percent, percent],
          colors: [color, color, color.withOpacity(0)],
        ).createShader(rect);
      },
      child: SizedBox(
        width: size,
        height: size,
        child: Icon(icon, size: size, color: Colors.grey[300]),
      ),
    );
  }
}
