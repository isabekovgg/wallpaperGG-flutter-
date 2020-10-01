import 'package:flutter/material.dart';

Widget brandName(){
  return RichText(
  text: TextSpan( 
    style: TextStyle(fontSize:19,fontWeight: FontWeight.w500),
    children: <TextSpan>[
      TextSpan(text: 'Wallpaper', style: TextStyle(color: Colors.black87)),
      TextSpan(text: 'GG', style: TextStyle(color: Colors.blue)),
    ],
  ),
);
}