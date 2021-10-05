import 'package:flutter/material.dart';
import 'package:health_hero/screens/allergies_page.dart';
import 'package:health_hero/widgets/prefer_allergy_module/continue_and_complete_button.dart';
import 'package:health_hero/widgets/prefer_allergy_module/food_box.dart';

class PreferredPage extends StatefulWidget {
  static const routeName = '/prefer';
  @override
  _PreferredPageState createState() => _PreferredPageState();
}

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
                Expanded(
                  //main part
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.25),
                    ),
                    child: ListView(
                      children: [
                        //food box area
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //left row
                            Column(
                              children: [
                                FoodBoxCard(
                                  title: 'Beef',
                                  background: 'assets/images/beef.jpg',
                                ),
                                FoodBoxCard(
                                  title: 'mushiroom',
                                  background: 'assets/images/mushroom.jpg',
                                ),
                                FoodBoxCard(
                                  title: 'tomato',
                                  background: 'assets/images/tomato.jpg',
                                ),
                                FoodBoxCard(
                                  title: 'pork',
                                  background: 'assets/images/pork.jpg',
                                ),
                              ],
                            ),
                            //right row
                            Column(
                              children: [
                                FoodBoxCard(
                                  title: 'chicken',
                                  background: 'assets/images/chicken.jpg',
                                ),
                                FoodBoxCard(
                                  title: 'brocroli',
                                  background: 'assets/images/brocroli.jpg',
                                ),
                                FoodBoxCard(
                                  title: 'cucumber',
                                  background: 'assets/images/cucumber.jpg',
                                ),
                                FoodBoxCard(
                                  title: 'egg',
                                  background: 'assets/images/egg.jpg',
                                ),
                              ],
                            ),
                          ],
                        ),

                        // bottom button
                        ContinueAndCompleteButton(
                          onTap: () => Navigator.pushNamed(
                              context, AllergyPage.routeName),
                          buttonTitle: 'continue',
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
