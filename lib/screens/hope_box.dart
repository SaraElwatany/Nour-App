import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nour_app/generated/l10n.dart';
import 'package:nour_app/data/upload_items.dart';
import 'package:nour_app/data/upload_data.dart';
import 'package:nour_app/widgets/audio_picker.dart';
import 'package:nour_app/widgets/basic_overlay_widget.dart';
import 'package:nour_app/widgets/image_picker.dart';
import 'package:nour_app/widgets/localization_icon.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:nour_app/widgets/show_audio.dart';
import 'package:nour_app/widgets/show_image.dart';
import 'package:nour_app/widgets/show_video.dart';
import 'package:nour_app/widgets/video_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:audioplayers/audioplayers.dart';


class HopeBox extends StatefulWidget {
  const HopeBox({Key? key}) : super(key: key);

  @override
  State<HopeBox> createState() => _HopeBoxState();
}

class _HopeBoxState extends State<HopeBox> {
  String? _videoURL;
  VideoPlayerController? _controller;
  List<Uint8List> _images = []; 
  List<String> _videos = [];
  List<String> _audios = [];
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
List<Uint8List?> _videoThumbnails = [];


  @override
  void dispose() {
    _controller?.dispose();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

void _pickVideo() async {
  String? videoPath = await pickVideo();
  if (videoPath != null) {
    print("Picked video path: $videoPath");
    _videos.add(videoPath);
    _initializeVideoPlayer(videoPath);
  }
}


void _initializeVideoPlayer(String videoPath) async {
  try {
    _controller = VideoPlayerController.file(
      File(videoPath),
    );

    // Initialize the controller and load the video
    await _controller!.initialize();

    // Generate thumbnail
    final uint8list = await VideoThumbnail.thumbnailData(
      video: videoPath,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 720, 
      maxHeight: 1280,  
      quality: 25,
    );

    print("Thumbnail data: $uint8list");

    setState(() {
      _videoThumbnails.add(uint8list); 
    });
  } catch (e) {
    print("Error generating thumbnail: $e");
  }
}
  Widget _videoPreviewWidget() {
    if (_controller != null) {
      return AspectRatio(
        aspectRatio: _controller!.value.aspectRatio,
        child: VideoPlayer(_controller!),
      );
    } else {
      return const CircularProgressIndicator();
    }
  }

  void _selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _images.add(img); 
    });
  }

void _pickAudio() async {
  try {
    String? filePath = await pickAudioFile();
    if (filePath != null) {
      setState(() {
        _audios.add(filePath);
      });
 
    }
  } catch (e) {
    print("Error picking audio: $e");
  }
}

  Future<void> _playAudio(String filePath) async {
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    await audioPlayer.play(UrlSource(filePath));
    print('Audio playback started');
  }


void _showAudioPlayerDialog(String audioPath) {
  String fileName = audioPath.split('/').last; // Extracting the file name from the file path
  showDialog(
    context: context,
    builder: (context) => ShowAudio(audioPath: audioPath, fileName: fileName),
  );
}

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LocalizationIcon(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      S.of(context).hope_box,
                      style: const TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<UploadItem>(
                        icon: Icon(
                          Icons.upload_file,
                          size: 46,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                        items: [
                          ...UploadItems.uploadItems(context).map(
                            (item) => DropdownMenuItem<UploadItem>(
                              value: item,
                              child: Row(
                                children: [
                                  Icon(
                                    item.icon,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    item.text,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            final itemText = value.text;
                            if (itemText == S.of(context).image || itemText == 'Image') {
                              _selectImage();
                            } else if (itemText == S.of(context).video || itemText == 'Video') {
                              _pickVideo();
                            } else if (itemText == S.of(context).audio || itemText == 'Audio') {
                              _pickAudio();
                            }
                          }
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    // Display all images in the list
                    ..._images.map((image) {
                      return Container(
                        width: 250,
                        height: 250,
                        child: InkWell(
                          onTap: () {
                            // Add action when image is tapped
                            showImage(context,image);
                          },
                          child: Image.memory(
                            image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }).toList(),
                    ..._videos.asMap().entries.map((entry) {
                    final int index = entry.key;
                    final String video = entry.value;
                    return Container(
                      width: 250,
                      height: 250,
                      child: InkWell(
                        onTap: () {
                          // Show the video when tapped
                          showDialog(
                            context: context,
                            builder: (_) => ShowVideo(videoPath: video),
                          );
                        },
                        child: Container(
                          width: 250,
                          height: 250,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          child: _videoThumbnails.length > index && _videoThumbnails[index] != null
                              ? Image.memory(
                                  _videoThumbnails[index]!,
                                  fit: BoxFit.cover,
                                )
                              : const Icon(Icons.video_library, size: 120, color: Colors.grey),
                        ),
                      ),
                    );
                  }).toList(),
                                      ..._audios.map((audio) {
                    String fileName = audio.split('/').last; // Extracting the file name from the file path
                    return Container(
                      width: 250,
                      height: 250,
                      child: InkWell(
                        onTap: () {
                          // Add action when audio is tapped
                          _showAudioPlayerDialog(audio);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.surface,
                              width: 6,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.music_note,
                                size: 120,
                                color: Theme.of(context).colorScheme.surface,
                              ), // Placeholder icon for audio
                              SizedBox(height: 8), // Adding space between icon and file name
                              Text(
                                fileName,
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.surface,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),

                  ],
                ),
                _videoURL != null
                    ? Stack(children: [
                        _videoPreviewWidget(),
                        if (_controller != null)
                          Positioned.fill(
                              child: BasicOverlayWidget(controller: _controller!))
                      ])
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
