import 'package:flutter/material.dart';
import 'package:health_hero/provider/auth.dart';
import 'package:health_hero/provider/user.dart';
import 'package:health_hero/screens/home_screen.dart';
import 'package:health_hero/screens/preferred_page.dart';
import 'package:health_hero/widgets/prefer_allergy_module/allergy_food_box.dart';
import 'package:health_hero/widgets/prefer_allergy_module/continue_and_complete_button.dart';
import 'package:provider/provider.dart';

class AllergyPage extends StatefulWidget {
  static const routeName = '/allergy';
  @override
  _AllergyPageState createState() => _AllergyPageState();
}

List<String> selectedAllergyList = [];

class _AllergyPageState extends State<AllergyPage> {
  bool _isLoading = false;

  void _submitPreAllLists() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await Provider.of<User>(context, listen: false)
          .addPrefs(selectedPreferList);
      await Provider.of<User>(context, listen: false)
          .addAllg(selectedAllergyList);
      setState(() {
        _isLoading = false;
      });
      print('Prefer:');
      print(selectedPreferList);
      print('Allergy:');
      print(selectedAllergyList);
      Navigator.pushNamed(context, HomeScreen.routeName);
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      throw error;
    }
  }

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
            content: Column(
              children: [
                TextField(
                  controller: addAllergy,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 70,
                ),
                Text('Allergy List'),
                Text(selectedAllergyList.toString()),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    selectedAllergyList.add(addAllergy.text);
                    addAllergy.clear();
                  },
                  child: Text('ADD')),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('CANCEL')),
              TextButton(
                  onPressed: () {
                    finishAllergy();
                  },
                  child: Text('FINISH')),
            ],
          );
        });
  }

  TextEditingController addAllergy = new TextEditingController();
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

                //         // bottom button
                //         ContinueAndCompleteButton(
                //           onTap: () => yesOrNoDialog(),
                //           buttonTitle: 'complete',
                //         )
                //       ],
                //     ),
                //   ),
                // )
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
                                      Navigator.pushNamed(
                                          context, HomeScreen.routeName);
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
                                        // Text(
                                        //   '---------------------MEAT---------------------',
                                        //   style: TextStyle(fontSize: 17),
                                        // ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            AllergyFoodBoxCard(
                                              title: 'milk',
                                              background:
                                                  'assets/images/milk.jpg',
                                            ),
                                            AllergyFoodBoxCard(
                                              title: 'mushiroom',
                                              background:
                                                  'assets/images/mushroom.jpg',
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            AllergyFoodBoxCard(
                                              title: 'onion',
                                              background:
                                                  'assets/images/onion.jpg',
                                            ),
                                            AllergyFoodBoxCard(
                                              title: 'shrimp',
                                              background:
                                                  'assets/images/shrimp.jpg',
                                            ),
                                          ],
                                        ),
                                        // Text(
                                        //   '-------------------VEGGIES-------------------',
                                        //   style: TextStyle(fontSize: 17),
                                        // ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            AllergyFoodBoxCard(
                                              title: 'beans',
                                              background:
                                                  'assets/images/beans.jpg',
                                            ),
                                            AllergyFoodBoxCard(
                                              title: 'brocroli',
                                              background:
                                                  'assets/images/brocroli.jpg',
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            AllergyFoodBoxCard(
                                              title: 'carrot',
                                              background:
                                                  'assets/images/carrot.jpg',
                                            ),
                                            AllergyFoodBoxCard(
                                              title: 'other',
                                              background:
                                                  'assets/images/brocroli.jpg',
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'Cannot find the food you’re allergic to？',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            customizeAllergy();
                                          },
                                          child: Text(
                                            'Add Manually',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
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
                      ),
                      _isLoading
                          ? Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                CircularProgressIndicator(
                                  value: null,
                                  strokeWidth: 7,
                                  color: Color.fromRGBO(205, 214, 169, 100),
                                ),
                                SizedBox(
                                  height: 53,
                                ),
                              ],
                            )
                          : ContinueAndCompleteButton(
                              onTap: () {
                                _submitPreAllLists();
                              },
                              buttonTitle: 'complete',
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
