import 'package:flutter/material.dart';
import 'package:health_hero/widgets/continue_and_complete_button.dart';

class allergyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: Text(
                    'Tell us the food you preferred',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          Column(
                            children:[
                              Container(
                                
                              )

                            ]
                          ),
                          Column(),
                        ],
                      )),
                      ContinueAndCompleteButton(
                        onTap: null,
                        buttonTitle: 'COMPLETE',
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
