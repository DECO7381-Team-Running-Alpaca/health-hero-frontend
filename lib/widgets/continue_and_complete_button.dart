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
        color: Colors.teal,
        height: 50,
        width: 300,
        child: Center(
          child: Text(
            buttonTitle,
          ),
        ),
      ),
    );
  }
}
