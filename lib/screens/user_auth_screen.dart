import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:health_hero/screens/preferred_page.dart';
import 'package:health_hero/screens/home_screen.dart';
import 'package:health_hero/screens/landing_screen.dart';
import '../provider/auth.dart';

class UserAuthScreen extends StatefulWidget {
  static const routeName = '/auth';

  @override
  _UserAuthScreenState createState() => _UserAuthScreenState();
}

class _UserAuthScreenState extends State<UserAuthScreen> {
  var _mode;
  final _formKey = GlobalKey<FormState>();
  bool _isChecked = false;
  bool _isLoading = false;

  Map<String, String> _loginData = {'username': '', 'password': ''};
  Map<String, String> _signupData = {
    'username': '',
    'password': '',
    'height': '',
    'weight': ''
  };

  String get userName {
    return _signupData['username'];
  }

  String _loginStatus = '';

  double _deviceheight = 0;
  double _devicewidth = 0;

  final _lPasswordController = TextEditingController();
  final _lUserController = TextEditingController();
  final _sPasswordController = TextEditingController();
  final _sUserController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void didChangeDependencies() {
    _mode = ModalRoute.of(context).settings.arguments;
    _deviceheight = MediaQuery.of(context).size.height;
    _devicewidth = MediaQuery.of(context).size.width;

    super.didChangeDependencies();
  }

  void _submitLoginData() async {
    setState(() {
      _isLoading = true;
      _loginStatus = '';
      // _loginData['username'] = _lUserController.text;
      // _loginData['password'] = _lPasswordController.text;
      _loginData['username'] = 'aatest';
      _loginData['password'] = 'AAaa77';
    });

    try {
      await Provider.of<Auth>(context, listen: false).login(_loginData);
      setState(() {
        _loginStatus = Provider.of<Auth>(context, listen: false).message;
        _isLoading = false;
      });

      // more elegant way to handle error
      if (_loginStatus != 'You Shall Not Pass!') {
        Navigator.of(context).pushNamed(HomeScreen.routeName);
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      throw error;
    }
  }

  void _submitSignupData() async {
    setState(() {
      _isLoading = true;
      _loginStatus = '';
      _signupData['username'] = _sUserController.text;
      _signupData['password'] = _sPasswordController.text;
      _signupData['height'] = _heightController.text;
      _signupData['weight'] = _weightController.text;
    });
    try {
      await Provider.of<Auth>(context, listen: false).signup(_signupData);
      setState(() {
        _loginStatus = Provider.of<Auth>(context, listen: false).message;
        _isLoading = false;
      });

      // more elegant way to handle error
      if (_loginStatus != 'Please make sure that body is well organized.') {
        Navigator.of(context).pushNamed(PreferredPage.routeName);
      }
    } catch (error) {
      setState(() {
        _loginStatus = 'User already exists';
        _isLoading = false;
      });
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image(image: AssetImage('assets/images/User Auth.jpg')),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: _devicewidth,
                height: _mode == AuthMode.Login
                    ? _deviceheight * 0.55
                    : _deviceheight * 0.69,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(44),
                      topLeft: Radius.circular(44),
                    ),
                    color: Colors.white),
                child: _mode == AuthMode.Login
                    ? Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 80,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                width: 328,
                                height: 56,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(244, 244, 244, 1),
                                  borderRadius: new BorderRadius.only(
                                    topRight: Radius.circular(4),
                                    topLeft: Radius.circular(4),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText:
                                          'Please enter username or email',
                                    ),
                                    controller: _lUserController,
                                    validator: (value) => value.isEmpty
                                        ? 'Username cannot be empty!'
                                        : null,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Container(
                                width: 328,
                                height: 56,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(244, 244, 244, 1),
                                  borderRadius: new BorderRadius.only(
                                    topRight: Radius.circular(4),
                                    topLeft: Radius.circular(4),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Please enter password',
                                    ),
                                    obscureText: true,
                                    controller: _lPasswordController,
                                    validator: (value) {
                                      if (value.isEmpty || value.length < 6) {
                                        return 'Password must longer than 6';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 70,
                            ),
                            // Request Placeholder
                            Text(
                              _loginStatus,
                              style: TextStyle(color: Colors.black),
                            ),
                            _isLoading
                                ? CircularProgressIndicator(
                                    value: null,
                                    strokeWidth: 7,
                                    color: Color.fromRGBO(205, 214, 169, 100),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromRGBO(205, 214, 169, 100)),
                                    height: 56,
                                    width: 328,
                                    child: FlatButton(
                                      onPressed: _submitLoginData,
                                      child: Text(
                                        'LOG IN',
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(color: Colors.black54),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _mode = AuthMode.Signup;
                                    });
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 80,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                width: 328,
                                height: 56,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(244, 244, 244, 1),
                                  borderRadius: new BorderRadius.only(
                                    topRight: Radius.circular(4),
                                    topLeft: Radius.circular(4),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'User name',
                                    ),
                                    // obscureText: true,
                                    controller: _sUserController,
                                    validator: (value) =>
                                        value.isEmpty || value == null
                                            ? 'Username cannot be empty!'
                                            : null,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Container(
                                width: 328,
                                height: 56,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(244, 244, 244, 1),
                                  borderRadius: new BorderRadius.only(
                                    topRight: Radius.circular(4),
                                    topLeft: Radius.circular(4),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Please enter password',
                                    ),
                                    obscureText: true,
                                    controller: _sPasswordController,
                                    validator: (value) {
                                      if (value.isEmpty || value.length < 6) {
                                        return 'Password must longer than 6';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                width: 328,
                                height: 56,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(244, 244, 244, 1),
                                  borderRadius: new BorderRadius.only(
                                    topRight: Radius.circular(4),
                                    topLeft: Radius.circular(4),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Height',
                                    ),
                                    keyboardType: TextInputType.number,
                                    controller: _heightController,
                                    validator: (value) =>
                                        value.isEmpty || value == null
                                            ? 'Height cannot be empty!'
                                            : null,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                width: 328,
                                height: 56,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(244, 244, 244, 1),
                                  borderRadius: new BorderRadius.only(
                                    topRight: Radius.circular(4),
                                    topLeft: Radius.circular(4),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Weight',
                                    ),
                                    keyboardType: TextInputType.number,
                                    controller: _weightController,
                                    validator: (value) =>
                                        value.isEmpty || value == null
                                            ? 'height'
                                            : null,
                                  ),
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: _isChecked,
                                    onChanged: (bool value) {
                                      setState(() {
                                        if (!_isChecked) {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 20,
                                                  ),
                                                  child: Wrap(
                                                      alignment: WrapAlignment
                                                          .spaceAround,
                                                      spacing: 8.0,
                                                      runSpacing: 1,
                                                      children: [
                                                        Icon(
                                                          Icons.alarm,
                                                          size: 40,
                                                        ),
                                                        Text(
                                                            "I authorize Health Hero to collect"),
                                                        Text(
                                                            "and use my information.")
                                                      ]),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        _isChecked = true;
                                                      });
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('Yes'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        _isChecked = false;
                                                      });
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('No'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        } else {
                                          setState(() {
                                            _isChecked = false;
                                          });
                                        }
                                      });
                                    },
                                  ),
                                  Text('Confidential Agreement')
                                ],
                              ),
                            ),
                            Text(
                              _loginStatus,
                              style: TextStyle(color: Colors.red),
                            ),
                            _isLoading
                                ? CircularProgressIndicator(
                                    value: null,
                                    strokeWidth: 7,
                                    color: Color.fromRGBO(205, 214, 169, 100),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromRGBO(205, 214, 169, 100)),
                                    height: 56,
                                    width: 328,
                                    child: FlatButton(
                                      onPressed: _submitSignupData,
                                      child: Text(
                                        'CONTINUE',
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Already have an account?",
                                  style: TextStyle(color: Colors.black54),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _mode = AuthMode.Login;
                                    });
                                  },
                                  child: Text(
                                    'Log In',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
