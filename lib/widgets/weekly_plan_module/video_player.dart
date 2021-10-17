import 'package:flutter/material.dart';
import 'package:health_hero/utils/services/rest_api_service.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  final String videoURL;
  VideoPlayer({this.videoURL});
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  var _isLoading = false;
  var _isInit = true;
  var videoId = '';
  YoutubePlayerController _videoController;
  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;

  // @override
  // void didChangeDependencies() {
  // if (_isInit) {
  // setState(() {
  //   _isLoading = true;
  // });
  // fetchYoutubeVideo(widget.videoURL).then((data) {
  //   setState(() {
  //     _isLoading = false;
  //     videoId = data;
  //     _videoController = YoutubePlayerController(
  //       initialVideoId: videoId,
  //       // initialVideoId: widget.videoURL,
  //       flags: YoutubePlayerFlags(
  //         autoPlay: false,
  //         mute: false,
  //       ),
  //     );
  //     _playerState = PlayerState.unknown;
  //     _videoMetaData = const YoutubeMetaData();
  //   });
  // });
  // }

  // _isInit = false;
  // super.didChangeDependencies();
  // }

  @override
  void initState() {
    super.initState();
    runYoutube(widget.videoURL);
    _playerState = PlayerState.unknown;
    _videoMetaData = const YoutubeMetaData();
  }

  // YoutubePlayerController _videoController;
  void runYoutube(String url) {
    _videoController = YoutubePlayerController(
      initialVideoId: url,
      // initialVideoId: widget.videoURL,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  void newListener() {
    setState(() {
      _playerState = _videoController.value.playerState;
      _videoMetaData = _videoController.metadata;
    });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
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
          );
  }
}
