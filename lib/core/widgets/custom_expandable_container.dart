import 'package:camera_app/core/theme/app_colors.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class CustomExpandableContainer extends StatelessWidget {
  final Widget headerWidget;
  final Widget? collapsedWidget;
  final Widget? expandedWidget;
  final bool isLoading;
  final bool isError;
  final VoidCallback? onRefresh;
  const CustomExpandableContainer(
      {required this.headerWidget,
      required this.collapsedWidget,
      required this.expandedWidget,
      this.isLoading = false,
      this.isError = false,
      this.onRefresh,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      header: isLoading || isError
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                headerWidget,
                isError
                    ? IconButton(
                        onPressed: onRefresh,
                        icon: Icon(
                          Icons.refresh_rounded,
                          color: Colors.red,
                          size: 26,
                        ))
                    : SizedBox(
                        width: 30,
                        height: 30,
                        child:
                            CircularProgressIndicator(color: AppColors.green),
                      )
              ],
            )
          : headerWidget,
      collapsed: collapsedWidget ?? Container(),
      expanded: expandedWidget ?? Container(),
      controller: ExpandableController(initialExpanded: true),
      // controller: ExpandableController(initialExpanded: true),
      theme: ExpandableThemeData(
          // tapHeaderToExpand: !isLoading && !isError,
          // hasIcon: !isLoading && !isError,
          // tapBodyToExpand: !isLoading && !isError,
          // tapBodyToCollapse: !isLoading && !isError,
          tapHeaderToExpand: false,
          hasIcon: false,
          tapBodyToExpand: false,
          tapBodyToCollapse: false,
          iconSize: 0),
    );
  }
}
