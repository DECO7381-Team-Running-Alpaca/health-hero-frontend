import 'package:flutter/material.dart';

class FoodBoxCard extends StatelessWidget {
  final String background;
  final Function onPress;
  final String title;

  FoodBoxCard({this.background, this.onPress, this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        // margin: EdgeInsets.all(20),
        width: 170,
        height: 170,
        margin: EdgeInsets.all(12),
        child: Center(
          child: Text(
            '$title'.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('$background'), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
