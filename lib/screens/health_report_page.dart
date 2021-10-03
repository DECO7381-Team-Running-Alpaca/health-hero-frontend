import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_hero/models/meal.dart';
import 'package:health_hero/provider/record.dart';

class HealthReportPage extends StatefulWidget {
  static const routeName = '/report';
  @override
  _HealthReportPageState createState() => _HealthReportPageState();
}

class _HealthReportPageState extends State<HealthReportPage> {
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                              'Health Report',
                              style: TextStyle(
                                fontSize: 30,
                                color: Color.fromRGBO(100, 110, 91, 1),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 30, left: 15),
                  child: IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      sun12June.date + ' - ' + mon13June.date + ' 2021',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(103, 110, 94, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(top: 27, left: 35, right: 35),
                    height: 351,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                        color: Color.fromRGBO(112, 112, 112, 1),
                      ),
                      color: Colors.white,
                    ),
                  child: Column(
                    children: [
                      Container(
                        height: 55,
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Nutrient',
                                style: TextStyle(
                                  color: Color.fromRGBO(103, 110, 94, 1),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 1,
                              height: 55,
                              child: DecoratedBox(
                                decoration: BoxDecoration(color: Colors.grey.shade400),
                              ),
                            ),
                            Container(
                              width: 137,
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Food Sources',
                                style: TextStyle(
                                  color: Color.fromRGBO(103, 110, 94, 1),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 1,
                              height: 55,
                              child: DecoratedBox(
                                decoration: BoxDecoration(color: Colors.grey.shade400),
                              ),
                            ),
                            Container(
                              width: 100,
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Values',
                                style: TextStyle(
                                  color: Color.fromRGBO(103, 110, 94, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1,
                        width: 350,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Color.fromRGBO(112, 112, 112, 1)),
                        ),
                      ),
                      Container(
                        height: 90,
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Total fat',
                                style: TextStyle(
                                  color: Color.fromRGBO(103, 110, 94, 1),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 1,
                              height: 90,
                              child: DecoratedBox(
                                decoration: BoxDecoration(color: Colors.grey.shade400),
                              ),
                            ),
                            Container(
                              width: 137,
                              padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    foods[0].name,
                                    style: TextStyle(
                                      color: Color.fromRGBO(103, 110, 94, 1),
                                    ),
                                  ),
                                  Text(
                                    foods[1].name,
                                    style: TextStyle(
                                      color: Color.fromRGBO(103, 110, 94, 1),
                                    ),
                                  ),
                                  Text(
                                    foods[2].name,
                                    style: TextStyle(
                                      color: Color.fromRGBO(103, 110, 94, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 1,
                              height: 90,
                              child: DecoratedBox(
                                decoration: BoxDecoration(color: Colors.grey.shade400),
                              ),
                            ),
                            Container(
                              width: 100,
                              padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    foods[0].fat.toString() + 'mg',
                                    style: TextStyle(
                                      color: Color.fromRGBO(103, 110, 94, 1),
                                    ),
                                  ),
                                  Text(
                                    foods[1].fat.toString() + 'mg',
                                    style: TextStyle(
                                      color: Color.fromRGBO(103, 110, 94, 1),
                                    ),
                                  ),
                                  Text(
                                    foods[2].fat.toString() + 'mg',
                                    style: TextStyle(
                                      color: Color.fromRGBO(103, 110, 94, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1,
                        width: 350,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.grey.shade400),
                        ),
                      ),
                      Container(
                        height: 60,
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'Dietary fibre',
                                style: TextStyle(
                                  color: Color.fromRGBO(103, 110, 94, 1),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 1,
                              height: 60,
                              child: DecoratedBox(
                                decoration: BoxDecoration(color: Colors.grey.shade400),
                              ),
                            ),
                            Container(
                              width: 137,
                              padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    foods[3].name,
                                    style: TextStyle(
                                      color: Color.fromRGBO(103, 110, 94, 1),
                                    ),
                                  ),
                                  Text(
                                    foods[4].name,
                                    style: TextStyle(
                                      color: Color.fromRGBO(103, 110, 94, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 1,
                              height: 60,
                              child: DecoratedBox(
                                decoration: BoxDecoration(color: Colors.grey.shade400),
                              ),
                            ),
                            Container(
                              width: 100,
                              padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    foods[3].dietaryFibre.toString() + 'mg',
                                    style: TextStyle(
                                      color: Color.fromRGBO(103, 110, 94, 1),
                                    ),
                                  ),
                                  Text(
                                    foods[4].dietaryFibre.toString() + 'mg',
                                    style: TextStyle(
                                      color: Color.fromRGBO(103, 110, 94, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1,
                        width: 350,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.grey.shade400),
                        ),
                      ),
                      Container(
                        height: 90,
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Protein',
                                style: TextStyle(
                                  color: Color.fromRGBO(103, 110, 94, 1),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 1,
                              height: 90,
                              child: DecoratedBox(
                                decoration: BoxDecoration(color: Colors.grey.shade400),
                              ),
                            ),
                            Container(
                              width: 137,
                              padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    foods[5].name,
                                    style: TextStyle(
                                      color: Color.fromRGBO(103, 110, 94, 1),
                                    ),
                                  ),
                                  Text(
                                    foods[6].name,
                                    style: TextStyle(
                                      color: Color.fromRGBO(103, 110, 94, 1),
                                    ),
                                  ),
                                  Text(
                                    foods[7].name,
                                    style: TextStyle(
                                      color: Color.fromRGBO(103, 110, 94, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 1,
                              height: 90,
                              child: DecoratedBox(
                                decoration: BoxDecoration(color: Colors.grey.shade400),
                              ),
                            ),
                            Container(
                              width: 100,
                              padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    foods[5].protein.toString() + 'mg',
                                    style: TextStyle(
                                      color: Color.fromRGBO(103, 110, 94, 1),
                                    ),
                                  ),
                                  Text(
                                    foods[6].protein.toString() + 'mg',
                                    style: TextStyle(
                                      color: Color.fromRGBO(103, 110, 94, 1),
                                    ),
                                  ),
                                  Text(
                                    foods[7].protein.toString() + 'mg',
                                    style: TextStyle(
                                      color: Color.fromRGBO(103, 110, 94, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1,
                        width: 350,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.grey.shade400),
                        ),
                      ),
                      Container(
                        height: 50,
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'Carbohydrate',
                                style: TextStyle(
                                  color: Color.fromRGBO(103, 110, 94, 1),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 1,
                              height: 50,
                              child: DecoratedBox(
                                decoration: BoxDecoration(color: Colors.grey.shade400),
                              ),
                            ),
                            Container(
                              width: 137,
                              padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    foods[8].name,
                                    style: TextStyle(
                                      color: Color.fromRGBO(103, 110, 94, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 1,
                              height: 50,
                              child: DecoratedBox(
                                decoration: BoxDecoration(color: Colors.grey.shade400),
                              ),
                            ),
                            Container(
                              width: 100,
                              padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    foods[8].carbohydrate.toString() + 'mg',
                                    style: TextStyle(
                                      color: Color.fromRGBO(103, 110, 94, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Container(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.done,
                                  color: Color.fromRGBO(100, 110, 91, 1),
                                  size: 20,
                                ),
                              ),
                              content: Container(
                                width: 400,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                      Text(
                                        'The email has been sent successfully.',
                                        style: TextStyle(
                                          color: Color.fromRGBO(103, 110, 94, 1),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              actions: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .center,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(
                                              context)
                                              .pop();
                                        },
                                        child: const Text(
                                          'OK',
                                          style: TextStyle(
                                            color: Color
                                                .fromRGBO(
                                                100,
                                                109,
                                                93,
                                                1),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Color.fromRGBO(100, 110, 91, 1),
                            size: 20,
                          ),
                          Text(
                            'Send report to E-mail',
                            style: TextStyle(
                              color: Color.fromRGBO(100, 109, 93, 1),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


