import 'package:flutter/material.dart';
import 'package:health_hero/models/meal.dart';
import 'package:health_hero/screens/full_plan_page.dart';
import 'package:health_hero/screens/health_profile_page.dart';
import 'package:health_hero/screens/health_report_page.dart';
import 'package:health_hero/screens/login_page.dart';
import 'package:health_hero/screens/profile_page.dart';
import 'package:health_hero/screens/sign_up_continue.dart';
import 'package:health_hero/screens/sign_up_page.dart';
import 'package:provider/provider.dart';

import 'package:health_hero/screens/allergies_page.dart';
import 'package:health_hero/screens/home_screen.dart';
import 'package:health_hero/screens/landing_screen.dart';
import 'package:health_hero/screens/preferred_page.dart';
import 'package:health_hero/screens/user_auth_screen.dart';
import './provider/auth.dart';
import './provider/user.dart';
import './provider/meals.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth()),
        ChangeNotifierProxyProvider<Auth, User>(
          create: null,
          update: (context, auth, prevUser) => User(auth.token, auth.userId,
              prevUser == null ? '' : prevUser.userName),
        ),
        // ChangeNotifierProxyProvider<Auth, Meals>(
        //   create: null,
        //   update: (context, auth, prevMeal) => Meals(
        //       auth.token, auth.userId,
        //       prevMeal == null ? '' : prevMeal.weekId),
        // ),
        ChangeNotifierProvider(create: (context) => Meals()),
      ],
      child: MaterialApp(
        title: 'Health Hero',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: MyHomePage(),
      ),
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
        HealthReportPage.routeName: (context) => HealthReportPage(),
        SignUpPage.routeName: (context) => SignUpPage(),
        SignUpContinue.routeName: (context) => SignUpContinue(),
        LoginPage.routeName: (context) => LoginPage(),
        FullPlanPage.routeName: (context) => FullPlanPage(),
      },
    );
  }
}
