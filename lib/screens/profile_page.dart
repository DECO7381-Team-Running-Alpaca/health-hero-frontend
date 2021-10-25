import 'package:flutter/material.dart';
import 'package:health_hero/provider/auth.dart';
import 'package:health_hero/screens/landing_screen.dart';
import 'package:provider/provider.dart';

import '../widgets/user_profile_module/update_allergies_dialog.dart';
import '../widgets/user_profile_module/update_preferences_dialog.dart';
import '../widgets/user_profile_module/update_email_dialog.dart';
import '../widgets/user_profile_module/update_height_dialog.dart';
import '../widgets/user_profile_module/update_weight_dialog.dart';
import '../widgets/user_profile_module/update_password_dialog.dart';
import '../provider/user.dart';
import './allergies_page.dart';
import './preferred_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var _isLoading = false;
  var _isInit = true;

  final emailController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<User>(context).getUserProfile().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void _passwordUpdateDialog() {
    showDialog(context: context, builder: (context) => UpdatePasswordDialog());
  }

  void _emailUpdateDialog() {
    showDialog(context: context, builder: (context) => UpdateEmailDialog());
  }

  void _heightUpdateDialog() {
    showDialog(context: context, builder: (context) => UpdateHeightDialog());
  }

  void _weightUpdateDialog() {
    showDialog(context: context, builder: (context) => UpdateWeightDialog());
  }

  void _preferenceDialog() {
    showDialog(context: context, builder: (context) => FoodPreferencesDialog());
  }

  void _allergiesDialog() {
    showDialog(context: context, builder: (context) => FoodAllergiesDialog());
  }

  void _getPre() async {
    try {
      await Provider.of<User>(context, listen: false).getPrefs();
      selectedPreferList =
          Provider.of<User>(context, listen: false).preferences;

      Navigator.pushNamed(context, PreferredPage.routeName);
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      throw error;
    }
  }

  void _getAll() async {
    try {
      await Provider.of<User>(context, listen: false).getAllg();
      selectedAllergyList = Provider.of<User>(context, listen: false).allergies;

      Navigator.pushNamed(context, AllergyPage.routeName);
    } catch (error) {
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(
      builder: (ctx, userData, _) => Container(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SafeArea(
                  child: Container(
                    margin: EdgeInsets.only(left: 40, right: 40, top: 40),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Account Settings',
                              style: TextStyle(
                                fontSize: 30,
                                color: Color.fromRGBO(100, 110, 91, 1),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                _isLoading
                    ? Container(
                        margin: const EdgeInsets.only(bottom: 20.0),
                        child: CircularProgressIndicator(
                          value: null,
                          color: Color.fromRGBO(205, 214, 169, 100),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.only(
                            top: 60, left: 35, right: 35, bottom: 25),
                        padding: EdgeInsets.only(
                            top: 15, left: 10, right: 10, bottom: 15),
                        height: 328,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 20, top: 5),
                              height: 46,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'User Name',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromRGBO(100, 110, 91, 1),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    userData.userName,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromRGBO(100, 110, 91, 1),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.grey.shade400,
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 20, right: 15, top: 5),
                              height: 46,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Password',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                Color.fromRGBO(100, 110, 91, 1),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '**********',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                Color.fromRGBO(100, 110, 91, 1),
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    padding:
                                        EdgeInsets.only(left: 20, bottom: 20),
                                    icon: Icon(Icons.create),
                                    color: Color.fromRGBO(100, 110, 91, 1),
                                    iconSize: 20,
                                    onPressed: _passwordUpdateDialog,
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.grey.shade400,
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 20, right: 15, top: 5),
                              height: 46,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Email',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                Color.fromRGBO(100, 110, 91, 1),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          userData.extraDetail['email'],
                                          style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                Color.fromRGBO(100, 110, 91, 1),
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    padding:
                                        EdgeInsets.only(left: 20, bottom: 20),
                                    icon: Icon(Icons.create),
                                    color: Color.fromRGBO(100, 110, 91, 1),
                                    iconSize: 20,
                                    onPressed: _emailUpdateDialog,
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.grey.shade400,
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 20, right: 15, top: 5),
                              height: 46,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Height',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                Color.fromRGBO(100, 110, 91, 1),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          userData.extraDetail['height'] +
                                              '   cm',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                Color.fromRGBO(100, 110, 91, 1),
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    padding:
                                        EdgeInsets.only(left: 20, bottom: 20),
                                    icon: Icon(Icons.create),
                                    color: Color.fromRGBO(100, 110, 91, 1),
                                    iconSize: 20,
                                    onPressed: _heightUpdateDialog,
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.grey.shade400,
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 20, right: 15, top: 5),
                              height: 46,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Weight',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                Color.fromRGBO(100, 110, 91, 1),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          userData.extraDetail['weight'] +
                                              '   kg',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                Color.fromRGBO(100, 110, 91, 1),
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    padding:
                                        EdgeInsets.only(left: 20, bottom: 20),
                                    icon: Icon(Icons.create),
                                    color: Color.fromRGBO(100, 110, 91, 1),
                                    iconSize: 20,
                                    onPressed: _weightUpdateDialog,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                Container(
                  margin: EdgeInsets.only(left: 35, right: 35, bottom: 60),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 39,
                        padding: EdgeInsets.only(left: 10, right: 8, bottom: 5),
                        child: TextButton(
                          onPressed: _preferenceDialog,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Edit Food Preferences',
                                style: TextStyle(
                                  color: Color.fromRGBO(100, 109, 93, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: Color.fromRGBO(100, 110, 91, 1),
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade400,
                        height: 10,
                      ),
                      Container(
                        height: 39,
                        padding: EdgeInsets.only(left: 10, right: 8, bottom: 5),
                        child: TextButton(
                          onPressed: _allergiesDialog,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Edit Food Allergies',
                                style: TextStyle(
                                  color: Color.fromRGBO(100, 109, 93, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: Color.fromRGBO(100, 110, 91, 1),
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(240, 37)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            color: Color.fromRGBO(100, 109, 93, 1),
                          ),
                          borderRadius: BorderRadius.circular(40)),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      await Provider.of<Auth>(context, listen: false)
                          .logout()
                          .then((_) {
                        Navigator.of(context)
                            .pushNamed(LandingScreen.routeName);
                      });
                    },
                    child: Text(
                      'SIGN OUT',
                      style: TextStyle(
                        color: Color.fromRGBO(100, 109, 93, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
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
