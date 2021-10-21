import 'dart:math';

import 'package:flutter/material.dart';

class ScanMealScrenn extends StatefulWidget {
  static const routeName = '/scan';

  @override
  _ScanMealScrennState createState() => _ScanMealScrennState();
}

class _ScanMealScrennState extends State<ScanMealScrenn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background-75%.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin:
                  EdgeInsets.only(left: 40, right: 40, top: 100, bottom: 40),
              width: 500,
              child: Text(
                'Scan your meal',
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromRGBO(100, 110, 91, 1),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 450,
                      width: 400,
                      child: Card(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 250,
                      width: 400,
                      child: Card(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Transform.rotate(
                  angle: pi / 32,
                  child: Container(
                    margin: EdgeInsets.only(left: 155, top: 390),
                    child: Image(
                        width: 119,
                        height: 119,
                        image: AssetImage('assets/icons/scratch.png'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
