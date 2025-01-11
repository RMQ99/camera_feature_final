// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:camera_app/core/theme/app_colors.dart';
import 'package:camera_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class CustomTable extends StatelessWidget {
  final List<String>? headers;
  final List<List<String>> cells;
  // final List<Color>? rowColors;
  final List<List<TextStyle?>>? cellTextStyles;
  final List<List<TextDirection?>>? cellTextDirections;
  final int crossAxisCount;
  final Color borderColor;
  final Color headersColor;
  const CustomTable({
    this.headers,
    required this.cells,
    required this.crossAxisCount,
    this.cellTextStyles,
    this.cellTextDirections,
    this.borderColor = AppColors.green,
    this.headersColor = AppColors.green,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cellRows = <TableRow>[];
    if (headers != null) {
      cellRows.add(TableRow(
          decoration: BoxDecoration(color: Colors.grey[350]),
          children: headers!
              .map((e) => TableItem(
                    headersColor: headersColor,
                    text: e,
                    isHeader: true,
                  ))
              .toList()));
    }
    for (int i = 0; i < cells.length; i++) {
      cellRows.add(TableRow(
          children: List.generate(
              crossAxisCount,
              (index) => TableItem(
                    headersColor: headersColor,
                    text: cells[i][index],
                    textStyle: cellTextStyles != null
                        ? cellTextStyles![i][index]
                        : null,
                    textDirection: cellTextDirections != null
                        ? cellTextDirections![i][index]
                        : null,
                  ))));
    }

    return Table(
        border: TableBorder.all(
            color: borderColor, borderRadius: BorderRadius.circular(5)),
        children: cellRows);
  }
}

class TableItem extends StatelessWidget {
  final String text;
  final bool isHeader;
  final TextStyle? textStyle;
  final TextDirection? textDirection;
  final Color headersColor;
  const TableItem({
    this.isHeader = false,
    required this.text,
    required this.headersColor,
    this.textStyle,
    this.textDirection,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        text,
        textAlign: TextAlign.center,
        textDirection: textDirection,
        style: textStyle ??
            CAStyles.boldTextStyle.merge(TextStyle(
                fontSize: 13,
                color: isHeader ? headersColor : AppColors.darkBlue)),
      ),
    );
  }
}
