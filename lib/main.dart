import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/screens/full_plan_page.dart';
import '/screens/health_report_page.dart';
import '/screens/login_page.dart';
import '/screens/sign_up_continue.dart';
import '/screens/sign_up_page.dart';
import '/screens/allergies_page.dart';
import '/screens/home_screen.dart';
import '/screens/landing_screen.dart';
import '/screens/preferred_page.dart';
import '/screens/user_auth_screen.dart';
import './screens/scan_meal_screen.dart';
import '/provider/auth.dart';
import '/provider/user.dart';
import '/provider/meals.dart';

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
      // initialRoute: ScanPage.routeName,
      initialRoute: LandingScreen.routeName,
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
        ScanMealScrenn.routeName: (context) => ScanMealScrenn(),
      },
    );
  }
}
