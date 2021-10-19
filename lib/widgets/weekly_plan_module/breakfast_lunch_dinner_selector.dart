import 'package:flutter/material.dart';
import 'package:health_hero/widgets/weekly_plan_module/date_meal_widget.dart';

class BreakfastLunchDinnerSelector extends StatelessWidget {
  String mealTime;
  Function function;
  int buttonID;
  BreakfastLunchDinnerSelector({this.mealTime, this.function, this.buttonID});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      child: OutlinedButton(
        onPressed: function,
        child: Text(
          this.mealTime.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: this.buttonID == daySelector
                ? Colors.white
                : Color.fromRGBO(100, 110, 91, 1),
          ),
        ),
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size(124, 35),
          backgroundColor: this.buttonID == daySelector
              ? Color.fromRGBO(100, 110, 91, 1)
              : Color.fromRGBO(244, 244, 245, 1),
          // onSurface: Color.fromRGBO(100, 110, 91, 1),
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
