import 'package:flutter/material.dart';

//default ButtonFilled parameters
const Color inactiveColor = Color.fromARGB(221, 114, 113, 113);


Widget dButtonFilled({required onPressed, String text = "", bool active = true}){

  if (active == false) {
    return ElevatedButton(
      onPressed: onPressed, 
      child: Text(text), 
      style: ElevatedButton.styleFrom(backgroundColor: inactiveColor),
      );
  } else {
    return ElevatedButton(
      onPressed: onPressed, 
      child: Text(text), 
      );
  }
}