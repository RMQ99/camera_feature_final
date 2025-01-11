// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:oxygen_flutter/core/theme/app_colors.dart';
// import 'package:oxygen_flutter/core/theme/styles.dart';
// import 'package:oxygen_flutter/features/auth/domain/entities/user.dart';
// import 'package:oxygen_flutter/features/auth/presentation/blocs/auth/auth_bloc.dart';
// import 'package:oxygen_flutter/features/auth/presentation/blocs/user/user_bloc.dart';

// class CustomAccountHeader extends StatelessWidget {
//   final VoidCallback onClickEditProfile;

//   const CustomAccountHeader({required this.onClickEditProfile, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 20, bottom: 10),
//       child: BlocBuilder<UserBloc, UserState>(
//         buildWhen: (previous, current) {
//           return current is DoneGetUserState ||
//               current is ErrorGetUserState ||
//               current is LoadingGetUserState;
//         },
//         builder: (context, state) {
//           if (state is DoneGetUserState ||
//               BlocProvider.of<UserBloc>(context).currentUser != null) {
//             User user = BlocProvider.of<UserBloc>(context).currentUser!;
//             return Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // CircleAvatar(
//                 //   backgroundColor: CAColors.orange,
//                 //   radius: 40,
//                 //   child: CircleAvatar(
//                 //     backgroundColor: Colors.white,
//                 //     radius: 38,
//                 //     child: Center(
//                 //       child: Text(
//                 //         user.name[0],
//                 //         style: CAStyles.boldTextStyle.merge(
//                 //             TextStyle(fontSize: 30, color: CAColors.darkBlue)),
//                 //       ),
//                 //     ),
//                 //   ),
//                 // ),
//                 SizedBox(width: 10.w),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: 15.h),
//                       Text(
//                         user.name,
//                         style: CAStyles.boldTextStyle
//                             .merge(TextStyle(color: CAColors.darkBlue)),
//                       ),
//                       Text(
//                         user.email,
//                         style: CAStyles.boldNumberTextStyle.merge(
//                             TextStyle(color: CAColors.darkBlue, fontSize: 13)),
//                       ),
//                       Text(
//                         'رقم الحساب: ${user.fileNumber}',
//                         style: CAStyles.boldTextStyle
//                             .merge(TextStyle(color: CAColors.darkBlue)),
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       SizedBox(
//                         height: 25,
//                         child: Row(
//                           children: [
//                             ElevatedButton(
//                               onPressed: onClickEditProfile,
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     'تعديل المعلومات الشخصية',
//                                     style: CAStyles.boldTextStyle.merge(
//                                         TextStyle(
//                                             color: Colors.white, fontSize: 10)),
//                                   ),
//                                   const SizedBox(width: 10),
//                                   SvgPicture.asset(
//                                     'assets/icons/edit.svg',
//                                     height: 15,
//                                   )
//                                 ],
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 padding: EdgeInsets.symmetric(horizontal: 5),
//                                 // primary: CAColors.orange,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(
//                                     8,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             );
//           } else if (state is LoadingGetUserState) {
//             return const Center(
//               child: SizedBox(
//                 width: 40,
//                 height: 40,
//                 child: CircularProgressIndicator(),
//               ),
//             );
//           } else if (state is ErrorGetUserState) {
//             return const Center(
//               child: Icon(
//                 Icons.error,
//                 color: CAColors.red,
//                 size: 30,
//               ),
//             );
//           }
//           return Container();
//         },
//       ),
//     );
//   }
// }
