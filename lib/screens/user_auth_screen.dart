import 'package:flutter/material.dart';
import 'package:health_hero/screens/landing_screen.dart';

class UserAuthScreen extends StatefulWidget {
  static const routeName = '/auth';

  @override
  _UserAuthScreenState createState() => _UserAuthScreenState();
}

class _UserAuthScreenState extends State<UserAuthScreen> {
  var _mode;

  @override
  void didChangeDependencies() {
    _mode = ModalRoute.of(context).settings.arguments;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('User Authentication'),
        ),
        body: _mode == AuthMode.Login
            ? Center(
                child: Container(
                  child: Text('Login'),
                ),
              )
            : Center(
                child: Container(
                  child: Text('Signup'),
                ),
              ));
  }
}
