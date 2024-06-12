import 'package:flutter/material.dart';

//default ButtonFilled parameters
const Color inactiveColor = Color.fromARGB(221, 114, 113, 113);

Widget dButtonFilled({required onPressed, String text = "", bool active = true}) {
    return Container(
            height: 60,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 222, 171, 2),
                  Color(0xFFFFC409),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
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
              ]
            ),
            child: Center(
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  text,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontFamily: "Netflix",
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    letterSpacing: 0.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
}