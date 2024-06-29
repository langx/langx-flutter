import 'package:flutter/material.dart';

//default ButtonFilled parameters
const Color inactiveColor = Color.fromARGB(221, 114, 113, 113);

Widget dButton({required onPress, String text = "", bool active = true}) {
  return Container(
    height: 60,
    decoration: BoxDecoration(
        color: const Color(0xFFFFC409),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFFC409).withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 11,
            offset: const Offset(0, 0),
          )
        ]),
    child: Center(
      child: GestureDetector(
        onTap: onPress,
        child: Text(
          text,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            letterSpacing: 0.0,
            color: Colors.black,
          ),
        ),
      ),
    ),
  );
}
