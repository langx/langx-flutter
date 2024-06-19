import 'package:flutter/material.dart';

class HeadAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTile;

  const HeadAppBar({
    super.key,
    required this.title,
    this.centerTile = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:Text( title,
          style:const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )),
      centerTitle: centerTile,
      backgroundColor: Colors.yellow[700],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
