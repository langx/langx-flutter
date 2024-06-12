import 'package:flutter/material.dart';

dInput({required label}){
  return Container(
    decoration: BoxDecoration(
      boxShadow:[ BoxShadow(
        color: Color.fromARGB(255, 193, 193, 193).withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 10,
        offset: Offset(0, 0), // cambios en la posición de la sombra
      ),
    ],
    ),
    child: TextField(
    decoration: InputDecoration(
      label: Text(label),
      fillColor: Color.fromARGB(255, 234, 234, 234),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.white
          ),
        )
      )
    ),
  );
}