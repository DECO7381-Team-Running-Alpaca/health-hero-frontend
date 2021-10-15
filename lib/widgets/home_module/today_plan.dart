import 'package:flutter/material.dart';

class TodayPlanBox extends StatefulWidget {
  bool checkClock = true;
  @override
  _TodayPlanBoxState createState() => _TodayPlanBoxState();
}

class _TodayPlanBoxState extends State<TodayPlanBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(13),
      width: 340,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Today\'s plan',
                      style: TextStyle(
                          color: Color.fromRGBO(100, 110, 91, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Dinner in 18:00',
                      style: TextStyle(
                        color: Color.fromRGBO(100, 110, 91, 1),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      transform: Matrix4.translationValues(0, 5, 0),
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Color.fromRGBO(228, 229, 210, 1),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          widget.checkClock = !widget.checkClock;
                        });
                      },
                      child: Text(
                        'Clock in - Dinner',
                        style: TextStyle(
                          color: Color.fromRGBO(100, 109, 93, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage('assets/images/main1.jpg'),
                            fit: BoxFit.cover,
                          )),
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: null,
                            child: Container(
                              transform: Matrix4.translationValues(0, 140, 0),
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.7)),
                              child: Row(
                                children: [
                                  Image(
                                    image: AssetImage('assets/icons/play.png'),
                                    width: 50,
                                    height: 30,
                                  ),
                                  Text(
                                    'Stir Fry Beef and Vegetables with Rice',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Offstage(
                      offstage: widget.checkClock,
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.5),
                        ),
                        child: Container(
                          width: 400,
                          child: Icon(
                            Icons.check_circle_outline,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: Image(
                    image: AssetImage('assets/images/home-cutting.png'),
                  ),
                ),
                Container(
                  // margin: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 130,
                            child: Text(
                              'Lunch',
                            ),
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 100,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/main2.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                height: 100,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.4)),
                              ),
                              Positioned(
                                top: 32,
                                left: 60,
                                child: Image(
                                  image: AssetImage('assets/icons/play.png'),
                                  height: 35,
                                  width: 35,
                                ),
                              )
                            ],
                          ),
                          Container(
                            width: 150,
                            child: Text(
                              'Balsamic Beef Salad',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            height: 17,
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.info,
                                      size: 10,
                                    ),
                                    Text(
                                      'Not yet clocked',
                                      style: TextStyle(
                                        fontSize: 8,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Clock in',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_right,
                                      size: 20,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 130,
                            child: Text(
                              'Breakfast',
                            ),
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 100,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/main3.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                height: 100,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.4)),
                              ),
                              Positioned(
                                top: 32,
                                left: 60,
                                child: Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              )
                            ],
                          ),
                          Container(
                            // width: 150,
                            child: Text(
                              'Fruity Yoghurt Breakfast Crunch',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
