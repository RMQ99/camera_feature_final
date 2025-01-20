import 'package:camera_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDateField extends StatefulWidget {
  final String? label;
  final bool obsecureText;
  final FormFieldValidator? validate;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final int? maxLength;
  final bool enabled;
  final String? errorText;
  final TextStyle errorTextStyle;
  final Widget? prefix;
  final int? maxLines;
  final VoidCallback? onTap;
  final bool isDateTime;
  final bool readOnly;
  final Function(DateTime) onChangeDate;
  final Function(String?)? onChange;
  final DateTime date;
  final TextAlign? textAlign;
  final double? radius;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final int? days;
  final Color color;
  const CustomDateField(
      {this.label,
      this.obsecureText = false,
      this.validate,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.maxLength,
      this.enabled = true,
      this.errorText,
      this.errorTextStyle = const TextStyle(fontSize: 16.0, color: Colors.grey),
      this.prefix,
      this.maxLines,
      this.onTap,
      this.isDateTime = true,
      this.readOnly = false,
      required this.onChangeDate,
      required this.date,
      this.textAlign,
      this.radius,
      this.firstDate,
      this.lastDate,
      this.days,
      this.onChange,
      this.color = AppColors.primary,
      super.key});

  @override
  State<CustomDateField> createState() => _CustomDateFieldState();
}

class _CustomDateFieldState extends State<CustomDateField> {
  @override
  void initState() {
    super.initState();
    _errorText = widget.errorText;
  }

  String? _errorText;
  @override
  Widget build(BuildContext context) {
    TextAlign localeTextAlign =
        Localizations.localeOf(context).languageCode == "en"
            ? TextAlign.left
            : TextAlign.right;
    TextAlign textAlign = widget.textAlign ?? localeTextAlign;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: widget.enabled ? widget.color : Colors.grey,
                        width: 1.5.w),
                    // ignore: unrelated_type_equality_checks
                    borderRadius: widget.radius == true
                        ? BorderRadius.circular(12.r)
                        : null,
                  ),
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 10.w,
                  ),
                  child: Directionality(
                    textDirection: textAlign == TextAlign.right
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    child: TextFormField(
                      autofocus: false,
                      style: TextStyle(
                          color: widget.enabled == true ? null : Colors.grey,
                          fontSize: 14.sp),
                      controller: widget.controller,
                      enabled: !widget.isDateTime || widget.enabled,
                      maxLines: widget.maxLines ?? 1,
                      readOnly: widget.readOnly,
                      textAlign: textAlign,
                      onTap: widget.isDateTime
                          ? () async {
                              DateTime? dateTime = await showDatePicker(
                                context: context,
                                initialDate: widget.date,
                                firstDate: widget.firstDate ??
                                    DateTime.now().subtract(
                                        Duration(days: widget.days ?? 100)),
                                lastDate: widget.lastDate ??
                                    DateTime.now().add(
                                        Duration(days: widget.days ?? 100)),
                              );
                              FocusManager.instance.primaryFocus?.unfocus();
                              if (dateTime != null) {
                                widget.onChangeDate(dateTime);
                              }
                            }
                          : widget.onTap,
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
                      cursorColor: Colors.black,
                      obscureText: widget.obsecureText,
                      maxLength: widget.maxLength,
                      // textAlign: widget.textAlign,
                      onChanged: (txt) {
                        if (txt.isNotEmpty) {
                          setState(() {
                            _errorText = null;
                          });
                          if (widget.onChange != null) {
                            widget.onChange!(txt);
                          }
                        }
                      },
                      keyboardType: widget.keyboardType,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                          prefix: widget.prefix,
                          label: widget.label != null
                              ? Directionality(
                                  textDirection:
                                      localeTextAlign == TextAlign.right
                                          ? TextDirection.rtl
                                          : TextDirection.ltr,
                                  child: Text(widget.label!,
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 15.sp,
                                      )),
                                )
                              : null,
                          labelStyle: TextStyle(fontSize: 40.sp),
                          border: InputBorder.none,
                          errorStyle: const TextStyle(height: 0, fontSize: -1),
                          errorMaxLines: 1,
                          counterText: "",
                          suffixIcon: widget.isDateTime
                              ? Icon(
                                  Icons.calendar_today_rounded,
                                  size: 20.sp,
                                )
                              : null),
                    ),
                  )),
            ),
          ],
        ),
        _errorText != null
            ? Container(
                padding: const EdgeInsets.only(right: 20.0, top: 5.0),
                child: Row(
                  children: <Widget>[
                    const Icon(Icons.error_outline_rounded,
                        size: 20.0, color: Colors.red),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(_errorText!,
                              style: const TextStyle(color: Colors.red)
                                  .merge(widget.errorTextStyle))),
                    )
                  ],
                ))
            : Container(),
      ],
    );
  }
}
