import 'dart:math';

import 'package:flutter/material.dart';
import 'package:health_hero/screens/allergies_page.dart';
import 'package:health_hero/widgets/prefer_allergy_module/continue_and_complete_button.dart';
import 'package:health_hero/widgets/prefer_allergy_module/prefer_food_box.dart';

class PreferredPage extends StatefulWidget {
  static const routeName = '/prefer';

  @override
  _PreferredPageState createState() => _PreferredPageState();
}

List selectedPreferList = [];

class _PreferredPageState extends State<PreferredPage> {
  bool isCheckVisible;

  void chageState() {
    this.isCheckVisible = !isCheckVisible;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Main-2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                SafeArea(
                  //title
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 15,
                    ),
                    child: Text(
                      'Tell us the food you preferred',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.25),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 680,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 17, right: 17),
                              margin: EdgeInsets.only(
                                bottom: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.arrow_back,
                                      size: 25,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, AllergyPage.routeName);
                                    },
                                    child: Text(
                                      'Skip',
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 600,
                              child: Stack(
                                children: [
                                  Container(
                                    transform:
                                        Matrix4.translationValues(0, -55, 0),
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/preference-top.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    transform:
                                        Matrix4.translationValues(0, 420, 0),
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/preference-bottom.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Text(
                                          '---------------------MEAT---------------------',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            PreferFoodBoxCard(
                                              title: 'Beef',
                                              background:
                                                  'assets/images/beef.jpg',
                                            ),
                                            PreferFoodBoxCard(
                                              title: 'chicken',
                                              background:
                                                  'assets/images/chicken.jpg',
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            PreferFoodBoxCard(
                                              title: 'pork',
                                              background:
                                                  'assets/images/pork.jpg',
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '-------------------VEGGIES-------------------',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            PreferFoodBoxCard(
                                              title: 'mushiroom',
                                              background:
                                                  'assets/images/mushroom.jpg',
                                            ),
                                            PreferFoodBoxCard(
                                              title: 'tomato',
                                              background:
                                                  'assets/images/tomato.jpg',
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            PreferFoodBoxCard(
                                              title: 'brocroli',
                                              background:
                                                  'assets/images/brocroli.jpg',
                                            ),
                                            PreferFoodBoxCard(
                                              title: 'cucumber',
                                              background:
                                                  'assets/images/cucumber.jpg',
                                            ),
                                          ],
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
                      ContinueAndCompleteButton(
                        onTap: () {
                          Navigator.pushNamed(context, AllergyPage.routeName);
                          print(selectedPreferList);
                        },
                        buttonTitle: 'continue',
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
