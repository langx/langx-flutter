import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SwitchSvg extends StatelessWidget {
  final String fill;
  final int strokeWidth;
  final Color? color;
  final double widht;
  final double height;

  const SwitchSvg(
      {super.key,
      this.color,
      this.fill = "none",
      this.strokeWidth = 30,
      this.widht = 17,
      this.height = 17});

  String generateSwitchSvg(String fillColor, int strokeWidth, Color color) {
    final colorHex = '#${color.value.toRadixString(16).substring(2)}';
    return '''
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
      <circle cx="368" cy="256" r="128" stroke="$colorHex" stroke-width="$strokeWidth" fill="$fillColor"></circle>
      <rect x="16" y="128" width="480" height="256" rx="128" ry="128" stroke="$colorHex" stroke-width="$strokeWidth" fill="$fillColor"></rect>
      </svg>
    ''';
  }

  @override
  Widget build(BuildContext context) {
    final Color defaultColor = color ?? Colors.yellow[700]!;
    String infoSvg = generateSwitchSvg(fill, strokeWidth, defaultColor);
    return SvgPicture.string(
      infoSvg,
      width: widht,
      height: height,
    );
  }
}
