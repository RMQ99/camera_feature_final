import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String message,
    {Color? color, bool? isInfo, bool? isError}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Row(
      children: [
        !(isInfo ?? false)
            ? Icon((isError ?? false) ? Icons.error_rounded : Icons.done,
                color: Colors.white)
            : Container(),
        !(isInfo ?? false)
            ? SizedBox(
                width: 10,
              )
            : Container(),
        Expanded(
          child: Text(
            message.tr(),
          ),
        ),
      ],
    ),
    backgroundColor: color,
  ));
}

// Future<void> shareApp(String appLink) async {
//   final String message = 'اطّلع على تطبيقنا الجديد: $appLink';
//   await FlutterShare.share(
//       title: 'مشاركة التطبيق', text: message, linkUrl: appLink);
// }

int compareTwoTimeOfDays(TimeOfDay first, TimeOfDay second) {
  if (first.hour < second.hour) return -1;
  if (first.hour > second.hour) return 1;
  if (first.minute < second.minute) return -1;
  if (first.minute > second.minute) return 1;
  return 0;
}

String formatTimeString(String time) {
  if (time.isEmpty) {
    return '-';
  }
  TimeOfDay tod = TimeOfDay(
      hour: int.parse(time.split(":")[0]),
      minute: int.parse(time.split(":")[1]));
  final now = DateTime.now();
  final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
  final format = DateFormat.jm();
  return format.format(dt);
}

String getArabicDayName(String day) {
  switch (day) {
    case 'saturday':
      return 'السبت';
    case 'sunday':
      return 'الأحد';
    case 'monday':
      return 'الإثنين';
    case 'tuesday':
      return 'الثلاثاء';
    case 'wednesday':
      return 'الأربعاء';
    case 'thursday':
      return 'الخميس';
    case 'friday':
      return 'الجمعة';
  }
  return '';
}

String getArabicMonthName(String month) {
  switch (month) {
    case 'JAN':
      return 'كانون الثاني';
    case 'FEB':
      return 'شباط';
    case 'MAR':
      return 'آذار';
    case 'APR':
      return 'نيسان';
    case 'MAY':
      return 'أيار';
    case 'JUN':
      return 'حزيران';
    case 'JUL':
      return 'تموز';
    case 'AUG':
      return 'آب';
    case 'SEP':
      return 'أيلول';
    case 'OCT':
      return 'تشرين الأول';
    case 'NOV':
      return 'تشرين الثاني';
    case 'DEC':
      return 'كانون الأول';
  }
  return '';
}
