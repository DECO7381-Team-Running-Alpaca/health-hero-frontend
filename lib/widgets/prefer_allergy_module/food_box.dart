import 'package:flutter/material.dart';

class FoodBoxCard extends StatefulWidget {
  final String background;
  final String title;
  bool visibility = false;

  FoodBoxCard({this.background, this.title});

  @override
  _FoodBoxCardState createState() => _FoodBoxCardState();
}

class _FoodBoxCardState extends State<FoodBoxCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          this.widget.visibility = !this.widget.visibility;
        });
      },
      child: Container(
        // margin: EdgeInsets.all(20),
        width: 170,
        height: 170,
        margin: EdgeInsets.all(12),
        child: Center(
          child: Stack(
            children: [
              Visibility(
                visible: this.widget.visibility,
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
                  this.widget.title.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
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
            image: AssetImage(this.widget.background),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
