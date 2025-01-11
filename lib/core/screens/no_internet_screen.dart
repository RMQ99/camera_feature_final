import 'package:camera_app/core/router/cubit/router_cubit.dart';
import 'package:camera_app/core/theme/app_colors.dart';
import 'package:camera_app/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.wifi_off_rounded,
            size: 80,
            color: AppColors.red,
          ),
          SizedBox(height: 20),
          Text(
            'لا يوجد اتصال في الأنترنت!',
            style: CAStyles.boldTextStyle.merge(TextStyle(fontSize: 18)),
          ),
          SizedBox(height: 20),
          TextButton(
              onPressed: () {
                BlocProvider.of<RouterCubit>(context).openTransactionsScreen();
              },
              child: Text(
                'الإطلاع على سجل العمليات السابقة',
                style: CAStyles.boldTextStyle.merge(TextStyle(fontSize: 16)),
              ))
        ],
      ),
    );
  }
}
