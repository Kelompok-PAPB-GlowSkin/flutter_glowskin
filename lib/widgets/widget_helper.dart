import 'package:flutter/material.dart';

class WidgetHelper {
  ButtonStyle btnCategoryStyle(bool changeColor) {
    return ButtonStyle(
      fixedSize: MaterialStateProperty.all(
        Size(87, 42),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      foregroundColor: MaterialStateProperty.all<Color>(
          changeColor ? Colors.white : Color(0xffD2EAC2)),
      backgroundColor: MaterialStateProperty.all<Color>(
          changeColor ? Color(0xffD2EAC2) : Colors.white),
      // side: MaterialStateProperty.all<BorderSide (color)>(changeColor? Colors.black : Colors.black)
    );
  }
}
