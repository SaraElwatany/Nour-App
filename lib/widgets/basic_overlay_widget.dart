import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BasicOverlayWidget extends StatefulWidget {
  final VideoPlayerController controller;

  const BasicOverlayWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _BasicOverlayWidgetState createState() => _BasicOverlayWidgetState();
}

class _BasicOverlayWidgetState extends State<BasicOverlayWidget> {
  late bool isPlaying;
  bool isShowingIcon = false; // Initially set to false
  double sliderValue = 0.0;

  @override
  void initState() {
    super.initState();
    isPlaying = widget.controller.value.isPlaying;
    widget.controller.addListener(_updatePlayingState);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updatePlayingState);
    super.dispose();
  }

  void _updatePlayingState() {
    if (isPlaying != widget.controller.value.isPlaying) {
      setState(() {
        isPlaying = widget.controller.value.isPlaying;
        isShowingIcon = true; // Show the icon when the play/pause state changes
      });
      _hideIconAfterDelay();
    }
    setState(() {
      sliderValue = widget.controller.value.position.inSeconds.toDouble();
    });
  }

  void _hideIconAfterDelay() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isShowingIcon = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _handlePlayPause(),
      child: Stack(
        children: <Widget>[
          if (isShowingIcon) buildPlayPauseIcon(),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Slider(
              activeColor: Colors.red,
              inactiveColor: Colors.black12,
              min: 0,
              max: widget.controller.value.duration.inSeconds.toDouble(),
              value: sliderValue,
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                });
              },
              onChangeEnd: (value) {
                widget.controller.seekTo(Duration(seconds: value.toInt()));
              },
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: IconButton(
              icon: const Icon(Icons.fast_rewind, size: 30,),
              onPressed: () => _rewindVideo(),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.fast_forward, size: 30,),
              onPressed: () => _fastForwardVideo(),
            ),
          ),
        ],
      ),
    );
  }

  void _handlePlayPause() {
    if (widget.controller.value.isPlaying) {
      widget.controller.pause();
    } else {
      widget.controller.play();
    }
  }

  Widget buildPlayPauseIcon() {
    return Container(
      alignment: Alignment.center,
      color: Colors.black26,
      child: Icon(
        isPlaying ? Icons.pause : Icons.play_arrow,
        color: Colors.white,
        size: 80,
      ),
    );
  }

  void _rewindVideo() {
    widget.controller.seekTo(Duration(seconds: widget.controller.value.position.inSeconds - 5));
  }

  void _fastForwardVideo() {
    widget.controller.seekTo(Duration(seconds: widget.controller.value.position.inSeconds + 5));
  }
}
