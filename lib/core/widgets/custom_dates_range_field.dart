import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDatesRangeField extends StatefulWidget {
  final String? startDateLabel;
  final String? endDateLable;
  final int days;
  final bool obsecureText;
  final FormFieldValidator? validate;
  final TextEditingController startDateController;
  final TextEditingController endDateController;
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
  final Function(DateTime) onChangeStartDate;
  final Function(DateTime) onChangeEndDate;
  final Function(String)? onChange;
  final DateTime startDate;
  final DateTime endDate;
  final TextAlign? textAlign;
  final double? radius;
  const CustomDatesRangeField(
      {this.startDateLabel,
      this.endDateLable,
      required this.days,
      this.obsecureText = false,
      this.validate,
      required this.startDateController,
      required this.endDateController,
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
      required this.onChangeStartDate,
      required this.onChangeEndDate,
      this.onChange,
      required this.startDate,
      required this.endDate,
      this.textAlign,
      this.radius,
      super.key});

  @override
  State<CustomDatesRangeField> createState() => _CustomDatesRangeFieldState();
}

class _CustomDatesRangeFieldState extends State<CustomDatesRangeField> {
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
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(widget.radius ?? 15.r),
                      color: Colors.white,
                      border: Border.all(color: Colors.black.withOpacity(0.2))),
                  child: Directionality(
                    textDirection: textAlign == TextAlign.right
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    child: TextFormField(
                      autofocus: false,
                      style: TextStyle(color: Colors.black, fontSize: 40.sp),
                      controller: widget.startDateController,
                      enabled: !widget.isDateTime || widget.enabled,
                      maxLines: widget.maxLines ?? 1,
                      readOnly: widget.readOnly,
                      textAlign: textAlign,
                      onTap: widget.isDateTime
                          ? () async {
                              DateTime? dateTime = await showDatePicker(
                                  context: context,
                                  initialDate:
                                      widget.startDate ?? DateTime.now(),
                                  firstDate: widget.endDate
                                      .subtract(Duration(days: widget.days)),
                                  lastDate: widget.endDate);
                              FocusManager.instance.primaryFocus?.unfocus();
                              if (dateTime != null) {
                                widget.onChangeStartDate(dateTime);
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
                          label: widget.startDateLabel != null
                              ? Directionality(
                                  textDirection:
                                      localeTextAlign == TextAlign.right
                                          ? TextDirection.rtl
                                          : TextDirection.ltr,
                                  child: Text(widget.startDateLabel!,
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 45.sp,
                                          fontWeight: FontWeight.bold)),
                                )
                              : null,
                          labelStyle: TextStyle(fontSize: 60.sp),
                          border: InputBorder.none,
                          errorStyle: const TextStyle(height: 0, fontSize: -1),
                          errorMaxLines: 1,
                          counterText: "",
                          suffixIcon: widget.isDateTime
                              ? Icon(
                                  Icons.calendar_today_rounded,
                                  size: 60.sp,
                                )
                              : null),
                    ),
                  )),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(widget.radius ?? 15.r),
                      color: Colors.white,
                      border: Border.all(color: Colors.black.withOpacity(0.2))),
                  child: Directionality(
                    textDirection: textAlign == TextAlign.right
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    child: TextFormField(
                      autofocus: false,
                      style: TextStyle(color: Colors.black, fontSize: 40.sp),
                      controller: widget.endDateController,
                      enabled: !widget.isDateTime || widget.enabled,
                      maxLines: widget.maxLines ?? 1,
                      readOnly: widget.readOnly,
                      textAlign: textAlign,
                      onTap: widget.isDateTime
                          ? () async {
                              DateTime? dateTime = await showDatePicker(
                                  context: context,
                                  initialDate: widget.endDate ?? DateTime.now(),
                                  firstDate: widget.startDate,
                                  lastDate: widget.startDate
                                      .add(Duration(days: widget.days)));
                              FocusManager.instance.primaryFocus?.unfocus();
                              if (dateTime != null) {
                                widget.onChangeEndDate(DateTime(dateTime.year,
                                    dateTime.month, dateTime.day, 23, 59, 59));
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
                          label: widget.endDateLable != null
                              ? Directionality(
                                  textDirection:
                                      localeTextAlign == TextAlign.right
                                          ? TextDirection.rtl
                                          : TextDirection.ltr,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(widget.endDateLable!,
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 45.sp,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                )
                              : null,
                          border: InputBorder.none,
                          labelStyle: TextStyle(fontSize: 60.sp),
                          errorStyle: TextStyle(height: 0, fontSize: -1),
                          errorMaxLines: 1,
                          counterText: "",
                          suffixIcon: widget.isDateTime
                              ? Icon(
                                  Icons.calendar_today_rounded,
                                  size: 60.sp,
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
