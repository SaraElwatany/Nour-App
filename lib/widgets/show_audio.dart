import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:nour_app/widgets/audio_picker.dart';

class ShowAudio extends StatefulWidget {
  final String audioPath;
final String fileName;
  const ShowAudio({Key? key, required this.audioPath, required this.fileName}) : super(key: key);

  @override
  _ShowAudioState createState() => _ShowAudioState();
}

class _ShowAudioState extends State<ShowAudio> {
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    _audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration ?? Duration.zero;
      });
    });

    _audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition ?? Duration.zero;
      });
    });

    _playAudio();
  }

  Future<void> _playAudio() async {
    await _audioPlayer.play(UrlSource((widget.audioPath)));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).colorScheme.surface,
            width: 6,
          ),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Container(
          width: 400,
          height: 500,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Icon(
                Icons.music_note,
                size: 120,
                color: Theme.of(context).colorScheme.surface,
              ),
             const SizedBox(height: 40,),
              Text(widget.fileName,
              style:  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.surface,
                    ),
              ),
              
              const SizedBox(height: 40,),
            Slider(
              activeColor: Colors.red,
              inactiveColor: Colors.black12,
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (value) async {
                final position = Duration(seconds: value.toInt());
                _audioPlayer.seek(position);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formatTime(position),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                Text(formatTime(duration - position),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 IconButton(
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 70,
                    ),
                    onPressed: () async {
                      if (isPlaying) {
                        await _audioPlayer.pause();
                      } else {
                        await _audioPlayer.resume();
                      }
                       setState(() {
                      isPlaying = !isPlaying; // Toggle the play/pause state
                    });
                      },
                  ),
                
              ],
            ),
          ],
        ),
      ),
      ),
    );
  }
}

