import 'package:flutter/material.dart';

class HeadAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTile;

  const HeadAppBar({
    Key? key,
    required this.title,
    this.centerTile = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: centerTile,
      backgroundColor: Colors.yellow[700],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
