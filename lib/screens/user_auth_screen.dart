import 'package:flutter/material.dart';
import 'package:health_hero/screens/home_screen.dart';
import 'package:health_hero/screens/landing_screen.dart';

class UserAuthScreen extends StatefulWidget {
  static const routeName = '/auth';

  @override
  _UserAuthScreenState createState() => _UserAuthScreenState();
}

class _UserAuthScreenState extends State<UserAuthScreen> {
  var _mode;
  final _formKey = GlobalKey<FormState>();
  bool _isChecked = false;
  Map<String, String> _loginData = {'username': '', 'password': ''};
  Map<String, String> _signupData = {
    'username': '',
    'password': '',
    'height': '',
    'weight': ''
  };

  double _deviceheight = 0;
  double _devicewidth = 0;

  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void didChangeDependencies() {
    _mode = ModalRoute.of(context).settings.arguments;
    _deviceheight = MediaQuery.of(context).size.height;
    _devicewidth = MediaQuery.of(context).size.width;

    super.didChangeDependencies();
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
                                      hintText: 'Please enter user name',
                                    ),
                                    controller: _usernameController,
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
                                    controller: _passwordController,
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
                            Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(205, 214, 169, 100)),
                              height: 56,
                              width: 328,
                              child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    _loginData['username'] =
                                        _usernameController.text;
                                    _loginData['password'] =
                                        _passwordController.text;
                                  });
                                  Navigator.of(context)
                                      .pushNamed(HomeScreen.routeName);
                                },
                                child: Text(
                                  'SIGN IN',
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
                                    controller: _usernameController,
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
                                    controller: _passwordController,
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
                            Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(205, 214, 169, 100)),
                              height: 56,
                              width: 328,
                              child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    _signupData['username'] =
                                        _usernameController.text;
                                    _signupData['password'] =
                                        _passwordController.text;
                                    _signupData['height'] =
                                        _heightController.text;
                                    _signupData['weight'] =
                                        _weightController.text;
                                  });
                                  Navigator.of(context)
                                      .pushNamed('preferredPage');
                                },
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
