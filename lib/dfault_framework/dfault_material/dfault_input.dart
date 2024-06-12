import 'package:flutter/material.dart';

dInput({required label}){
  return TextField(
    decoration: InputDecoration(
      label: Text(label),
      )
    );
}