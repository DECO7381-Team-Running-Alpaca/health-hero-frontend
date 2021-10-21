import 'dart:math';

import 'package:flutter/material.dart';
import 'package:health_hero/constants/segment_label.dart';

class ScanMealScrenn extends StatefulWidget {
  static const routeName = '/scan';

  @override
  _ScanMealScrennState createState() => _ScanMealScrennState();
}

class _ScanMealScrennState extends State<ScanMealScrenn> {
  Map<dynamic, dynamic> _results = {
    'Starches/grains | rice/grains/cereals': 99.99,
    'Starches/grains | Starchy Vegetables': 88.88,
    'Starches/grains | Baked Goods': 77.77,
    'Starches/grains | Noodles/pasta': 66.66,
    'Protein | Poultry': 55.55,
  };

  Map<dynamic, dynamic> _surfaceResults = {
    'Background': 77.77,
    'Food Containers': 66.66,
    'Dining Tools': 55.55,
  };

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
          children: [
            Container(
              margin:
                  EdgeInsets.only(left: 40, right: 40, top: 100, bottom: 20),
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
                        shadowColor: Colors.grey,
                        child: Column(
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        print('hello');
                                      },
                                      child: Text('Check original image')),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    height: 300,
                                    width: 300,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Image.asset(
                                          'assets/images/banana.png'),
                                      // Image.memory(
                                      //   Uint8List.fromList(_rawImageData),
                                      //   fit: BoxFit.fill,
                                      // ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                selectImageButton(
                                    'Take A Photo', 'camera', false),
                                SizedBox(
                                  width: 10,
                                ),
                                selectImageButton(
                                    'Choose from Gallery', 'gallery', true)
                              ],
                            ),
                          ],
                        ),
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
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              segmentTitle('Main Component: '),
                              for (var i in _results.keys.toList())
                                segmentItem(i, _results),
                              segmentTitle('Other (Surface): '),
                              for (var j in _surfaceResults.keys.toList())
                                segmentItem(j, _surfaceResults),
                            ],
                          ),
                        ),
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

Widget selectImageButton(String descip, String type, bool isGallery) =>
    GestureDetector(
      onTap: () {},
      child: Container(
        width: isGallery ? 200 : 150,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 11),
        decoration: BoxDecoration(
            color: Colors.blueGrey[600],
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          descip,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );

Widget segmentItem(String label, Map results) => Container(
      margin: EdgeInsets.only(left: 10, bottom: 5),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(pascalVOCLabelColors[foodClasses.indexOf(label)]),
      ),
      child: Text(
        '$label: ${results[label]}',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );

Widget segmentTitle(String title) => Container(
      margin: EdgeInsets.only(left: 10, top: 10, bottom: 5),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.black54, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
