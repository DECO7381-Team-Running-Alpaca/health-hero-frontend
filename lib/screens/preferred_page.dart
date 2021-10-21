import 'package:flutter/material.dart';

import '../widgets/prefer_allergy_module/continue_and_complete_button.dart';
import '../widgets/prefer_allergy_module/prefer_food_box.dart';
import './allergies_page.dart';

class PreferredPage extends StatefulWidget {
  static const routeName = '/prefer';
  // PreferredPage() {
  //   selectedPreferList = [];
  // }
  @override
  _PreferredPageState createState() => _PreferredPageState();
}

List<String> selectedPreferList = [];

class _PreferredPageState extends State<PreferredPage> {
  bool isCheckVisible;

  void chageState() {
    this.isCheckVisible = !isCheckVisible;
  }

  yesOrNoDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Icon(Icons.warning),
            content: Text(
                'Are you sure to skip the food preference selection? You can still edit it later.'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AllergyPage.routeName);
                  },
                  // Navigator.pushNamed(context, AllergyPage.routeName),
                  child: Text('YES')),
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text('NO')),
            ],
          );
        });
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
                Container(
                  height: 90,
                  padding: EdgeInsets.only(
                    top: 60,
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
                Container(
                  padding: EdgeInsets.only(left: 17, right: 17, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: 25,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AllergyPage.routeName);

                          // Navigator.pushNamed(context, AllergyPage.routeName);
                        },
                        child: Text(
                          'Skip to Allergy',
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        height: 778,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(200, 216, 181, 1),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50)),
                              ),
                              padding: EdgeInsets.only(top: 20, bottom: 30),
                              height: 670,
                              child: Stack(
                                children: [
                                  SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Text(
                                          'Meat',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                        Image(
                                            image: AssetImage(
                                                'assets/images/preference dividing line.png')),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            PreferFoodBoxCard(
                                              title: 'beef',
                                              background:
                                                  'assets/images/beef.jpg',
                                              chosen: selectedPreferList
                                                  .contains('beef'),
                                            ),
                                            PreferFoodBoxCard(
                                              title: 'chicken',
                                              background:
                                                  'assets/images/chicken.jpg',
                                              chosen: selectedPreferList
                                                  .contains('chicken'),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'Veggies',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                        Image(
                                            image: AssetImage(
                                                'assets/images/preference dividing line.png')),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            PreferFoodBoxCard(
                                              title: 'mushroom',
                                              background:
                                                  'assets/images/mushroom.jpg',
                                              chosen: selectedPreferList
                                                  .contains('mushroom'),
                                            ),
                                            PreferFoodBoxCard(
                                              title: 'tomato',
                                              background:
                                                  'assets/images/tomato.jpg',
                                              chosen: selectedPreferList
                                                  .contains('tomato'),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            PreferFoodBoxCard(
                                              title: 'brocroli',
                                              chosen: selectedPreferList
                                                  .contains('brocroli'),
                                              background:
                                                  'assets/images/brocroli.jpg',
                                            ),
                                            PreferFoodBoxCard(
                                              title: 'cucumber',
                                              chosen: selectedPreferList
                                                  .contains('cucumber'),
                                              background:
                                                  'assets/images/cucumber.jpg',
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'Fruit',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                        Image(
                                            image: AssetImage(
                                                'assets/images/preference dividing line.png')),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            PreferFoodBoxCard(
                                              title: 'citrues',
                                              chosen: selectedPreferList
                                                  .contains('citrues'),
                                              background:
                                                  'assets/images/citrues.png',
                                            ),
                                            PreferFoodBoxCard(
                                              title: 'avocado',
                                              chosen: selectedPreferList
                                                  .contains('avocado'),
                                              background:
                                                  'assets/images/avocado.png',
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            PreferFoodBoxCard(
                                              title: 'blueberry',
                                              chosen: selectedPreferList
                                                  .contains('blueberry'),
                                              background:
                                                  'assets/images/blueberry.png',
                                            ),
                                            PreferFoodBoxCard(
                                              title: 'banana',
                                              chosen: selectedPreferList
                                                  .contains('banana'),
                                              background:
                                                  'assets/images/banana.png',
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'Dairy',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                        Image(
                                            image: AssetImage(
                                                'assets/images/preference dividing line.png')),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            PreferFoodBoxCard(
                                              title: 'yogurt',
                                              chosen: selectedPreferList
                                                  .contains('yogurt'),
                                              background:
                                                  'assets/images/yogurt.png',
                                            ),
                                            PreferFoodBoxCard(
                                              title: 'milk',
                                              chosen: selectedPreferList
                                                  .contains('milk'),
                                              background:
                                                  'assets/images/milk.jpg',
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'Grain',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                        Image(
                                            image: AssetImage(
                                                'assets/images/preference dividing line.png')),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            PreferFoodBoxCard(
                                              title: 'oat',
                                              chosen: selectedPreferList
                                                  .contains('oat'),
                                              background:
                                                  'assets/images/oat.png',
                                            ),
                                            PreferFoodBoxCard(
                                              title: 'rice',
                                              chosen: selectedPreferList
                                                  .contains('rice'),
                                              background:
                                                  'assets/images/rice.png',
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
                      Positioned(
                        top: 650,
                        child: ContinueAndCompleteButton(
                          onTap: () {
                            Navigator.pushNamed(context, AllergyPage.routeName);
                          },
                          buttonTitle: 'continue',
                        ),
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
