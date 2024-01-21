import 'package:flutter/material.dart';

class Styles {
  static const TextStyle textStyle = TextStyle(
    color: Colors.white,
    fontSize: 32,
  );

  static const BoxDecoration background = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.deepOrange, Colors.orange, Colors.redAccent, Colors.red],
    ),
  );

  static const InputDecoration inputDecoration = InputDecoration(
    hintText: 'Enter a number between 0 and 199',
    border: InputBorder.none,
    labelStyle: TextStyle(color: Colors.white),
    hintStyle: TextStyle(color: Colors.white),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
  );
}
