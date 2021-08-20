import 'package:flutter/material.dart';
import 'package:health_hero/widgets/continue_and_complete_button.dart';
import 'package:health_hero/widgets/food_box.dart';

class PreferredPage extends StatelessWidget {
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
                                  onPress: () {},
                                ),
                                FoodBoxCard(
                                  title: 'mushiroom',
                                  background: 'assets/images/beef.jpg',
                                  onPress: () {},
                                ),
                                FoodBoxCard(
                                  title: 'Beef',
                                  background: 'assets/images/beef.jpg',
                                  onPress: () {},
                                ),
                                FoodBoxCard(
                                  title: 'Beef',
                                  background: 'assets/images/beef.jpg',
                                  onPress: () {},
                                ),
                              ],
                            ),
                            //right row
                            Column(
                              children: [
                                FoodBoxCard(
                                  title: 'Beef',
                                  background: 'assets/images/beef.jpg',
                                  onPress: () {},
                                ),
                                FoodBoxCard(
                                  title: 'Beef',
                                  background: 'assets/images/beef.jpg',
                                  onPress: () {},
                                ),
                                FoodBoxCard(
                                  title: 'Beef',
                                  background: 'assets/images/beef.jpg',
                                  onPress: () {},
                                ),
                                FoodBoxCard(
                                  title: 'Beef',
                                  background: 'assets/images/beef.jpg',
                                  onPress: () {},
                                ),
                              ],
                            ),
                          ],
                        ),

                        // bottom button
                        ContinueAndCompleteButton(
                          //onTap: Navigator.pushNamed(context, 'allergyPage'),
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
