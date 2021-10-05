import 'package:flutter/material.dart';
import 'package:health_hero/screens/allergies_page.dart';

class AllergyFoodBoxCard extends StatefulWidget {
  final String background;
  final String title;
  bool visibility = false;

  AllergyFoodBoxCard({this.background, this.title});

  @override
  _AllergyFoodBoxCardState createState() => _AllergyFoodBoxCardState();
}

class _AllergyFoodBoxCardState extends State<AllergyFoodBoxCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.visibility == false) {
            widget.visibility = true;
            selectedAllergyList.add(widget.title);
          } else {
            widget.visibility = false;
            selectedAllergyList.remove(widget.title);
          }
        });
      },
      child: Container(
        // margin: EdgeInsets.all(20),
        width: 150,
        height: 150,
        margin: EdgeInsets.all(12),
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
                    fontSize: 20,
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
