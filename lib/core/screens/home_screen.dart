// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:oxygen_flutter/core/router/cubit/router_cubit.dart';
// import 'package:oxygen_flutter/core/screens/error_screen.dart';
// import 'package:oxygen_flutter/core/screens/loading_screen.dart';
// import 'package:oxygen_flutter/core/theme/app_colors.dart';
// import 'package:oxygen_flutter/core/theme/styles.dart';
// import 'package:oxygen_flutter/core/utils/functions.dart';
// import 'package:oxygen_flutter/core/utils/messages.dart';
// import 'package:oxygen_flutter/core/widgets/custom_button.dart';
// import 'package:oxygen_flutter/features/auth/domain/entities/user.dart';
// import 'package:oxygen_flutter/features/auth/presentation/blocs/auth/auth_bloc.dart';
// import 'package:oxygen_flutter/features/auth/presentation/blocs/user/user_bloc.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     BlocProvider.of<UserBloc>(context).add(GetUserEvent());
//     return BlocConsumer<UserBloc, UserState>(
//       listener: (context, state) {
//         if (state is CompleteUserRegisterState) {
//           showSnackbar(context, DoneMessage.completeRegister,
//               color: Colors.green, isInfo: false, isError: false);
//           Navigator.of(context)
//               .pushReplacementNamed('register-profile/${state.email}');
//         }
//       },
//       buildWhen: (previous, current) {
//         return current is DoneGetUserState ||
//             current is ErrorGetUserState ||
//             current is LoadingGetUserState;
//       },
//       builder: (context, state) {
//         if (state is LoadingGetUserState) {
//           return const LoadingScreen();
//         } else if (state is ErrorGetUserState) {
//           return ErrorScreen(
//               onRetry: () =>
//                   BlocProvider.of<UserBloc>(context).add(GetUserEvent()),
//               message: state.message);
//         } else if (state is DoneGetUserState ||
//             BlocProvider.of<UserBloc>(context).currentUser != null) {
//           User user = BlocProvider.of<UserBloc>(context).currentUser!;
//           return SingleChildScrollView(
//             child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
//                 child: Column(
//                   children: [
//                     // const AdsWidget(),
//                     const SizedBox(height: 8),
//                     Container(
//                         decoration: BoxDecoration(
//                             color: CAColors.darkBlue,
//                             borderRadius: BorderRadius.circular(5)),
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 25, vertical: 18),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Text(
//                               'رصيدك الحالي',
//                               textAlign: TextAlign.center,
//                               style: CAStyles.boldTextStyle.merge(
//                                   TextStyle(color: Colors.white, fontSize: 25)),
//                             ),
//                             Text(
//                               '\$${user.availableBalance.toStringAsFixed(2)}',
//                               style:
//                                   CAStyles.boldNumberTextStyle.merge(TextStyle(
//                                 color: CAColors.orange,
//                                 fontSize: 22,
//                               )),
//                             ),
//                           ],
//                         )),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     SizedBox(
//                       height: 60,
//                       child: CustomButton(
//                         onPressed: () {
//                           BlocProvider.of<RouterCubit>(context)
//                               .openTransferBalanceScreen();
//                         },
//                         text: 'تحويل رصيد',
//                         verticalPadding: 10,
//                         horizontalPadding: 10,
//                         backgroundColor: CAColors.orange,
//                         icon: SvgPicture.asset(
//                           'assets/icons/transfer-white.svg',
//                           height: 25,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 8,
//                     ),
//                     // SizedBox(
//                     //   height: 60,
//                     //   child: CustomButton(
//                     //     onPressed: () {
//                     //       BlocProvider.of<RouterCubit>(context)
//                     //           .openRechargeMeterScreen();
//                     //     },
//                     //     text: 'شحن عداد كهرباء',
//                     //     verticalPadding: 10,
//                     //     horizontalPadding: 10,
//                     //     icon: SvgPicture.asset(
//                     //       'assets/icons/electricity-white.svg',
//                     //       height: 25,
//                     //     ),
//                     //   ),
//                     // ),
//                     SizedBox(
//                       height: 60,
//                       child: CustomButton(
//                         onPressed: () {
//                           BlocProvider.of<RouterCubit>(context)
//                               .openNewRechargeMeterScreen();
//                         },
//                         text: 'شحن عداد كهرباء',
//                         verticalPadding: 10,
//                         horizontalPadding: 10,
//                         icon: SvgPicture.asset(
//                           'assets/icons/electricity-white.svg',
//                           height: 25,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 60,
//                       child: CustomButton(
//                         onPressed: () {
//                           BlocProvider.of<RouterCubit>(context)
//                               .openPayCleanBillsScreen();
//                         },
//                         text: 'دفع رسوم النظافة',
//                         verticalPadding: 10,
//                         horizontalPadding: 10,
//                         icon: SvgPicture.asset(
//                           'assets/icons/electricity-white.svg',
//                           height: 25,
//                         ),
//                       ),
//                     )
//                   ],
//                 )),
//           );
//         }
//         return Container();
//       },
//     );
//   }
// }
