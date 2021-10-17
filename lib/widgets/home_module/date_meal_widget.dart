import 'package:flutter/material.dart';
import 'package:health_hero/models/meal.dart';
import 'package:health_hero/provider/meals.dart';
import 'package:health_hero/utils/services/rest_api_service.dart';
import 'package:health_hero/widgets/weekly_plan_module/breakfast_lunch_dinner_selector.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../widgets/weekly_plan_module/video_player.dart';

class DateMealWidget extends StatefulWidget {
  // Change this to recieve the daily meal list (length = 3)
  // final Meal everyDayMeal;
  final DailyMeals dailyMeals;

  const DateMealWidget({Key key, this.dailyMeals}) : super(key: key);

  @override
  State<DateMealWidget> createState() => _DateMealWidgetState();
}

int daySelector = 0;

class _DateMealWidgetState extends State<DateMealWidget> {
  var _isLoading = false;
  var _isRefreshing = false;
  var _isInit = true;
  var videoId = '';
  // YoutubePlayerController _videoController;
  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;
  // var _videoName = '';
  YoutubePlayerController _videoControllerA;
  YoutubePlayerController _videoControllerB;
  YoutubePlayerController _videoControllerC;
  var _flag;
  Widget mealVideo;

  @override
  void initState() {
    super.initState();
    _flag = 0;
    runYoutube('vpwY3nmLLaA');
    _playerState = PlayerState.unknown;
    _videoMetaData = const YoutubeMetaData();
    mealVideo = Container(
      child: YoutubePlayer(
        controller: _videoControllerA,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.greenAccent,
        onReady: () {
          _videoControllerA.addListener(newListenerA);
        },
      ),
    );
  }

  void runYoutube(String url) {
    _videoControllerA = YoutubePlayerController(
      initialVideoId: 'vpwY3nmLLaA',
      // initialVideoId: widget.videoURL,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    _videoControllerB = YoutubePlayerController(
      initialVideoId: 'B5pKw6flFZE',
      // initialVideoId: widget.videoURL,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    _videoControllerC = YoutubePlayerController(
      initialVideoId: 'pqr7EmlUyQ4',
      // initialVideoId: widget.videoURL,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  void newListenerA() {
    setState(() {
      _playerState = _videoControllerA.value.playerState;
      _videoMetaData = _videoControllerA.metadata;
    });
  }

  void newListenerB() {
    setState(() {
      _playerState = _videoControllerB.value.playerState;
      _videoMetaData = _videoControllerB.metadata;
    });
  }

  void newListenerC() {
    setState(() {
      _playerState = _videoControllerC.value.playerState;
      _videoMetaData = _videoControllerC.metadata;
    });
  }

  @override
  void dispose() {
    _videoControllerA.dispose();
    _videoControllerB.dispose();
    _videoControllerC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                Text(
                    '${(int.parse(widget.dailyMeals.threeMeals[0].calories) + int.parse(widget.dailyMeals.threeMeals[1].calories) + int.parse(widget.dailyMeals.threeMeals[2].calories)).toString()}KCAL',
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
                        // _videoName =
                        //     widget.dailyMeals.threeMeals[daySelector].mealName;
                        mealVideo = Container(
                          child: YoutubePlayer(
                            controller: _videoControllerA,
                            showVideoProgressIndicator: true,
                            progressIndicatorColor: Colors.greenAccent,
                            onReady: () {
                              _videoControllerA.addListener(newListenerA);
                            },
                          ),
                        );
                        _flag = 0;
                      });
                    },
                    buttonID: 0,
                  ),
                  BreakfastLunchDinnerSelector(
                    mealTime: 'lunch',
                    function: () {
                      setState(() {
                        daySelector = 1;
                        if (_videoControllerA.value.isPlaying) {
                          _videoControllerA.pause();
                        }
                        _videoControllerA.load('B5pKw6flFZE');
                        // _videoName =
                        //     widget.dailyMeals.threeMeals[daySelector].mealName;

                        // mealVideo = Container(
                        //   child: YoutubePlayer(
                        //     controller: _videoControllerB,
                        //     showVideoProgressIndicator: true,
                        //     progressIndicatorColor: Colors.greenAccent,
                        //     onReady: () {
                        //       _videoControllerB.addListener(newListenerB);
                        //     },
                        //   ),
                        // );
                        _flag = 1;
                      });
                    },
                    buttonID: 1,
                  ),
                  BreakfastLunchDinnerSelector(
                    mealTime: 'dinner',
                    function: () {
                      setState(() {
                        daySelector = 2;
                        mealVideo = Container(
                          child: YoutubePlayer(
                            controller: _videoControllerC,
                            showVideoProgressIndicator: true,
                            progressIndicatorColor: Colors.greenAccent,
                            onReady: () {
                              _videoControllerC.addListener(newListenerC);
                            },
                          ),
                        );
                        // _videoName =
                        //     widget.dailyMeals.threeMeals[daySelector].mealName;
                        // _flag = 2;
                        // _videoController.load('B5pKw6flFZE');
                      });
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
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            widget.dailyMeals.threeMeals[daySelector].mealName,
                            style: TextStyle(
                              color: Color.fromRGBO(99, 91, 90, 1),
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        // _flag == 0 ? _videoPlayerA : (_flag == 1 ? _videoPlayerB : _videoPlayerC),
                        _isLoading
                            ? Container(
                                margin: const EdgeInsets.only(bottom: 20.0),
                                child: CircularProgressIndicator(
                                  value: null,
                                  color: Color.fromRGBO(205, 214, 169, 100),
                                ),
                              )
                            : mealVideo
                        // Container(
                        //     child: YoutubePlayer(
                        //       controller: _videoController,
                        //       showVideoProgressIndicator: true,
                        //       progressIndicatorColor: Colors.greenAccent,
                        //       onReady: () {
                        //         _videoController.addListener(newListener);
                        //       },
                        //     ),
                        //   )
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
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(99, 91, 90, 1),
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
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(99, 91, 90, 1),
                          ),
                        ),
                        Text(
                          widget.dailyMeals.threeMeals[daySelector].directions,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(0, 0, 0, 0.7),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        // TextButton(
                        //   style: ButtonStyle(
                        //     foregroundColor:
                        //         MaterialStateProperty.all<Color>(Colors.green),
                        //   ),
                        //   onPressed: () {
                        //     // Sunday Lunch details
                        //     print(
                        //       Provider.of<Meals>(context, listen: false)
                        //           .weeklyMeals[0]
                        //           .threeMeals[0],
                        //     );

                        //     // The id (example is Sunday) u need for switch around days
                        //     // (one element array)
                        //     print(
                        //       Provider.of<Meals>(context, listen: false)
                        //           .weeklyMeals[0]
                        //           .dateId,
                        //     );
                        //   },
                        //   child: Text('Get Meals'),
                        // )
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
