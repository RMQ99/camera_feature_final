import 'package:flutter/material.dart';

class CameraControls extends StatelessWidget {
  final VoidCallback onCapturePhoto;
  final VoidCallback onStartRecording;
  final VoidCallback onStopRecording;

  const CameraControls({
    super.key,
    required this.onCapturePhoto,
    required this.onStartRecording,
    required this.onStopRecording,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.camera_alt),
          onPressed: onCapturePhoto,
          tooltip: "Capture Photo",
        ),
        IconButton(
          icon: Icon(Icons.videocam),
          onPressed: onStartRecording,
          tooltip: "Start Recording",
        ),
        IconButton(
          icon: Icon(Icons.stop),
          onPressed: onStopRecording,
          tooltip: "Stop Recording",
        ),
      ],
    );
  }
}