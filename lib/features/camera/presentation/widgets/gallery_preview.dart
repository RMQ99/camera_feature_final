import 'dart:io';

import 'package:flutter/material.dart';

class GalleryPreview extends StatelessWidget {
  final String? recentFilePath;

  const GalleryPreview({
    super.key,
    required this.recentFilePath,
  });

  @override
  Widget build(BuildContext context) {
    if (recentFilePath == null) {
      return Container(
        width: 100,
        height: 100,
        color: Colors.grey,
        child: Center(child: Text("No Media")),
      );
    }

    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        image: DecorationImage(
          image: FileImage(
            File(recentFilePath!),
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}