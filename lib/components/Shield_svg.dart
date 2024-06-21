import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShieldSvg extends StatelessWidget {
  final String fill;
  final int strokeWidth;
  final Color? color;
  final double widht;
  final double height;

  const ShieldSvg(
      {super.key,
      this.color,
      this.fill = "none",
      this.strokeWidth = 30,
      this.widht = 17,
      this.height = 17});

  String generateShieldSvg(String fillColor, int strokeWidth, Color color) {
    final colorHex = '#${color.value.toRadixString(16).substring(2)}';
    return '''
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
      <path stroke="$colorHex" stroke-width="$strokeWidth" fill="$fillColor"  d="M336 176L225.2 304 176 255.8" ></path>
      <path stroke="$colorHex" stroke-width="$strokeWidth" fill="$fillColor" d="M463.1 112.37C373.68 96.33 336.71 84.45 256 48c-80.71 36.45-117.68 48.33-207.1 64.37C32.7 369.13 240.58 457.79 256 464c15.42-6.21 223.3-94.87 207.1-351.63z" ></path>
      </svg>
    ''';
  }

  @override
  Widget build(BuildContext context) {
    final Color defaultColor = color ?? Colors.black;
    String infoSvg = generateShieldSvg(fill, strokeWidth, defaultColor);
    return SvgPicture.string(
      infoSvg,
      width: widht,
      height: height,
    );
  }
}
