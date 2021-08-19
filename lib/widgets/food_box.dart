import 'package:flutter/material.dart';

class FoodBoxCard extends StatelessWidget {
  final Image background;
  final Function onPress;
  final Text title;

  FoodBoxCard({this.background, this.onPress, this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Text('$title'),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('$background'),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
