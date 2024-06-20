import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TrophySvg extends StatelessWidget {
  final String fill;
  final int strokeWidth;
  final Color? color;
  final double widht;
  final double height;

  const TrophySvg({super.key, this.color, this.fill = "none", this.strokeWidth = 20, this.widht = 20, this.height = 30});

  String generateTrophySvg(String fillColor, int strokeWidth, Color color) {
    final colorHex = '#${color.value.toRadixString(16).substring(2)}';
    return '''
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
        <path d="M176 464h160M256 464V336M384 224c0-50.64-.08-134.63-.12-160a16 16 0 00-16-16l-223.79.26a16 16 0 00-16 15.95c0 30.58-.13 129.17-.13 159.79 0 64.28 83 112 128 112S384 288.28 384 224z" stroke="$colorHex" stroke-width="$strokeWidth" fill="$fillColor"></path>
        <path d="M128 96H48v16c0 55.22 33.55 112 80 112M384 96h80v16c0 55.22-33.55 112-80 112" stroke="$colorHex" stroke-width="$strokeWidth" fill="$fillColor"></path>
      </svg>
    ''';
  }

  @override
  Widget build(BuildContext context) {
    final Color defaultColor = color ?? Colors.yellow[700]!;
    String trophySvg = generateTrophySvg(fill, strokeWidth, defaultColor);
    return SvgPicture.string(
      trophySvg,
      width: widht,
      height: height,
    );
  }
}
