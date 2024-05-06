
import 'package:file_picker/file_picker.dart';

// Function to pick audio files
Future<String?> pickAudioFile() async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
      allowMultiple: false,
    );
    if (result != null) {
      return result.files.single.path!;
    }
  } catch (e) {
    print("Error picking audio file: $e");
  }
  return null;
}


String formatTime(Duration duration){
  String twoDigits (int n) =>n.toString().padLeft(2,"0");
  final hours=twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));

  return[
    if (duration.inHours>0) hours,
    minutes,
    seconds,
  ].join(":");


  
}
