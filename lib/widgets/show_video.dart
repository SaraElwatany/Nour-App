import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:nour_app/widgets/basic_overlay_widget.dart';

class ShowVideo extends StatefulWidget {
  final String videoPath;

  const ShowVideo({required this.videoPath});

  @override
  _ShowVideoState createState() => _ShowVideoState();
}

class _ShowVideoState extends State<ShowVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(
      File(widget.videoPath),
    )..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        // width: double.infinity,
        // height: double.infinity,
        child: _controller.value.isInitialized
            ? Stack(
                children: [
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                  Positioned.fill(
                    child: BasicOverlayWidget(controller: _controller),
                  ),
                ],
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
