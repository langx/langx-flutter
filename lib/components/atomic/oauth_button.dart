import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OAuthButton extends StatelessWidget {
  final String assetPath;
  final VoidCallback onPressed;

  const OAuthButton({
    required this.assetPath,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Brightness platformBrightness = MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = platformBrightness == Brightness.dark;
    final bool isAppleIcon = assetPath.contains('apple_icon');

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xFF131314) : Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 1),
              color: Color(0x4C3C4043),
              blurRadius: 2,
            ),
            BoxShadow(
              color: Color(0x26283C40),
              offset: Offset(0, 1),
              blurRadius: 3,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Center(
          child: SvgPicture.asset(
            assetPath,
            width: 25,
            height: 25,
            colorFilter: isAppleIcon
                ? ColorFilter.mode(
                    isDarkMode ? Colors.white : Colors.black,
                    BlendMode.srcIn,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
