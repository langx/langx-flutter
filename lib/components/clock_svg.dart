import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClockSvg extends StatelessWidget {
  final String fill;
  final int strokeWidth;
  final Color? color;
  final double widht;
  final double height;

  const ClockSvg(
      {super.key,
      this.color,
      this.fill = "none",
      this.strokeWidth = 30,
      this.widht = 17,
      this.height = 17});

  String generateClockSvg(String fillColor, int strokeWidth, Color color) {
    final colorHex = '#${color.value.toRadixString(16).substring(2)}';
    return '''
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
      <path d="M256 64C150 64 64 150 64 256s86 192 192 192 192-86 192-192S362 64 256 64z" stroke="$colorHex" stroke-width="$strokeWidth" fill="$fillColor"></path>
      <path  d="M256 128v144h96" stroke="$colorHex" stroke-width="$strokeWidth" fill="$fillColor"></path>
      </svg>
    ''';
  }

  @override
  Widget build(BuildContext context) {
    final Color defaultColor = color ?? Colors.black;
    String infoSvg = generateClockSvg(fill, strokeWidth, defaultColor);
    return SvgPicture.string(
      infoSvg,
      width: widht,
      height: height,
    );
  }
}
