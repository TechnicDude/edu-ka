// import 'package:edukaapp/page_routes/routes.dart';
// import 'package:edukaapp/utils/appcolors.dart';
// import 'package:edukaapp/utils/appimages.dart';
// import 'package:edukaapp/utils/appstyle.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class Intros extends StatefulWidget {
//   const Intro({super.key});

//   @override
//   State<Intro> createState() => _IntroState();
// }

// class _IntroState extends State<Intro> {
//   var controller;
//   @override
//   void initState() {
//     controller = new PageController(
//       viewportFraction: 0.8,
//     );
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.only(top: 4.h, left: 2.h, right: 2.h, bottom: 2.h),
//         child: SizedBox(
//             width: double.infinity,
//             // height: 60.h,
//             child: Column(
//               children: <Widget>[
//                 SizedBox(
//                   height: 80.h,
//                   child: new PageView(
//                     controller: controller,
//                     children: <Widget>[
//                       Column(
//                         children: [
//                           Image.asset(AppImages.edu1,
//                               width: 100.w, height: 45.h, fit: BoxFit.fill),
//                           SizedBox(
//                             height: 8.h,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "20% Discount\nNew Arrival Product",
//                                 style: AppStyle.onbaordtitle.copyWith(
//                                     color: AppColors.colorBlack,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 2.h,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Publish up your selfies to make yoursef \nmore beautiful with this app",
//                                 style: AppStyle.textsubsubtitle.copyWith(
//                                     color: AppColors.colorBlack,
//                                     fontSize: 16.sp),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Image.asset(AppImages.edu3,
//                               width: 100.w, height: 45.h, fit: BoxFit.fill),
//                           SizedBox(
//                             height: 8.h,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "All Types Offer\nWithin Your Reach",
//                                 style: AppStyle.onbaordtitle.copyWith(
//                                     color: AppColors.colorBlack,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 2.h,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Publish up your selfies to make yoursef \nmore beautiful with this app",
//                                 style: AppStyle.textsubsubtitle.copyWith(
//                                     color: AppColors.colorBlack,
//                                     fontSize: 16.sp),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Image.asset(AppImages.edu2,
//                               width: 90.w, height: 45.h, fit: BoxFit.fill),
//                           SizedBox(
//                             height: 8.h,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Take Advantage\nOf The Offer Shopping",
//                                 style: AppStyle.onbaordtitle.copyWith(
//                                     color: AppColors.colorBlack,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 2.h,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Publish up your selfies to make yoursef \nmore beautiful with this app",
//                                 style: AppStyle.textsubsubtitle.copyWith(
//                                     color: AppColors.colorBlack,
//                                     fontSize: 16.sp),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         Navigator.pushNamed(
//                             context, Routes.changeLanguageScreen);
//                       },
//                       child: Container(
//                         height: 5.h,
//                         width: 10.h,
//                         decoration: BoxDecoration(
//                             color: AppColors.colorBlack,
//                             borderRadius: BorderRadius.circular(2.h)),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               "Skip",
//                               style: AppStyle.texttitle.copyWith(
//                                   color: AppColors.colorWhite, fontSize: 16.sp),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SmoothPageIndicator(
//                       controller: controller,
//                       count: 3,
//                       effect: ScaleEffect(
//                           activeDotColor: AppColors.appPrimarycolor),
//                     ),
//                     // InkWell(
//                     //   onTap: () {
//                     //     //Navigator.pushNamed(context, Routes.OnBoardScreentwo);
//                     //   },
//                     //   child: Container(
//                     //     height: 5.h,
//                     //     width: 9.h,
//                     //     decoration: BoxDecoration(
//                     //         color: AppColors.colorBlack,
//                     //         borderRadius: BorderRadius.circular(2.h)),
//                     //     child: Center(
//                     //       child: Text(
//                     //         "Next",
//                     //         style: AppStyle.texttitle.copyWith(
//                     //             color: AppColors.colorWhite,
//                     //             fontSize: 16.sp),
//                     //       ),
//                     //     ),
//                     //   ),
//                     // ),
//                   ],
//                 ),
//               ],
//             )),
//       ),
//     );
//   }
// }
