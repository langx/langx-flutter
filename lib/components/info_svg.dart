import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoSvg extends StatelessWidget {
  final String fill;
  final int strokeWidth;
  final Color? color;
  final double widht;
  final double height;

  const InfoSvg({super.key, this.color, this.fill = "none", this.strokeWidth = 30, this.widht = 17, this.height = 17});

  String generateTrophySvg(String fillColor, int strokeWidth, Color color) {
    final colorHex = '#${color.value.toRadixString(16).substring(2)}';
    return '''
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
        <path d="M248 64C146.39 64 64 146.39 64 248s82.39 184 184 184 184-82.39 184-184S349.61 64 248 64z" stroke="$colorHex" stroke-width="$strokeWidth" fill="$fillColor"></path>
        <path d="M220 220h32v116" stroke="$colorHex" stroke-width="$strokeWidth" fill="$fillColor"></path>
        <path d="M208 340h88" stroke="$colorHex" stroke-width="$strokeWidth" fill="$fillColor"></path>
        <path d="M248 130a26 26 0 1026 26 26 26 0 00-26-26z" stroke="$colorHex" stroke-width="$strokeWidth" fill="$fillColor"></path>
      </svg>
    ''';
  }

  @override
  Widget build(BuildContext context) {
    final Color defaultColor = color ?? Colors.black;
    String infoSvg = generateTrophySvg(fill, strokeWidth, defaultColor);
    return SvgPicture.string(
      infoSvg,
      width: widht,
      height: height,
    );
  }
}
