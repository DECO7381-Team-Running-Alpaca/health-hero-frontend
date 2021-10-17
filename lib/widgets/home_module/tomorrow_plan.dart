import 'package:flutter/material.dart';

class TomorrowPlanBox extends StatefulWidget {
  final dynamic twoDayData;

  const TomorrowPlanBox({Key key, this.twoDayData}) : super(key: key);

  @override
  _TomorrowPlanBoxState createState() => _TomorrowPlanBoxState();
}

class _TomorrowPlanBoxState extends State<TomorrowPlanBox> {
  String _lengthChecker(String title, int limit) => title.length <= limit ? title : title.substring(0, limit) + ' ...';

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
                      'Tomorrow\'s plan',
                      style: TextStyle(
                          color: Color.fromRGBO(100, 110, 91, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                  ],
                ),
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
                            image: NetworkImage(widget.twoDayData['tomorrorBreakfast']['image']),
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
                                    _lengthChecker(widget.twoDayData['tomorrorBreakfast']['title'], 34),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 0),
                  child: Image(
                    image: AssetImage('assets/images/home-cutting.png'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 100,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image:
                                        NetworkImage(widget.twoDayData['tomorrowLunch']['image']),
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
                              _lengthChecker(widget.twoDayData['tomorrowLunch']['title'], 25),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 100,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image:
                                        NetworkImage(widget.twoDayData['tomorrowDinner']['image']),
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
                              _lengthChecker(widget.twoDayData['tomorrowDinner']['title'], 25),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          )
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
