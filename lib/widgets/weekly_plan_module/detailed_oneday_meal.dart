import 'package:flutter/material.dart';
import 'package:health_hero/provider/meals.dart';
import 'package:provider/provider.dart';

class DetailedOneDay extends StatefulWidget {
  final String day;
  DetailedOneDay({this.day});
  @override
  _DetailedOneDayState createState() => _DetailedOneDayState();
}

class _DetailedOneDayState extends State<DetailedOneDay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.day,
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(100, 110, 91, 1),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Total: ${int.parse(Provider.of<Meals>(context, listen: false).detailedPlan[widget.day][0].calories) + int.parse(Provider.of<Meals>(context, listen: false).detailedPlan[widget.day][1].calories) + int.parse(Provider.of<Meals>(context, listen: false).detailedPlan[widget.day][2].calories)}Kcal',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(100, 110, 91, 1),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // decoration: BoxDecoration(border: Border.all(width: 1)),
                      width: 250,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Breakfast: ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                                text:
                                    '${Provider.of<Meals>(context, listen: false).detailedPlan[widget.day][0].mealName}')
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                            '${Provider.of<Meals>(context, listen: false).detailedPlan[widget.day][0].calories} Kcal'),
                        Provider.of<Meals>(context, listen: false)
                                .clockInStatus[(widget.day).substring(0, 3)][0]
                            ? Icon(
                                Icons.check,
                                color: Colors.green,
                                size: 17,
                              )
                            : Icon(
                                Icons.close,
                                color: Colors.red,
                                size: 17,
                              ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // decoration: BoxDecoration(border: Border.all(width: 1)),
                      width: 250,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Lunch: ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                                text:
                                    '${Provider.of<Meals>(context, listen: false).detailedPlan[widget.day][1].mealName}')
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                            '${Provider.of<Meals>(context, listen: false).detailedPlan[widget.day][1].calories} Kcal'),
                        Provider.of<Meals>(context, listen: false)
                                .clockInStatus[(widget.day).substring(0, 3)][1]
                            ? Icon(
                                Icons.check,
                                color: Colors.green,
                                size: 17,
                              )
                            : Icon(
                                Icons.close,
                                color: Colors.red,
                                size: 17,
                              ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // decoration: BoxDecoration(border: Border.all(width: 1)),
                      width: 250,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Dinner: ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                                text:
                                    '${Provider.of<Meals>(context, listen: false).detailedPlan[widget.day][2].mealName}')
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                            '${Provider.of<Meals>(context, listen: false).detailedPlan[widget.day][2].calories} Kcal'),
                        Provider.of<Meals>(context, listen: false)
                                .clockInStatus[(widget.day).substring(0, 3)][2]
                            ? Icon(
                                Icons.check,
                                color: Colors.green,
                                size: 17,
                              )
                            : Icon(
                                Icons.close,
                                color: Colors.red,
                                size: 17,
                              ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Image(
            image: AssetImage('assets/images/preference dividing line.png'),
          )
        ],
      ),
    );
  }
}
