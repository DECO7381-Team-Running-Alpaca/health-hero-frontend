import 'package:flutter/material.dart';
import 'package:health_hero/constants/api_path.dart';
import 'package:health_hero/screens/preferred_page.dart';
import 'package:provider/provider.dart';

import '../../provider/user.dart';

class FoodPreferencesDialog extends StatefulWidget {
  @override
  State<FoodPreferencesDialog> createState() => _UpdatePreferencesDialogState();
}

class _UpdatePreferencesDialogState extends State<FoodPreferencesDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        alignment: Alignment.center,
        child: Text(
          'Current Food Preferences',
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
        child: Text(
            Provider.of<User>(context, listen: false).preferences.join(',')
        ),
      ),
      actions: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: (){

                },
                child: const Text(
                  'EDIT',
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
                  'CLOSE',
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