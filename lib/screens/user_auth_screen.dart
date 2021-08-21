import 'package:flutter/material.dart';
import 'package:health_hero/screens/landing_screen.dart';

class UserAuthScreen extends StatefulWidget {
  static const routeName = '/auth';

  @override
  _UserAuthScreenState createState() => _UserAuthScreenState();
}

class _UserAuthScreenState extends State<UserAuthScreen> {
  var _mode;
  final _formKey = GlobalKey<FormState>();
  Map<String, String> _loginData = {'username': '', 'password': ''};

  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();

  @override
  void didChangeDependencies() {
    _mode = ModalRoute.of(context).settings.arguments;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return _mode == AuthMode.Login
        ? Scaffold(
            body: Stack(
              children: <Widget>[
                Image(image: AssetImage('assets/images/User Auth.jpg')),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(44),
                            topLeft: Radius.circular(44),
                          ),
                          color: Colors.white),
                      child: Form(
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
                                    // obscureText: true,
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
                                      // if (value.length < 6) {
                                      //   return 'Password must longer than 6';
                                      // }
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
                              height: 100,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(205, 214, 169, 100)),
                              height: 56,
                              width: 328,
                              child: FlatButton(
                                onPressed: () {
                                  _loginData['username'] =
                                      _usernameController.text;
                                  _loginData['password'] =
                                      _passwordController.text;
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Text(
                                            "${_loginData['username']} has logged in successfully"),
                                      );
                                    },
                                  );
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
                                  onPressed: null,
                                  child: Text(
                                    'Sign Up',
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
          )
        : Center(child: Text('Signup'));
  }
}
