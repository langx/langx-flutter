import 'package:flutter/material.dart';
import 'package:flutter_application_2/dfault_framework/dfault_material/dfault_colors.dart';

//default ButtonFilled parameters
const Color activeColor = primaryColor;
const Color inactiveColor = Color.fromARGB(221, 114, 113, 113);

//default ButtonOutlined parameters
const Color outlinedColor = primaryColor;


//default inkwell parameters


Widget dButtonFilled({required onPressed, String text = "", bool active = true}){

  final Color color;

  if (active == true) {
    color = activeColor;
  } else {
    color = inactiveColor;
  }

  return ElevatedButton(
    onPressed: onPressed, 
    child: Text(text), 
    style: ElevatedButton.styleFrom(backgroundColor: color),
    );

}


Widget dButtonOutlined({required onPressed, String text = ""}){
  return OutlinedButton(
    onPressed: onPressed, 
    child: Text(text),
    style: OutlinedButton.styleFrom(foregroundColor: outlinedColor),
    );
}