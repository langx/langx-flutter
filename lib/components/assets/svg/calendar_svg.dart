import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CalendarSvg extends StatelessWidget {
  final String fill;
  final int strokeWidth;
  final Color? color;
  final double widht;
  final double height;

  const CalendarSvg(
      {super.key,
      this.color,
      this.fill = "none",
      this.strokeWidth = 30,
      this.widht = 17,
      this.height = 17});

  String generateCalendarSvg(String fillColor, int strokeWidth, Color color) {
    final colorHex = '#${color.value.toRadixString(16).substring(2)}';
    return '''
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" >
      <rect x="48" y="80" width="416" height="384" rx="48" stroke="$colorHex" stroke-width="$strokeWidth" fill="$fillColor" ></rect>
      <path stroke="$colorHex" stroke-width="$strokeWidth" fill="$fillColor" d="M128 48v32M384 48v32M464 160H48M304 260l43.42-32H352v168M191.87 306.63c9.11 0 25.79-4.28 36.72-15.47a37.9 37.9 0 0011.13-27.26c0-26.12-22.59-39.9-47.89-39.9-21.4 0-33.52 11.61-37.85 18.93M149 374.16c4.88 8.27 19.71 25.84 43.88 25.84 28.59 0 52.12-15.94 52.12-43.82 0-12.62-3.66-24-11.58-32.07-12.36-12.64-31.25-17.48-41.55-17.48" ></path>
      </svg>
    ''';
  }

  @override
  Widget build(BuildContext context) {
    final Color defaultColor = color ?? Colors.black;
    String infoSvg = generateCalendarSvg(fill, strokeWidth, defaultColor);
    return SvgPicture.string(
      infoSvg,
      width: widht,
      height: height,
    );
  }
}
