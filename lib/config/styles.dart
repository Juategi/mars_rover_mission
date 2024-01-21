import 'package:flutter/material.dart';
import 'package:mars_rover_mission/config/config.dart';

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
    hintText: 'Number 0 - ${Config.planetSize - 1}',
    border: InputBorder.none,
    labelStyle: TextStyle(color: Colors.white),
    hintStyle: TextStyle(color: Colors.white),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
  );
}
