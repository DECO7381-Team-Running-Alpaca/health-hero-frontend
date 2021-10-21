import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/meals.dart';
import '../provider/user.dart';
import '../widgets/prefer_allergy_module/allergy_food_box.dart';
import '../widgets/prefer_allergy_module/continue_and_complete_button.dart';
import '../widgets/prefer_allergy_module/loading_circle.dart';
import './home_screen.dart';
import './preferred_page.dart';

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
      await Provider.of<Meals>(context, listen: false)
          .generateBrandNewPlan()
          .then((_) {
        setState(() {
          _isLoading = false;
        });
        Navigator.pushNamed(context, HomeScreen.routeName);
      });
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
                'Are you sure to skip your food allergies selection? You can still edit it later.'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, HomeScreen.routeName);
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
                Container(
                  height: 90,
                  padding: EdgeInsets.only(
                    top: 60,
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
                          yesOrNoDialog();
                        },
                        child: Text(
                          'Skip',
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
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            AllergyFoodBoxCard(
                                              title: 'milk',
                                              chosen: selectedAllergyList
                                                  .contains('milk'),
                                              background:
                                                  'assets/images/milk.jpg',
                                            ),
                                            AllergyFoodBoxCard(
                                              title: 'mushroom',
                                              chosen: selectedAllergyList
                                                  .contains('mushroom'),
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
                                              chosen: selectedAllergyList
                                                  .contains('onion'),
                                              background:
                                                  'assets/images/onion.jpg',
                                            ),
                                            AllergyFoodBoxCard(
                                              title: 'sea food',
                                              chosen: selectedAllergyList
                                                  .contains('sea food'),
                                              background:
                                                  'assets/images/shrimp.jpg',
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            AllergyFoodBoxCard(
                                              title: 'beans',
                                              chosen: selectedAllergyList
                                                  .contains('beans'),
                                              background:
                                                  'assets/images/beans.jpg',
                                            ),
                                            AllergyFoodBoxCard(
                                              title: 'brocroli',
                                              chosen: selectedAllergyList
                                                  .contains('brocroli'),
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
                                              chosen: selectedAllergyList
                                                  .contains('carrot'),
                                              background:
                                                  'assets/images/carrot.jpg',
                                            ),
                                            AllergyFoodBoxCard(
                                              title: 'peanut',
                                              chosen: selectedAllergyList
                                                  .contains('peanut'),
                                              background:
                                                  'assets/images/peanut.png',
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
                          ? Positioned(
                              top: 650,
                              child: LoadingButton(),
                            )
                          : Positioned(
                              top: 650,
                              child: ContinueAndCompleteButton(
                                onTap: () {
                                  _submitPreAllLists();
                                },
                                buttonTitle: 'continue',
                              ),
                            ),
                    ],
                  ),
                ),
// ContinueAndCompleteButton(
                //               onTap: () {
                //                 _submitPreAllLists();
                //               },
                //               buttonTitle: 'complete',
                //             ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
