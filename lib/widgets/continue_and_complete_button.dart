import 'package:flutter/material.dart';

class ContinueAndCompleteButton extends StatelessWidget {
  final Function onTap;
  final String buttonTitle;

  ContinueAndCompleteButton({this.onTap, this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        height: 60,
        width: 100,
        margin: EdgeInsets.only(
          top: 30,
          bottom: 30,
        ),
        child: Center(
          child: Text(
            buttonTitle.toUpperCase(),
            style: TextStyle(fontSize: 17),
          ),
        ),
      ),
    );
  }
}
