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
      body: Stack(
        children: <Widget>[
          // Container(
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage('assets/images/User Auth.jpg'),
          //       fit: BoxFit.cover
          //   )),
          // ),
          Image(image: AssetImage('assets/images/User Auth.jpg')),
          
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(44),
                    topLeft: Radius.circular(44),
                  ),
                  color: Colors.white
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[Text('Hello')],
                ),
              ),
            ],
          )
          //   ]
          // ),
        ],
      ),
    );
  }
  //       _mode == AuthMode.Login
  //           ? Center(
  //               child: Container(
  //                 child: Text('Login'),
  //               ),
  //             )
  //           : Center(
  //               child: Container(
  //                 child: Text('Signup'),
  //               ),
  //             ));
  // }
}
