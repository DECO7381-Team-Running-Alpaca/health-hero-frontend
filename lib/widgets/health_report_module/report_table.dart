import 'package:flutter/material.dart';

import '../../models/record.dart';

class ReportTable extends StatefulWidget {
  @override
  _ReportTableState createState() => _ReportTableState();
}

class _ReportTableState extends State<ReportTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              decoration:
                  BoxDecoration(color: Color.fromRGBO(112, 112, 112, 1)),
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
    );
  }
}
