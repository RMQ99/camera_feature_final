import 'package:camera_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDrawerItem extends StatelessWidget {
  final String title;
  final String? iconPath;
  final VoidCallback onTap;
  final bool selected;
  final bool isLoading;
  final IconData? icon;
  const CustomDrawerItem({
    required this.title,
    this.iconPath,
    required this.onTap,
    this.selected = false,
    this.isLoading = false,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 0,
      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
      selected: selected,
      leading: icon != null
          ? Icon(icon, color: AppColors.darkBlue, size: 19)
          : isLoading
              ? const SizedBox(
                  height: 15,
                  width: 15,
                  child: CircularProgressIndicator(color: AppColors.darkBlue))
              : SvgPicture.asset(
                  iconPath!,
                  height: 15,
                ),
      onTap: onTap,
    );
  }
}
