import 'package:flutter/material.dart';
import 'package:health_hero/widgets/prefer_allergy_module/allergy_food_box.dart';
import 'package:health_hero/widgets/prefer_allergy_module/continue_and_complete_button.dart';

class AllergyPage extends StatefulWidget {
  static const routeName = '/allergy';
  @override
  _AllergyPageState createState() => _AllergyPageState();
}
List selectedAllergyList = [];

class _AllergyPageState extends State<AllergyPage> {
  yesOrNoDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Icon(Icons.warning),
            content: Text(
                'I make sure that I have selected ALL FOOD ALLERGIES I have.'),
            actions: [
              TextButton(
                  onPressed: () {
                    finishAllergy();
                  },
                  child: Text('YES')),
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text('NO')),
            ],
          );
        });
  }

  finishAllergy() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Icon(Icons.check),
            content: Text(
                'Your allergic ingredient has been successfully documented.'),
            actions: [
              TextButton(
                  onPressed: () {
                    customizeAllergy();
                  },
                  child: Text('ADD MORE')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text('FINISH')),
            ],
          );
        });
  }

  customizeAllergy() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Enter the ingredient you are allergic to'),
            content: TextField(
              keyboardType: TextInputType.emailAddress,
            ),
            actions: [
              TextButton(onPressed: () {}, child: Text('ADD')),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('CANCEL')),
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
                SafeArea(
                  //title
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 15,
                    ),
                    child: Text(
                      'Tell us your food allergies',
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
                                AllergyFoodBoxCard(
                                  title: 'milk',
                                  background: 'assets/images/milk.jpg',
                                ),
                                AllergyFoodBoxCard(
                                  title: 'mushiroom',
                                  background: 'assets/images/mushroom.jpg',
                                ),
                                AllergyFoodBoxCard(
                                  title: 'onion',
                                  background: 'assets/images/onion.jpg',
                                ),
                                AllergyFoodBoxCard(
                                  title: 'shrimp',
                                  background: 'assets/images/shrimp.jpg',
                                ),
                              ],
                            ),
                            //right row
                            Column(
                              children: [
                                AllergyFoodBoxCard(
                                  title: 'beans',
                                  background: 'assets/images/beans.jpg',
                                ),
                                AllergyFoodBoxCard(
                                  title: 'brocroli',
                                  background: 'assets/images/brocroli.jpg',
                                ),
                                AllergyFoodBoxCard(
                                  title: 'carrot',
                                  background: 'assets/images/carrot.jpg',
                                ),
                                AllergyFoodBoxCard(
                                  title: 'other',
                                  background: 'assets/images/brocroli.jpg',
                                ),
                              ],
                            ),
                          ],
                        ),

                        // bottom button
                        ContinueAndCompleteButton(
                          onTap: () => yesOrNoDialog(),
                          buttonTitle: 'complete',
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
