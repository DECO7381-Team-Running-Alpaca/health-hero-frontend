import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/preferred_page.dart';
import '../screens/login_page.dart';
import '../screens/sign_up_page.dart';
import '../provider/auth.dart';

class SignUpContinue extends StatefulWidget {
  static const routeName = '/continue';
  final SignUpData data;
  SignUpContinue({Key key, this.data}) : super(key: key);

  @override
  _SignUpContinueState createState() => _SignUpContinueState();
}

class _SignUpContinueState extends State<SignUpContinue> {
  final _formKey = GlobalKey<FormState>();
  bool _isChecked = false;
  bool _isLoading = false;
  bool pressStatusMale = false;
  bool pressStatusFemale = false;
  bool pressStatusLoss = false;
  bool pressStatusKeep = false;
  bool mode = false;

  Map<String, String> _signupData = {
    'username': '',
    'password': '',
    'email': '',
    'height': '',
    'weight': '',
  };

  String _loginStatus = '';

  double _deviceheight = 0;
  double _devicewidth = 0;

  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _targetController = TextEditingController();

  @override
  void didChangeDependencies() {
    _deviceheight = MediaQuery.of(context).size.height;
    _devicewidth = MediaQuery.of(context).size.width;

    super.didChangeDependencies();
  }

  void _submitSignupData() async {
    setState(() {
      _isLoading = true;
      _loginStatus = '';
      _signupData['username'] = widget.data.userName;
      _signupData['password'] = widget.data.password;
      _signupData['email'] = widget.data.email;
      _signupData['height'] = _heightController.text;
      _signupData['weight'] = _weightController.text;
    });
    try {
      await Provider.of<Auth>(context, listen: false)
          .signup(_signupData);
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
                height:
                    mode == false ? _deviceheight * 0.62 : _deviceheight * 0.70 - 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(44),
                      topLeft: Radius.circular(44),
                    ),
                    color: Colors.white),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        width: 328,
                        height: 56,
                        child: Row(
                          children: [
                            Text(
                              'Gender',
                              style: TextStyle(
                                color: Color.fromRGBO(103, 110, 94, 1),
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor: pressStatusMale
                                    ? MaterialStateProperty.all(
                                        Color.fromRGBO(151, 168, 132, 1))
                                    : MaterialStateProperty.all(
                                        Color.fromRGBO(244, 244, 244, 1)),
                                minimumSize:
                                    MaterialStateProperty.all(Size(119, 31)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(103, 110, 94, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(4)),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  pressStatusMale = true;
                                  pressStatusFemale = false;
                                });
                              },
                              child: Text(
                                'Male',
                                style: pressStatusMale
                                    ? TextStyle(color: Colors.white)
                                    : TextStyle(
                                        color: Color.fromRGBO(103, 110, 94, 1)),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor: pressStatusFemale
                                    ? MaterialStateProperty.all(
                                        Color.fromRGBO(151, 168, 132, 1))
                                    : MaterialStateProperty.all(
                                        Color.fromRGBO(244, 244, 244, 1)),
                                minimumSize:
                                    MaterialStateProperty.all(Size(119, 31)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(103, 110, 94, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(4)),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  pressStatusFemale = true;
                                  pressStatusMale = false;
                                });
                              },
                              child: Text(
                                'Female',
                                style: pressStatusFemale
                                    ? TextStyle(color: Colors.white)
                                    : TextStyle(
                                        color: Color.fromRGBO(103, 110, 94, 1)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        width: 328,
                        height: 56,
                        child: Row(
                          children: [
                            Text(
                              'Target',
                              style: TextStyle(
                                color: Color.fromRGBO(103, 110, 94, 1),
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              width: 26,
                            ),
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor: pressStatusLoss
                                    ? MaterialStateProperty.all(
                                        Color.fromRGBO(151, 168, 132, 1))
                                    : MaterialStateProperty.all(
                                        Color.fromRGBO(244, 244, 244, 1)),
                                minimumSize:
                                    MaterialStateProperty.all(Size(119, 31)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(103, 110, 94, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(4)),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  pressStatusLoss = true;
                                  pressStatusKeep = false;
                                  mode = true;
                                });
                              },
                              child: Text(
                                'Lose Weight',
                                style: pressStatusLoss
                                    ? TextStyle(color: Colors.white)
                                    : TextStyle(
                                        color: Color.fromRGBO(103, 110, 94, 1)),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor: pressStatusKeep
                                    ? MaterialStateProperty.all(
                                        Color.fromRGBO(151, 168, 132, 1))
                                    : MaterialStateProperty.all(
                                        Color.fromRGBO(244, 244, 244, 1)),
                                minimumSize:
                                    MaterialStateProperty.all(Size(119, 31)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(103, 110, 94, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(4)),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  pressStatusKeep = true;
                                  pressStatusLoss = false;
                                  mode = false;
                                });
                              },
                              child: Text(
                                'Keep In Shape',
                                style: pressStatusKeep
                                    ? TextStyle(color: Colors.white)
                                    : TextStyle(
                                        color: Color.fromRGBO(103, 110, 94, 1)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: mode == false
                          ? Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Container(
                                      width: 328,
                                      height: 56,
                                      child: Row(
                                        children: [
                                          Text(
                                            'Height',
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  103, 110, 94, 1),
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 25,
                                          ),
                                          Container(
                                            width: 250,
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  244, 244, 244, 1),
                                              borderRadius:
                                                  new BorderRadius.only(
                                                topRight: Radius.circular(4),
                                                topLeft: Radius.circular(4),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  suffixText: 'cm',
                                                ),
                                                keyboardType:
                                                    TextInputType.number,
                                                controller: _heightController,
                                                validator: (value) => value
                                                            .isEmpty ||
                                                        value == null
                                                    ? 'Height cannot be empty!'
                                                    : null,
                                              ),
                                            ),
                                          ),
                                        ],
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
                                      child: Row(
                                        children: [
                                          Text(
                                            'Weight',
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  103, 110, 94, 1),
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 25,
                                          ),
                                          Container(
                                            width: 250,
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  244, 244, 244, 1),
                                              borderRadius:
                                                  new BorderRadius.only(
                                                topRight: Radius.circular(4),
                                                topLeft: Radius.circular(4),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  suffixText: 'kg',
                                                ),
                                                keyboardType:
                                                    TextInputType.number,
                                                controller: _weightController,
                                                validator: (value) => value
                                                            .isEmpty ||
                                                        value == null
                                                    ? 'Weight cannot be empty!'
                                                    : null,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Container(
                                      width: 328,
                                      height: 56,
                                      child: Row(
                                        children: [
                                          Text(
                                            'Height',
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  103, 110, 94, 1),
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 25,
                                          ),
                                          Container(
                                            width: 250,
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  244, 244, 244, 1),
                                              borderRadius:
                                                  new BorderRadius.only(
                                                topRight: Radius.circular(4),
                                                topLeft: Radius.circular(4),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  suffixText: 'cm',
                                                ),
                                                keyboardType:
                                                    TextInputType.number,
                                                controller: _heightController,
                                                validator: (value) => value
                                                            .isEmpty ||
                                                        value == null
                                                    ? 'Height cannot be empty!'
                                                    : null,
                                              ),
                                            ),
                                          ),
                                        ],
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
                                      child: Row(
                                        children: [
                                          Text(
                                            'Weight',
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  103, 110, 94, 1),
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 25,
                                          ),
                                          Container(
                                            width: 250,
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  244, 244, 244, 1),
                                              borderRadius:
                                                  new BorderRadius.only(
                                                topRight: Radius.circular(4),
                                                topLeft: Radius.circular(4),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  suffixText: 'kg',
                                                ),
                                                keyboardType:
                                                    TextInputType.number,
                                                controller: _weightController,
                                                validator: (value) => value
                                                            .isEmpty ||
                                                        value == null
                                                    ? 'Weight cannot be empty!'
                                                    : null,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Container(
                                      width: 330,
                                      height: 56,
                                      child: Row(
                                        children: [
                                          Text(
                                            'Target Weight',
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  103, 110, 94, 1),
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 25,
                                          ),
                                          Container(
                                            width: 200,
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  244, 244, 244, 1),
                                              borderRadius:
                                                  new BorderRadius.only(
                                                topRight: Radius.circular(4),
                                                topLeft: Radius.circular(4),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  suffixText: 'kg',
                                                ),
                                                keyboardType:
                                                    TextInputType.number,
                                                controller: _targetController,
                                                validator: (value) => value
                                                            .isEmpty ||
                                                        value == null
                                                    ? 'Target weight cannot be empty!'
                                                    : null,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: _isChecked,
                            activeColor: Color.fromRGBO(205, 214, 169, 1),
                            onChanged: (bool value) {
                              setState(() {
                                if (!_isChecked) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 20,
                                          ),
                                          child: Wrap(
                                              alignment:
                                                  WrapAlignment.spaceAround,
                                              spacing: 8.0,
                                              runSpacing: 1,
                                              children: [
                                                Icon(
                                                  Icons.notification_important,
                                                  size: 40,
                                                ),
                                                Text(
                                                  "I authorize Health Hero to collect",
                                                ),
                                                Text(
                                                  "and use my information.",
                                                )
                                              ]),
                                        ),
                                        actions: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 40, right: 40),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      _isChecked = true;
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text(
                                                    'Yes',
                                                    style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          103, 110, 94, 1),
                                                    ),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      _isChecked = false;
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text(
                                                    'No',
                                                    style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          103, 110, 94, 1),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
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
                                color: Color.fromRGBO(205, 214, 169, 100)),
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
                            Navigator.of(context)
                                .pushNamed(LoginPage.routeName);
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
            ],
          )
        ],
      ),
    );
  }
}
