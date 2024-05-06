import 'package:flutter/material.dart';
import 'package:nour_app/data/upload_items.dart';
import 'package:nour_app/generated/l10n.dart';

class UploadItems {
  static List<UploadItem> uploadItems(BuildContext context) => [
        image(context),
        video(context),
        audio(context),
      ];

  static UploadItem image(BuildContext context) => UploadItem(
        text: S.of(context).image,
        icon: Icons.image,
      );

  static UploadItem video(BuildContext context) => UploadItem(
        text: S.of(context).video,
        icon: Icons.video_camera_front,
      );

  static UploadItem audio(BuildContext context) => UploadItem(
        text: S.of(context).audio,
        icon: Icons.audio_file,
      );
}
