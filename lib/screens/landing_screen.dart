import 'package:flutter/material.dart';

import './login_page.dart';
import './sign_up_page.dart';

enum AuthMode { Login, Signup }

class LandingScreen extends StatefulWidget {
  static const routeName = '/landing';

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  void _continueAuth(AuthMode mode, BuildContext ctx) {
    switch (mode) {
      case AuthMode.Login:
        Navigator.of(ctx)
            .pushNamed(LoginPage.routeName, arguments: AuthMode.Login);
        break;
      case AuthMode.Signup:
        Navigator.of(ctx)
            .pushNamed(SignUpPage.routeName, arguments: AuthMode.Signup);
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/Landing Page.jpg'),
              fit: BoxFit.fill,
            )),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 400,
                ),
                Text(
                  'Health Hero',
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.6),
                      fontSize: 50,
                      fontFamily: 'SinhalaMN',
                      fontWeight: FontWeight.w200),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 328,
                  height: 56,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.0),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {
                      _continueAuth(AuthMode.Login, context);
                    },
                    child: Text(
                      'LOG IN',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.6),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 328,
                  height: 56,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.0),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {
                      _continueAuth(AuthMode.Signup, context);
                    },
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.6),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
