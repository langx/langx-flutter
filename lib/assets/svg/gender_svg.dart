import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GenderSvg extends StatelessWidget {
  final String fill;
  final int strokeWidth;
  final Color? color;
  final double widht;
  final double height;

  const GenderSvg(
      {super.key,
      this.color,
      this.fill = "none",
      this.strokeWidth = 30,
      this.widht = 17,
      this.height = 17});

  String generateGenderSvg(String fillColor, int strokeWidth, Color color) {
    final colorHex = '#${color.value.toRadixString(16).substring(2)}';
    return '''
      <svg xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 512 512">
      <circle cx="216" cy="200" r="136" stroke="$colorHex" stroke-width="$strokeWidth" fill="$fillColor" ></circle>
      <path  d="M216 352v128M272 416H160M432 112V32h-80M335.28 128.72L432 32" stroke="$colorHex" stroke-width="$strokeWidth" fill="$fillColor"></path>
      </svg>
    ''';
  }

  @override
  Widget build(BuildContext context) {
    final Color defaultColor = color ?? Colors.black;
    String infoSvg = generateGenderSvg(fill, strokeWidth, defaultColor);
    return SvgPicture.string(
      infoSvg,
      width: widht,
      height: height,
    );
  }
}
