import 'package:flutter/material.dart';
import 'package:mars_rover_mission/config/styles.dart';

class SelectorButton extends StatelessWidget {
  SelectorButton({
    super.key,
    required this.onPressed,
    required this.cardinalPoint,
    this.selectedPoint = "",
  });
  final String selectedPoint;
  final String cardinalPoint;
  final Function() onPressed;
  final BoxDecoration notSelected = BoxDecoration(
    border: Border.all(
      color: Colors.white,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(15),
  );
  final BoxDecoration selected = BoxDecoration(
    color: Colors.white,
    border: Border.all(
      color: Colors.white,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(15),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: selectedPoint == cardinalPoint ? selected : notSelected,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          cardinalPoint,
          style: selectedPoint == cardinalPoint
              ? Styles.textStyle.copyWith(color: Colors.deepOrange)
              : Styles.textStyle,
        ),
      ),
    );
  }
}
