import 'package:flutter/material.dart';
import 'package:health_hero/provider/meals.dart';
import 'package:health_hero/provider/user.dart';
import 'package:health_hero/utils/helpers/sentence_linter.dart';
import 'package:health_hero/widgets/prefer_allergy_module/loading_circle.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../models/meal.dart';
import '../../utils/services/rest_api_service.dart';
import './breakfast_lunch_dinner_selector.dart';

class DateMealWidget extends StatefulWidget {
  final DailyMeals dailyMeals;

  const DateMealWidget({Key key, this.dailyMeals}) : super(key: key);

  @override
  State<DateMealWidget> createState() => _DateMealWidgetState();
}

int daySelector = 0;

class _DateMealWidgetState extends State<DateMealWidget> {
  var _isLoading = false;
  var _isMealLoading = false;
  var _videoLoading = false;
  var videoId = '';

  YoutubePlayerController _videoController;
  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;

  @override
  void initState() {
    super.initState();
    setState(() {
      _videoController = YoutubePlayerController(
        initialVideoId: widget.dailyMeals.threeMeals[0].ytbVideoID,
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );
      _playerState = PlayerState.unknown;
      _videoMetaData = const YoutubeMetaData();
    });

    fetchRandomMeal().then((meal) {
      // Careful: this meal has a random date and mealType
      print(meal.mealName);
    });
  }

  void newListener() {
    setState(() {
      _playerState = _videoController.value.playerState;
      _videoMetaData = _videoController.metadata;
    });
  }

  void _changeMeal() async {
    setState(() {
      _isMealLoading = true;
    });
    fetchRandomMeal().then((meal) {
      // Careful: this meal has a random date and mealType
      print(meal.mealName);
      setState(() {
        widget.dailyMeals.threeMeals[daySelector] = meal;
        _isMealLoading = false;
        if (_videoController.value.isPlaying) {
          _videoController.pause();
        }
        _videoController
            .load(widget.dailyMeals.threeMeals[daySelector].ytbVideoID);
        _videoController.pause();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double futureWeeklyCalories = widget.dailyMeals.threeMeals[0].calories +
        widget.dailyMeals.threeMeals[1].calories +
        widget.dailyMeals.threeMeals[2].calories;

    return Container(
      margin: EdgeInsets.only(
        top: 30,
        left: 20,
        right: 20,
      ),
      height: 540,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.dailyMeals.threeMeals[daySelector].date,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(100, 110, 91, 1),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text('${futureWeeklyCalories.toStringAsFixed(2)}KCAL',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(100, 110, 91, 1),
                      fontWeight: FontWeight.w700,
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BreakfastLunchDinnerSelector(
                    mealTime: 'breakfast',
                    function: () {
                      setState(() {
                        daySelector = 0;
                      });
                      if (_videoController.value.isPlaying) {
                        _videoController.pause();
                      }
                      _videoController
                          .load(widget.dailyMeals.threeMeals[0].ytbVideoID);
                      _videoController.pause();
                    },
                    buttonID: 0,
                  ),
                  BreakfastLunchDinnerSelector(
                    mealTime: 'lunch',
                    function: () {
                      setState(() {
                        daySelector = 1;
                      });
                      if (_videoController.value.isPlaying) {
                        _videoController.pause();
                      }
                      _videoController
                          .load(widget.dailyMeals.threeMeals[1].ytbVideoID);
                      _videoController.pause();
                    },
                    buttonID: 1,
                  ),
                  BreakfastLunchDinnerSelector(
                    mealTime: 'dinner',
                    function: () {
                      setState(() {
                        daySelector = 2;
                      });
                      if (_videoController.value.isPlaying) {
                        _videoController.pause();
                      }
                      _videoController
                          .load(widget.dailyMeals.threeMeals[2].ytbVideoID);
                      _videoController.pause();
                    },
                    buttonID: 2,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Container(
                    // decoration: BoxDecoration(border: Border.all(width: 2)),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              widget.dailyMeals.threeMeals[daySelector].mealType
                                  .toUpperCase(),
                              style: TextStyle(
                                color: Color.fromRGBO(100, 110, 91, 1),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '${widget.dailyMeals.threeMeals[daySelector].calories}KCAL',
                              style: TextStyle(
                                color: Color.fromRGBO(100, 110, 91, 1),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 40,
                          transform: Matrix4.translationValues(230, 0, 0),
                          child: _isMealLoading
                              ? Container(
                                  transform:
                                      Matrix4.translationValues(80, 0, 0),
                                  child: CircularProgressIndicator(
                                    color: Color.fromRGBO(100, 110, 91, 0.5),
                                  ),
                                )
                              : TextButton.icon(
                                  onPressed: () {
                                    _changeMeal();
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: Color.fromRGBO(100, 110, 91, 1),
                                  ),
                                  label: Text(
                                    'Change This Plan',
                                    style: TextStyle(
                                      color: Color.fromRGBO(100, 110, 91, 1),
                                    ),
                                  )),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            widget.dailyMeals.threeMeals[daySelector].mealName,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        _isLoading
                            ? Container(
                                margin: const EdgeInsets.only(bottom: 20.0),
                                child: CircularProgressIndicator(
                                  value: null,
                                  color: Color.fromRGBO(205, 214, 169, 100),
                                ),
                              )
                            : Container(
                                child: YoutubePlayer(
                                  controller: _videoController,
                                  showVideoProgressIndicator: true,
                                  progressIndicatorColor: Colors.greenAccent,
                                  onReady: () {
                                    _videoController.addListener(newListener);
                                  },
                                ),
                              )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Ingredients:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                        Text(
                          widget.dailyMeals.threeMeals[daySelector].ingredients,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(0, 0, 0, 0.7),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Directions:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                        Text(
                          formatInstruction(widget
                              .dailyMeals.threeMeals[daySelector].directions),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(0, 0, 0, 0.7),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
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
