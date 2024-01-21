import 'package:flutter/material.dart';

class MySnackBar {
  static void showSnackBar(BuildContext context, String message,
      {double heightOffset = 0.3}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      duration: const Duration(milliseconds: 2000),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * heightOffset,
        horizontal: MediaQuery.of(context).size.width * 0.2,
      ),
    ));
  }
}
