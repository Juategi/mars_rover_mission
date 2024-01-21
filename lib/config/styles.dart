import 'package:flutter/material.dart';

class Styles {
  static const TextStyle title = TextStyle(
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
}
