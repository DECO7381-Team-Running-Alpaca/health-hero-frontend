import 'package:flutter/material.dart';
import 'package:health_hero/provider/app_state.dart';
import 'package:provider/provider.dart';

class DaySelector extends StatelessWidget {
  final int selfIndex;
  final String day;
  final int date;

  DaySelector({this.selfIndex, this.day, this.date});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final isSelected = appState.selectedCategoryId == this.selfIndex;

    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          appState.updateCategoryId(this.selfIndex);
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        width: 41,
        height: 60,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Offstage(
              offstage: !isSelected,
              child: Container(
                height: 100,
                width: 37,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color.fromRGBO(100, 110, 91, 1),
                ),
              ),
            ),
            Offstage(
              offstage: !isSelected,
              child: Container(
                width: 41,
                height: 41,
                transform: Matrix4.translationValues(0, 18, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Color.fromRGBO(100, 110, 91, 1),
                    width: 1.5,
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    transform: Matrix4.translationValues(0, 2, 0),
                    child: Text(
                      this.day,
                      style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : Color.fromRGBO(100, 110, 91, 1),
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues(0, 5, 0),
                    child: Text(
                      '${this.date}',
                      style: TextStyle(
                          color: Color.fromRGBO(100, 110, 91, 1),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
