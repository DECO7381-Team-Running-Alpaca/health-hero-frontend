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
  var videoId = '';
  // var mealName = '';
  YoutubePlayerController _videoController;
  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });
    setState(() {
      _isLoading = false;
      _videoController = YoutubePlayerController(
        initialVideoId: 'vpwY3nmLLaA',
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );
      _playerState = PlayerState.unknown;
      _videoMetaData = const YoutubeMetaData();
    });
    // fetchYoutubeVideo('Apple').then((data) {
    //   setState(() {
    //     videoId = data;
    //     _isLoading = false;
    //     _videoController = YoutubePlayerController(
    //       initialVideoId: 'vpwY3nmLLaA',
    //       flags: YoutubePlayerFlags(
    //         autoPlay: false,
    //         mute: false,
    //       ),
    //     );
    //     _playerState = PlayerState.unknown;
    //     _videoMetaData = const YoutubeMetaData();
    //   });
    // });
  }

  void newListener() {
    setState(() {
      _playerState = _videoController.value.playerState;
      _videoMetaData = _videoController.metadata;
    });
  }

  // Future<void> _loadNewVideo(String mealName) async {
  //   setState(() {
  //     _isLoading = true;
  //   });

  //   await fetchYoutubeVideo(mealName).then((data) {
  //     setState(() {
  //       videoId = 'eBPsaa0_RtQ';
  //     });
  //   }).then((_) {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   });
  // }

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
                      });
                    },
                    buttonID: 0,
                  ),
                  BreakfastLunchDinnerSelector(
                    mealTime: 'lunch',
                    function: () async {
                      setState(() {
                        daySelector = 1;
                      });
                      // await _loadNewVideo('Apple').then((_) {});
                      if (_videoController.value.isPlaying) {
                        _videoController.pause();
                      }
                      _videoController.load('eBPsaa0_RtQ');
                      _videoController.pause();
                    },
                    buttonID: 1,
                  ),
                  BreakfastLunchDinnerSelector(
                    mealTime: 'dinner',
                    function: () {
                      setState(() {
                        daySelector = 2;
                        // _videoName =
                        //     widget.dailyMeals.threeMeals[daySelector].mealName;
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
