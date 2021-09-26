import 'package:flutter/material.dart';

class UpdatePasswordDialog extends StatefulWidget {
  @override
  State<UpdatePasswordDialog> createState() => _UpdatePasswordDialogState();
}

class _UpdatePasswordDialogState extends State<UpdatePasswordDialog> {
  String password = '';
  final passwordController = TextEditingController();
  final newPasswordController = TextEditingController();

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
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                  print(newPasswordController.text);
                  Navigator.of(context).pop();
                  setState(() {
                    password = newPasswordController.text;
                  });
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
    );
  }
}
