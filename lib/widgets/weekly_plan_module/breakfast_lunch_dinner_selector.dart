import 'package:flutter/material.dart';

class BreakfastLunchDinnerSelector extends StatelessWidget {
  String mealTime;
  Function function;
  BreakfastLunchDinnerSelector({this.mealTime,this.function});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      child: OutlinedButton(
        onPressed: function,
        child: Text(
          this.mealTime.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size(124, 35),
          backgroundColor: Color.fromRGBO(244, 244, 245, 1),
          onSurface: Color.fromRGBO(100, 110, 91, 1),
          side: BorderSide(
            color: Color.fromRGBO(100, 110, 91, 1),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
        ),
      ),
    );
  }
}
