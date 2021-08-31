import 'package:flutter/material.dart';

import 'package:health_hero/screens/allergies_page.dart';
import 'package:health_hero/screens/home_screen.dart';
import 'package:health_hero/screens/landing_screen.dart';
import 'package:health_hero/screens/preferred_page.dart';
import 'package:health_hero/screens/user_auth_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Hero',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.routeName,
      routes: {
        PreferredPage.routeName: (context) => PreferredPage(),
        AllergyPage.routeName: (context) => AllergyPage(),
        LandingScreen.routeName: (context) => LandingScreen(),
        UserAuthScreen.routeName: (context) => UserAuthScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}
