import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HealthProfilePage extends StatefulWidget {
  @override
  _HealthProfilePageState createState() => _HealthProfilePageState();
}

class _HealthProfilePageState extends State<HealthProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/homeBackGround.jpg'),
              fit: BoxFit.cover,
              ),
          ),
          child: Center(
            child: Column(
              children: [
                SafeArea(
                  child: Container(
                    margin: EdgeInsets.only(left: 40, right: 40, top: 40),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Health Profile',
                              style: TextStyle(
                                fontSize: 30,
                                color: Color.fromRGBO(100, 110, 91, 1),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40, left: 35, right: 35, bottom: 40),
                  padding: EdgeInsets.all(15),
                  height: 590,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey.shade400,
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 90,
                        child: Row(),
                      ),
                      Divider(
                        color: Colors.grey.shade500,
                      ),
                    ],
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