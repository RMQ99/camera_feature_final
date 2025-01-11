import 'package:camera_app/core/theme/app_colors.dart';
import 'package:camera_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final Color backgroundColor;
  final Color? borderSideColor;
  final VoidCallback onPressed;
  final String text;
  final Widget? icon;
  final double? verticalPadding;
  final double? horizontalPadding;
  final bool isLoading;
  final TextStyle? textStyle;
  final bool flipChildren;
  final bool centerChildren;
  final bool isTransparent;
  final bool disabled;
  const CustomButton(
      {this.backgroundColor = AppColors.primary,
      this.borderSideColor,
      required this.onPressed,
      required this.text,
      this.verticalPadding,
      this.horizontalPadding,
      this.icon,
      this.isLoading = false,
      this.textStyle,
      this.flipChildren = false,
      this.centerChildren = false,
      this.isTransparent = false,
      this.disabled = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: ElevatedButton(
          onPressed: isLoading || disabled ? null : onPressed,
          style: ElevatedButton.styleFrom(
              elevation: isTransparent ? 0 : null,
              side: isTransparent
                  ? BorderSide(
                      width: 2.w, color: borderSideColor ?? Colors.white)
                  : null,
              backgroundColor:
                  isTransparent ? Colors.transparent : backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r), // <-- Radius
              ),
              // primary: backgroundColor,
              padding: EdgeInsets.symmetric(
                  vertical: verticalPadding ?? 14.h,
                  horizontal: horizontalPadding ?? 0)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: isLoading
                ? SizedBox(
                    height: 20.h,
                    width: 20.w,
                    child: CircularProgressIndicator(
                      color: backgroundColor,
                    ))
                : Row(
                    mainAxisAlignment: icon != null && !centerChildren
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: icon != null && flipChildren
                        ? [
                            icon ?? Container(),
                            icon != null && centerChildren
                                ? SizedBox(width: 10)
                                : Container(),
                            Text(
                              text,
                              style: textStyle ??
                                  CAStyles.boldTextStyle.merge(
                                    TextStyle(
                                        color: Colors.white, fontSize: 15.sp),
                                  ),
                            ),
                          ]
                        : [
                            Text(
                              text,
                              style: textStyle ??
                                  CAStyles.boldTextStyle.merge(
                                    TextStyle(
                                        color: isTransparent
                                            ? Colors.black
                                            : Colors.white,
                                        fontSize: 16.sp),
                                  ),
                            ),
                            icon ?? Container()
                          ],
                  ),
          ),
        ))
      ],
    );
  }
}
