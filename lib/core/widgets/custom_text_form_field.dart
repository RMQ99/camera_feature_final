import 'package:camera_app/core/theme/app_colors.dart';
import 'package:camera_app/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  final String? label;
  final bool obsecureText;
  final FormFieldValidator? validate;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final int? maxLength;
  final bool enabled;
  final String? errorText;
  // final TextStyle errorTextStyle;
  final TextStyle? hintTextStyle;
  final Widget? prefix;
  final Widget? suffix;
  final int? maxLines;
  final VoidCallback? onTap;
  final bool isDateTime;
  final bool isPassword;
  final bool readOnly;
  final Function(DateTime)? onChangeDateTime;
  final Function(String)? onChange;
  final DateTime? initialDateTime;
  final TextAlign? textAlign;
  final List<TextInputFormatter> inputFormatters;
  final String? hintText;
  final TextFieldSize size;
  final bool divider;
  final Color filledColor;
  final Color color;
  final Color? shadowColor;
  final bool? radius;
  final Color? dividerColor;
  final Color? textColor;
  final EdgeInsetsGeometry? contentPadding;
  final bool autofocus;
  final int? minLines;
  final bool? isMultiLines;
  final bool suffixWithoutPadding;
  final VoidCallback? onEditingComplete;
  final FocusNode? focusNode;
  final TextCapitalization? textCapitalization;
  final void Function(String)? onFieldSubmitted;
  final bool isUnderLineBorder;
  const CustomTextFormField(
      {this.label,
      this.obsecureText = false,
      this.validate,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.maxLength,
      this.enabled = true,
      this.errorText,
      // this.errorTextStyle = const TextStyle(fontSize: 15.0, color: Colors.red),
      this.hintTextStyle,
      this.prefix,
      this.suffix,
      this.maxLines,
      this.onTap,
      this.isDateTime = false,
      this.isPassword = false,
      this.readOnly = false,
      this.isUnderLineBorder = false,
      this.onChangeDateTime,
      this.onChange,
      this.initialDateTime,
      this.textAlign,
      this.inputFormatters = const [],
      this.hintText,
      this.size = TextFieldSize.medium,
      this.divider = false,
      this.filledColor = Colors.white,
      this.color = AppColors.blue,
      this.shadowColor,
      this.radius = false,
      this.dividerColor,
      this.textColor = Colors.black,
      this.contentPadding,
      this.autofocus = false,
      this.minLines,
      this.isMultiLines,
      this.suffixWithoutPadding = false,
      this.onEditingComplete,
      this.focusNode,
      this.onFieldSubmitted,
      this.textCapitalization,
      super.key});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  void initState() {
    super.initState();
    _errorText = widget.errorText;
  }

  bool isShowPassword = false;

  String? _errorText;
  bool isFocused = false;
  @override
  Widget build(BuildContext context) {
    TextAlign localeTextAlign =
        Localizations.localeOf(context).languageCode == "en"
            ? TextAlign.left
            : TextAlign.right;
    TextAlign textAlign = widget.textAlign ?? localeTextAlign;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: widget.filledColor,
              border: Border.all(
                  color: widget.isUnderLineBorder
                      ? Colors.transparent
                      : widget.enabled
                          ? widget.color
                          : Colors.grey,
                  width: 1.5.w),
              borderRadius:
                  widget.radius == true ? BorderRadius.circular(12.r) : null,
              boxShadow: isFocused
                  ? [
                      BoxShadow(
                        color: widget.isUnderLineBorder
                            ? Colors.transparent
                            : widget.shadowColor != null
                                ? widget.shadowColor!
                                : AppColors.blue,
                        blurRadius: 2,
                        offset: Offset(0.2, 0.2),
                      ),
                    ]
                  : null),
          padding: widget.suffixWithoutPadding
              ? EdgeInsetsDirectional.symmetric(
                  horizontal: _getDiminisionsBySize(0).w,
                  vertical: _getDiminisionsBySize(0).h)
              : EdgeInsetsDirectional.symmetric(
                  horizontal: _getDiminisionsBySize(10).w,
                ),
          child: Directionality(
            textDirection: textAlign == TextAlign.right
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: Focus(
              onFocusChange: (value) {
                setState(() {
                  isFocused = !isFocused;
                });
              },
              child: TextFormField(
                onEditingComplete: widget.onEditingComplete,
                autofocus: widget.autofocus,
                focusNode: widget.focusNode,
                textCapitalization:
                    widget.textCapitalization ?? TextCapitalization.none,
                onFieldSubmitted: widget.onFieldSubmitted,
                style: TextStyle(
                    color:
                        widget.enabled == true ? widget.textColor : Colors.grey,
                    fontSize: _getDiminisionsBySize(14).sp),
                controller: widget.controller,
                enabled: !widget.isDateTime && widget.enabled,
                maxLines: widget.maxLines ?? 1,
                minLines: widget.minLines ?? 1,
                readOnly: widget.readOnly,
                textAlign: textAlign,
                onTap: widget.onTap ??
                    (widget.isDateTime
                        ? () async {
                            DateTime? dateTime = await showDatePicker(
                                context: context,
                                initialDate:
                                    widget.initialDateTime ?? DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2040));
                            if (dateTime != null) {
                              if (widget.onChangeDateTime != null) {
                                widget.onChangeDateTime!(dateTime);
                              }
                            }
                          }
                        : null),
                validator: (value) {
                  if (widget.validate != null) {
                    String? validateMessage = widget.validate!(value);
                    setState(() {
                      _errorText = validateMessage;
                    });
                    return validateMessage;
                  } else {
                    return null;
                  }
                },
                cursorColor: widget.color,
                obscureText:
                    isShowPassword ? !widget.obsecureText : widget.obsecureText,
                maxLength: widget.maxLength,
                onChanged: (txt) {
                  if (txt.isNotEmpty) {
                    setState(() {
                      _errorText = null;
                    });
                  }
                  if (widget.onChange != null) {
                    widget.onChange!(txt);
                  }
                },
                keyboardType: widget.keyboardType,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    filled: false,
                    prefixIcon: widget.divider
                        ? Padding(
                            padding:
                                // Localizations.localeOf(context).languageCode ==
                                //         'en'
                                //     ? EdgeInsets.only(right: 10.w)
                                // :
                                EdgeInsets.zero,
                            child: Container(
                                // margin: Localizations.localeOf(context)
                                //             .languageCode ==
                                //         'en'
                                //     ? EdgeInsets.only(left: 10.w)
                                //     : EdgeInsets.only(right: 10.w),
                                // padding: EdgeInsets.only(right: 8.w),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color: widget.dividerColor ??
                                                widget.color,
                                            width: 3.5.w))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [widget.prefix ?? Container()],
                                )),
                          )
                        : widget.prefix,
                    isDense: true,
                    contentPadding: widget.contentPadding ??
                        EdgeInsets.symmetric(
                          vertical: _getDiminisionsBySize(5).h,
                        ),
                    label: Padding(
                      padding: EdgeInsets.symmetric(
                          // horizontal: _getDiminisionsBySize(10).w,
                          ),
                      child: widget.label != null
                          ? Directionality(
                              textDirection: localeTextAlign == TextAlign.right
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(widget.label!,
                                          style: TextStyle(
                                            color: widget.color,
                                            fontSize: 14.sp,
                                          )),
                                      widget.isMultiLines == true
                                          ? SizedBox(
                                              height: 100.h,
                                            )
                                          : SizedBox(
                                              height: 0.h,
                                            )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : null,
                    ),
                    border: widget.isUnderLineBorder
                        ? UnderlineInputBorder()
                        : InputBorder.none,
                    errorStyle: const TextStyle(height: -1, fontSize: 0),
                    errorMaxLines: 1,
                    counterText: "",
                    hintText: widget.hintText,
                    hintStyle: widget.hintTextStyle,
                    suffixIcon: widget.isDateTime
                        ? GestureDetector(
                            onTap: widget.onTap != null
                                ? (() async {
                                    DateTime? dateTime = await showDatePicker(
                                        context: context,
                                        initialDate: widget.initialDateTime ??
                                            DateTime.now(),
                                        firstDate: DateTime(1930),
                                        lastDate: DateTime(2040));
                                    if (dateTime != null) {
                                      if (widget.onChangeDateTime != null) {
                                        widget.onChangeDateTime!(dateTime);
                                      }
                                    }
                                  })
                                : null,
                            child: const Icon(Icons.calendar_today_rounded))
                        : widget.isPassword
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    isShowPassword = !isShowPassword;
                                  });
                                },
                                icon: Icon(
                                  isShowPassword
                                      ? Icons.visibility_sharp
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                  size: _getDiminisionsBySize(20).sp,
                                ))
                            : widget.suffix),
                inputFormatters: widget.inputFormatters,
              ),
            ),
          ),
        ),
        _errorText != null
            ? Container(
                padding: EdgeInsets.only(
                    right: _getDiminisionsBySize(20).w,
                    left: _getDiminisionsBySize(20).w,
                    top: _getDiminisionsBySize(10).h),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.error_outline_rounded,
                        size: _getDiminisionsBySize(20).sp, color: Colors.red),
                    SizedBox(
                      width: _getDiminisionsBySize(5).w,
                    ),
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: _getDiminisionsBySize(5).w,
                              right: _getDiminisionsBySize(5).w),
                          child: Text(_errorText!,
                              style: CAStyles.boldTextStyle.merge(TextStyle(
                                  color: Colors.red, fontSize: 12.sp)))),
                    )
                  ],
                ))
            : Container(),
      ],
    );
  }

  double _getDiminisionsBySize(double basic) {
    return basic *
        (widget.size == TextFieldSize.small
            ? 0.8
            : widget.size == TextFieldSize.medium
                ? 1
                : 1.2);
  }
}

class CustomBirthDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue prevText, TextEditingValue currText) {
    int selectionIndex;

    // Get the previous and current input strings
    String pText = prevText.text;
    String cText = currText.text;
    // Abbreviate lengths
    int cLen = cText.length;
    int pLen = pText.length;

    if (cLen == 1) {
      // Can only be 0, 1, 2 or 3
      if (int.parse(cText) > 3) {
        // Remove char
        cText = '';
      }
    } else if (cLen == 2 && pLen == 1) {
      // Days cannot be greater than 31
      int dd = int.parse(cText.substring(0, 2));
      if (dd == 0 || dd > 31) {
        // Remove char
        cText = cText.substring(0, 1);
      } else {
        // Add a / char
        cText += '/';
      }
    } else if (cLen == 4) {
      // Can only be 0 or 1
      if (int.parse(cText.substring(3, 4)) > 1) {
        // Remove char
        cText = cText.substring(0, 3);
      }
    } else if (cLen == 5 && pLen == 4) {
      // Month cannot be greater than 12
      int mm = int.parse(cText.substring(3, 5));
      if (mm == 0 || mm > 12) {
        // Remove char
        cText = cText.substring(0, 4);
      } else {
        // Add a / char
        cText += '/';
      }
    } else if ((cLen == 3 && pLen == 4) || (cLen == 6 && pLen == 7)) {
      // Remove / char
      cText = cText.substring(0, cText.length - 1);
    } else if (cLen == 3 && pLen == 2) {
      if (int.parse(cText.substring(2, 3)) > 1) {
        // Replace char
        cText = cText.substring(0, 2) + '/';
      } else {
        // Insert / char
        cText =
            cText.substring(0, pLen) + '/' + cText.substring(pLen, pLen + 1);
      }
    } else if (cLen == 6 && pLen == 5) {
      // Can only be 1 or 2 - if so insert a / char
      int y1 = int.parse(cText.substring(5, 6));
      if (y1 < 1 || y1 > 2) {
        // Replace char
        cText = cText.substring(0, 5) + '/';
      } else {
        // Insert / char
        cText = cText.substring(0, 5) + '/' + cText.substring(5, 6);
      }
    } else if (cLen == 7) {
      // Can only be 1 or 2
      int y1 = int.parse(cText.substring(6, 7));
      if (y1 < 1 || y1 > 2) {
        // Remove char
        cText = cText.substring(0, 6);
      }
    } else if (cLen == 8) {
      // Can only be 19 or 20
      int y2 = int.parse(cText.substring(6, 8));
      if (y2 < 19 || y2 > 20) {
        // Remove char
        cText = cText.substring(0, 7);
      }
    }

    selectionIndex = cText.length;
    return TextEditingValue(
      text: cText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}

enum TextFieldSize {
  small,
  medium,
  large,
}
