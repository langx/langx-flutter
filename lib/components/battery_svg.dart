import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BatterySvg extends StatelessWidget {
  final String fill;
  final int strokeWidth;
  final Color? color;
  final double widht;
  final double height;

  const BatterySvg(
      {super.key,
      this.color,
      this.fill = "none",
      this.strokeWidth = 30,
      this.widht = 17,
      this.height = 17});

  String generateBatterySvg(String fillColor, int strokeWidth, Color color) {
    final colorHex = '#${color.value.toRadixString(16).substring(2)}';
    return '''
      <svg xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 512 512">
      <rect x="32" y="144" width="400" height="224" rx="45.7" ry="45.7" stroke="$colorHex" stroke-width="$strokeWidth" fill="$fillColor"></rect>
      <rect x="85.69" y="198.93" width="154.31" height="114.13" rx="4" ry="4" stroke="$colorHex" stroke-width="$strokeWidth" fill="$fillColor"></rect>
      <path  d="M480 218.67v74.66" stroke="$colorHex" stroke-width="$strokeWidth" fill="$fillColor"></path>
      </svg>
    ''';
  }

  @override
  Widget build(BuildContext context) {
    final Color defaultColor = color ?? Colors.yellow[700]!;
    String infoSvg = generateBatterySvg(fill, strokeWidth, defaultColor);
    return SvgPicture.string(
      infoSvg,
      width: widht,
      height: height,
    );
  }
}
