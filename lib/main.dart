import 'package:flutter/material.dart';
import 'package:health_hero/screens/allergies_page.dart';
import 'package:health_hero/screens/preferred_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Hero',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'preferredPage',
      routes: {
        'preferredPage': (context) => PreferredPage(),
        'allergyPage' : (context) => AllergyPage(),
      },
    );
  }
}
