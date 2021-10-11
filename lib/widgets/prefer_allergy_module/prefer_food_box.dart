import 'package:flutter/material.dart';
import 'package:health_hero/screens/preferred_page.dart';

class PreferFoodBoxCard extends StatefulWidget {
  final String background;
  final String title;
  bool visibility = false;

  PreferFoodBoxCard({this.background, this.title});

  @override
  _PreferFoodBoxCardState createState() => _PreferFoodBoxCardState();
}

class _PreferFoodBoxCardState extends State<PreferFoodBoxCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.visibility == false) {
            widget.visibility = true;
            selectedPreferList.add(widget.title);
          } else {
            widget.visibility = false;
            selectedPreferList.remove(widget.title);
          }
        });
      },
      child: Container(
        // margin: EdgeInsets.all(20),
        width: 135,
        height: 135,
        margin: EdgeInsets.all(18),
        child: Center(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              Visibility(
                visible: widget.visibility,
                child: Align(
                  alignment: Alignment(0.8, -0.8),
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.orange,
                  ),
                ),
              ),
              Center(
                child: Text(
                  widget.title.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        // margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.background),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
