import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WordSvg extends StatelessWidget {
  final String fill;
  final int strokeWidth;
  final Color? color;
  final double widht;
  final double height;

  const WordSvg(
      {super.key,
      this.color,
      this.fill = "none",
      this.strokeWidth = 30,
      this.widht = 17,
      this.height = 17});

  String generateWordSvg(String fillColor, int strokeWidth, Color color) {
    final colorHex = '#${color.value.toRadixString(16).substring(2)}';
    return '''
      <svg xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 512 512">
      <path stroke="$colorHex" stroke-width="$strokeWidth" fill="$fillColor" d="M48 112h288M192 64v48M272 448l96-224 96 224M301.5 384h133M281.3 112S257 206 199 277 80 384 80 384" ></path>
      <path stroke="$colorHex" stroke-width="$strokeWidth" fill="$fillColor" d="M256 336s-35-27-72-75-56-85-56-85" ></path>
      </svg>
    ''';
  }

  @override
  Widget build(BuildContext context) {
    final Color defaultColor = color ?? Colors.yellow[700]!;
    String infoSvg = generateWordSvg(fill, strokeWidth, defaultColor);
    return SvgPicture.string(
      infoSvg,
      width: widht,
      height: height,
    );
  }
}
