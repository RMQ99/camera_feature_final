import 'package:camera_app/core/theme/app_colors.dart';
import 'package:camera_app/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDropdownFormField extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final String label;
  final Function(dynamic value) onSelected;
  final Function()? onAdd;
  final dynamic currentValue;
  final FormFieldValidator? validate;
  final TextStyle? labelTextStyle;
  final TextStyle? itemStyle;
  final bool disabled;
  const CustomDropdownFormField(
      {required this.items,
      required this.label,
      required this.onSelected,
      this.currentValue,
      this.onAdd,
      this.validate,
      this.disabled = false,
      this.labelTextStyle,
      this.itemStyle,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.primary, width: 1),
            borderRadius: BorderRadius.zero),
        padding: const EdgeInsets.only(top: 0, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8.h,
            ),
            Text(label,
                style: labelTextStyle != null
                    ? labelTextStyle
                    : CAStyles.lightTextStyle
                        .merge(TextStyle(color: Colors.grey, fontSize: 14.sp))),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField(
                    isDense: false,
                    isExpanded: true,
                    value: currentValue,
                    validator: validate,
                    onChanged: disabled
                        ? null
                        : (value) {
                            // if (value != null) {
                            onSelected(value);
                            // }
                          },
                    decoration: const InputDecoration(
                        border: InputBorder.none, isCollapsed: true),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: AppColors.primary,
                      size: 28,
                    ),
                    style: CAStyles.lightTextStyle
                        .merge(TextStyle(color: Colors.black, fontSize: 16.sp)),
                    items: items
                        .map((e) => DropdownMenuItem(
                              value: e['value'],
                              child: Text(e['title'],
                                  style: itemStyle != null
                                      ? itemStyle
                                      : CAStyles.lightTextStyle
                                          .merge(TextStyle(fontSize: 15.sp))),
                            ))
                        .toList(),
                  ),
                ),
                // Expanded(
                //   child: InkWell(
                //     onTap: onAdd,
                //     child: Container(
                //       padding:
                //           EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                //       decoration: const BoxDecoration(
                //         shape: BoxShape.circle,
                //         color: CAColors.primary,
                //       ),
                //       child: Icon(
                //         FontAwesomeIcons.add,
                //         size: 20.sp,
                //         color: Colors.white,
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ],
        ));
  }
}





// import 'package:flutter/material.dart';
// import 'package:oxygen_flutter/core/theme/app_colors.dart';
// import 'package:oxygen_flutter/core/theme/styles.dart';

// class CustomDropdown extends StatefulWidget {
//   final List<String> items;
//   final String label;
//   final Function(String value) onSelected;
//   final String? currentValue;
//   const CustomDropdown(
//       {required this.items,
//       required this.label,
//       required this.onSelected,
//       this.currentValue,
//       super.key});

//   @override
//   State<CustomDropdown> createState() => _CustomDropdownState();
// }

// class _CustomDropdownState extends State<CustomDropdown> {
//   @override
//   void initState() {
//     super.initState();
//     _currentValue = widget.currentValue;
//   }

//   String? _currentValue;

//   @override
//   Widget build(BuildContext context) {
//     _currentValue ??= widget.items[0];
//     return Container(
//         decoration: BoxDecoration(
//             border: Border.all(color: CAColors.darkBlue, width: 1),
//             borderRadius: BorderRadius.circular(5)),
//         padding: const EdgeInsets.symmetric(horizontal: 15),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(widget.label,
//                 style: CAStyles.boldTextStyle
//                     .merge(TextStyle(color: CAColors.darkGray))),
//             DropdownButtonFormField(
//               isDense: false,
//               value: _currentValue,
//               onChanged: (value) {
//                 if (value != null) {
//                   setState(() {
//                     _currentValue = value;
//                   });
//                   widget.onSelected(value);
//                 }
//               },
//               decoration:
//                   InputDecoration(border: InputBorder.none, isCollapsed: true),
//               icon: RotatedBox(
//                 quarterTurns: -1,
//                 child: Icon(
//                   Icons.arrow_forward_ios_rounded,
//                   color: Colors.black,
//                 ),
//               ),
//               style: CAStyles.boldTextStyle.merge(TextStyle(
//                   color: CAColors.black,
//                   fontFamily: 'SST-Arabic',
//                   fontSize: 16)),
//               items: widget.items
//                   .map((e) => DropdownMenuItem(
//                         value: e,
//                         child: Text(
//                           e,
//                         ),
//                       ))
//                   .toList(),
//             ),
//           ],
//         ));
//   }
// }
