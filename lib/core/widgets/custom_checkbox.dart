import 'package:camera_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;
  final String title;
  final Color color;
  const CustomCheckbox(
      {required this.value,
      required this.onChanged,
      required this.title,
      this.color = AppColors.darkBlue,
      super.key});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: value,
      activeColor: AppColors.darkBlue,
      title: Text(title),
      onChanged: (value) {
        if (value != null) {
          onChanged(value);
        }
      },
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
