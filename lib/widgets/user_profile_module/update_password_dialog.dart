import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/user.dart';

class UpdatePasswordDialog extends StatefulWidget {
  @override
  State<UpdatePasswordDialog> createState() => _UpdatePasswordDialogState();
}

class _UpdatePasswordDialogState extends State<UpdatePasswordDialog> {
  bool _isLoading = false;
  String _statusMsg = '';

  String password = '';
  final passwordController = TextEditingController();
  final newPasswordController = TextEditingController();

  void _updatePassword() async {
    setState(() {
      _isLoading = true;
    });
    await Provider.of<User>(context, listen: false)
        .modfiyUserProfile('password', newPasswordController.text)
        .then((msg) {
      setState(() {
        _isLoading = false;
        _statusMsg = msg;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
        height: 70,
        width: 400,
        child: _isLoading
            ?
        Container(
          margin: const EdgeInsets.only(left:100, right: 100),
          child: CircularProgressIndicator(
            color: Color.fromRGBO(205, 214, 169, 100),
          ),
        )
            : _statusMsg == ''
                ? Column(
                    children: [
                      Container(
                        height: 30,
                        width: 200,
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
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
                        height: 10,
                      ),
                      Container(
                        height: 30,
                        width: 200,
                        child: TextField(
                          controller: newPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
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
                  )
                : Center(
                    child: Text(
                      'Update Successfully',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                      ),
                    ),
                  ),
      ),
      actions: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: _updatePassword,
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
                  setState(() {
                    _statusMsg = '';
                  });
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
    );
  }
}
