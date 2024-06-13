import 'package:flutter/material.dart';

dInput({required label, TextEditingController? controller, bool obscureText = false}){
  return TextField(
    controller: controller,
    obscureText: obscureText,
    decoration: InputDecoration(
      label: Text(label),
      )
    );
}