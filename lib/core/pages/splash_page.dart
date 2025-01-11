// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:jolz/core/network/dio_helper.dart';
// import 'package:jolz/core/screens/error_screen.dart';
// import 'package:jolz/core/theme/app_colors.dart';
// import 'package:jolz/core/utils/functions.dart';
// import 'package:ojolz/core/utils/messages.dart';
// import 'package:jolz/features/auth/presentation/blocs/auth/auth_bloc.dart';
// import 'package:jolz/features/auth/presentation/blocs/user/user_bloc.dart';
// import 'package:jolz/features/notifications/presentation/blocs/notifications/notifications_bloc.dart';
//
// class SplashPage extends StatelessWidget {
//   const SplashPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     if (DioHelper.isLoggedIn) {
//       BlocProvider.of<AuthBloc>(context)
//           .add(SignInWithFirebaseEmailPasswordEvent());
//     } else {
//       Future.delayed(const Duration(seconds: 5))
//           .then((value) => Navigator.pushReplacementNamed(context, 'login'));
//     }
//     return Scaffold(
//         body: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
//       if (state is DoneSignInWithEmailPasswordState) {
//         BlocProvider.of<UserBloc>(context)
//             .add(SetCurrentUserEvent(user: state.user));
//         BlocProvider.of<NotificationsBloc>(context)
//             .add(SetCurrentNotificationsUserIdEvent(userId: state.user.id));
//         if (state.user.active == true) {
//           Future.delayed(const Duration(seconds: 1)).then((value) {
//             String? routeShouldBeOpened =
//                 BlocProvider.of<NotificationsBloc>(context).routeShouldBeOpened;
//             Navigator.pushNamedAndRemoveUntil(
//               context,
//               state.user.firstName == null || state.user.firstName!.isEmpty
//                   ? 'edit-profile'
//                   : routeShouldBeOpened ?? 'home',
//               (route) => false,
//             );
//           });
//         } else {
//           BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
//           showSnackbar(context, ErrorMessage.accountDisabled,
//               color: Colors.red, isInfo: false, isError: true);
//           Future.delayed(const Duration(seconds: 1)).then((value) {
//             Navigator.pushNamedAndRemoveUntil(
//               context,
//               'login',
//               (route) => false,
//             );
//           });
//         }
//       } else if (state is ErrorSignInWithEmailPasswordState) {
//         if (state.message == ErrorMessage.unauthenticated ||
//             state.message == ErrorMessage.invalidRequestBody) {
//           Future.delayed(const Duration(seconds: 1)).then((value) {
//             Navigator.of(context).pushReplacementNamed('login');
//           });
//         }
//       }
//     }, builder: (context, state) {
//       if (state is ErrorSignInWithEmailPasswordState) {
//         if (state.message != ErrorMessage.unauthenticated &&
//             state.message != ErrorMessage.invalidRequestBody) {
//           return ErrorScreen(
//             message: state.message,
//             onRetry: () => BlocProvider.of<AuthBloc>(context)
//                 .add(SignInWithFirebaseEmailPasswordEvent()),
//           );
//         }
//       }
//       return Stack(
//         children: [
//           Center(
//             child: Image.asset(
//               'assets/images/o2_logo.png',
//               width: 200.w,
//               height: 200.h,
//               // fit: BoxFit.cover,
//             ),
//           ),
//           Center(
//               child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 300.h,
//               ),
//               CupertinoActivityIndicator(
//                 color: CAColors.primary,
//                 radius: 25.r,
//               ),
//               // Expanded(child: Container()),
//               // Center(
//               //   child: Image.asset(
//               //     'assets/images/laundry.jpg',
//               //     width: 400.w,
//               //     height: 400.h,
//               //     fit: BoxFit.cover,
//               //   ),
//               // )
//             ],
//           )),
//         ],
//       );
//     })
//         //   },
//         // )
//         // },
//         // ),
//         );
//   }
// }
