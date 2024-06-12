import 'package:flutter/material.dart';

Widget dInput({
  required String label,
  TextEditingController? controller,
  bool obscureText = false,
}) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 193, 193, 193).withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 10,
          offset: const Offset(0, 0), // changes the position of the shadow
        ),
      ],
    ),
    child: TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        label: Text(label),
        fillColor: const Color.fromARGB(255, 234, 234, 234),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
