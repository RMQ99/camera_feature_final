import 'package:camera_app/core/theme/app_colors.dart';
import 'package:camera_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final String label;
  final Function(String value) onSelected;
  final String? currentValue;
  const CustomDropdown(
      {required this.items,
      required this.label,
      required this.onSelected,
      this.currentValue,
      super.key});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  void initState() {
    super.initState();
    _currentValue = widget.currentValue;
  }

  String? _currentValue;

  @override
  Widget build(BuildContext context) {
    _currentValue ??= widget.items[0];
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.darkBlue, width: 1),
            borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.label,
                style: CAStyles.boldTextStyle
                    .merge(TextStyle(color: AppColors.darkGray))),
            DropdownButtonFormField(
              isDense: false,
              value: _currentValue,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _currentValue = value;
                  });
                  widget.onSelected(value);
                }
              },
              decoration: const InputDecoration(
                  border: InputBorder.none, isCollapsed: true),
              icon: const RotatedBox(
                quarterTurns: -1,
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black,
                ),
              ),
              style: CAStyles.boldTextStyle.merge(const TextStyle(
                  color: AppColors.black,
                  fontFamily: 'SST-Arabic',
                  fontSize: 16)),
              items: widget.items
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                        ),
                      ))
                  .toList(),
            ),
          ],
        ));
  }
}
