import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/home_screen.dart';
import '../screens/sign_up_page.dart';
import '../provider/auth.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _mode;
  bool _isLoading = false;

  Map<String, String> _loginData = {'username': '', 'password': ''};

  String _loginStatus = '';

  double _deviceheight = 0;
  double _devicewidth = 0;

  final _lPasswordController = TextEditingController();
  final _lUserController = TextEditingController();

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
                height: _deviceheight * 0.55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(44),
                      topLeft: Radius.circular(44),
                    ),
                    color: Colors.white),
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
                                'User name/email',
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
                                hintText: 'Password',
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
                                Navigator.of(context).pushNamed(SignUpPage.routeName);
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
              ),
            ],
          )
        ],
      ),
    );
  }
}
