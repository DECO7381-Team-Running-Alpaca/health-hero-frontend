import 'package:flutter/material.dart';

class ContinueAndCompleteButton extends StatelessWidget {
  final Function onTap;
  final String buttonTitle;

  ContinueAndCompleteButton({this.onTap, this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          height: 150,
          width: 410,
          child: Container(
            transform: Matrix4.translationValues(0, -15, 0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  buttonTitle.toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: 330,
                  height: 60,
                  decoration: BoxDecoration(border: Border.all(width: 1)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
