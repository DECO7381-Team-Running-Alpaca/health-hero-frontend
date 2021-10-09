import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/user.dart';

class UpdateEmailDialog extends StatefulWidget {
  @override
  State<UpdateEmailDialog> createState() => _UpdateEmailDialogState();
}

class _UpdateEmailDialogState extends State<UpdateEmailDialog> {
  bool _isLoading = false;
  String _statusMsg = '';

  String email = '';
  final emailController = TextEditingController();

  void _updateEmail() async {
    setState(() {
      _isLoading = true;
    });
    await Provider.of<User>(context, listen: false)
        .modfiyUserProfile('email', emailController.text)
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
        child: _isLoading
            ?
        // Indicator style bugs
        Container(
          margin: const EdgeInsets.only(left:125, right: 125),
          child: CircularProgressIndicator(
            color: Color.fromRGBO(205, 214, 169, 100),
          ),
        )
         : _statusMsg == ''
            ? Column(
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
                onPressed: _updateEmail,
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
