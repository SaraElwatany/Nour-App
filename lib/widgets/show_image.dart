import 'dart:typed_data';
import 'package:flutter/material.dart';

Future<void> showImage(BuildContext context, Uint8List image) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.memory(
                image,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      );
    },
  );
}
