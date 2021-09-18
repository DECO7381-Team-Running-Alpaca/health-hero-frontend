import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:health_hero/models/meal.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  String userName = 'Orlando Smith';
  String password = '';
  String email = 'orlando.smith@email.com';
  String height = '175';
  String weight = '140';

  final passwordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final emailController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SafeArea(
                child: Container(
                  margin: EdgeInsets.only(left: 40, right: 40, top: 40),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Account Settings',
                            style: TextStyle(
                              fontSize: 30,
                              color: Color.fromRGBO(100, 110, 91, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 60, left: 35, right: 35, bottom: 25),
                padding: EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 15),
                height: 328,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20, top: 5),
                      height: 46,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'User Name',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(100, 110, 91, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            userName,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(100, 110, 91, 1),
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade400,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 15, top: 5),
                      height: 46,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Password',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(100, 110, 91, 1),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '**********',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(100, 110, 91, 1),
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            padding: EdgeInsets.only(left: 20, bottom: 20),
                            icon: Icon(Icons.create),
                            color: Color.fromRGBO(100, 110, 91, 1),
                            iconSize: 20,
                            onPressed: (){
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog (
                                    title: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Change Password',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color.fromRGBO(100, 110, 91, 1),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    content: Container(
                                      height: 72,
                                      width: 400,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 200,
                                            child: TextField(
                                              controller: passwordController,
                                              obscureText: true,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                                hintText: 'Enter original password',
                                                hintStyle: TextStyle(
                                                  fontSize: 14,
                                                ),
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Container(
                                            height: 30,
                                            width: 200,
                                            child: TextField(
                                              controller: newPasswordController,
                                              obscureText: true,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                                hintText: 'Enter new password',
                                                hintStyle: TextStyle(
                                                  fontSize: 14,
                                                ),
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    actions: [
                                      Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                'CONFIRM',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(100, 109, 93, 1),
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 80,
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                'CANCEL',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(100, 109, 93, 1),
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade400,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 15, top: 5),
                      height: 46,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(100, 110, 91, 1),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  email,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(100, 110, 91, 1),
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            padding: EdgeInsets.only(left: 20, bottom: 20),
                            icon: Icon(Icons.create),
                            color: Color.fromRGBO(100, 110, 91, 1),
                            iconSize: 20,
                            onPressed: (){
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog (
                                    title: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Change Email Address',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color.fromRGBO(100, 110, 91, 1),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    content: Container(
                                      height: 30,
                                      width: 400,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 210,
                                            child: TextField(
                                              controller: emailController,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                                hintText: 'Enter new email address',
                                                hintStyle: TextStyle(
                                                  fontSize: 14,
                                                ),
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                'CONFIRM',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(100, 109, 93, 1),
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 80,
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                'CANCEL',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(100, 109, 93, 1),
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade400,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 15, top: 5),
                      height: 21,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Height',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(100, 110, 91, 1),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Icon(
                              Icons.create,
                              color: Color.fromRGBO(100, 110, 91, 1),
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            height: 25,
                            width: 50,
                            padding: EdgeInsets.only(top: 12, left: 20),
                            child: Column(
                              children: [
                                Expanded(child: TextFormField(
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(100, 110, 91, 1),
                                    fontWeight: FontWeight.normal,
                                  ),
                                  keyboardType: TextInputType.number,
                                  controller: heightController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: height,
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromRGBO(100, 110, 91, 1),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5, left: 10, bottom: 3),
                            child: Text(
                              'cm',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(100, 110, 91, 1),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade400,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 15, top: 5),
                      height: 21,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Weight',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(100, 110, 91, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 27,
                      padding: EdgeInsets.only(top: 5, left: 20),
                      child: TextFormField(
                        style: TextStyle(
                          height: 1.7,
                          fontSize: 14,
                          color: Color.fromRGBO(100, 110, 91, 1),
                          fontWeight: FontWeight.normal,
                          // textBaseline: TextBaseline.alphabetic,
                        ),
                        keyboardType: TextInputType.number,
                        controller: weightController,
                        decoration: InputDecoration(
                          // isDense: true,
                          contentPadding: EdgeInsets.only(),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                          ),
                          suffixIcon: Icon(
                            Icons.create,
                            size: 20,
                            color: Color.fromRGBO(100, 110, 91, 1),
                          ),
                          suffix: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('kg'),
                                SizedBox(
                                  width: 190,
                                ),
                              ]
                          ),
                          hintText: weight,
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(100, 110, 91, 1),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 35, right: 35, bottom: 60),
                padding: EdgeInsets.only(left: 10, right: 10),
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 39,
                      padding: EdgeInsets.only(left: 10, right: 8, top: 5),
                      child: TextButton(
                        onPressed: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Edit Food Preferences',
                              style: TextStyle(
                                color: Color.fromRGBO(100, 109, 93, 1),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: Color.fromRGBO(100, 110, 91, 1),
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade400,
                      height: 10,
                    ),
                    Container(
                      height: 39,
                      padding: EdgeInsets.only(left: 10, right: 8, bottom: 5),
                      child: TextButton(
                        onPressed: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Edit Food Allergies',
                                style: TextStyle(
                                  color: Color.fromRGBO(100, 109, 93, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: Color.fromRGBO(100, 110, 91, 1),
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: (){},
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(240, 37)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: Color.fromRGBO(100, 109, 93, 1),
                      ),
                      borderRadius: BorderRadius.circular(40)
                  ),),
                ),
                child: Text(
                  'SIGN OUT',
                  style: TextStyle(
                    color: Color.fromRGBO(100, 109, 93, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

