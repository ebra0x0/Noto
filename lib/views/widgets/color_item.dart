import 'package:flutter/material.dart';
import 'package:Noto/helper/lighten_color.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});

  final bool isActive;

  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 26,
            backgroundColor: lightenColor(color: color, lightRate: 0.5),
            child: CircleAvatar(
              radius: 24,
              backgroundColor: color,
              child: Icon(Icons.check),
            ),
          )
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: CircleAvatar(
              radius: 22,
              backgroundColor: color,
            ),
          );
  }
}
