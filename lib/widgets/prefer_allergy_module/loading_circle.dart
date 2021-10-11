import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                Container(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                    value: null,
                    strokeWidth: 7,
                    // color: Colors.red,
                    color: Color.fromRGBO(106, 183, 103, 100),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
