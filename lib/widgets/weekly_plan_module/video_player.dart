import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  YoutubePlayerController _videoController = YoutubePlayerController(
    initialVideoId: 'BSBEUcAyFyk',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );
  PlayerState _playerState = PlayerState.unknown;
  YoutubeMetaData _videoMetaData = const YoutubeMetaData();

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
    return Container(
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
