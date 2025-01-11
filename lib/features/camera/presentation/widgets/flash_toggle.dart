import 'package:flutter/material.dart';

class FlashToggle extends StatelessWidget {
  final String currentFlashMode;
  final VoidCallback onToggleFlash;

  const FlashToggle({
    super.key,
    required this.currentFlashMode,
    required this.onToggleFlash,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Flash: $currentFlashMode"),
        IconButton(
          icon: Icon(Icons.flash_on),
          onPressed: onToggleFlash,
          tooltip: "Toggle Flash",
        ),
      ],
    );
  }
}