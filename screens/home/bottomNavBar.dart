// import 'dart:io';

// import 'package:edukaapp/screens/Wishlist/wishlistscreen.dart';
// import 'package:edukaapp/screens/drawer/account/accountscreen.dart';
// import 'package:edukaapp/screens/home/components/allcourses/allcourses_screen.dart';
// import 'package:edukaapp/screens/home/components/categories/allcategoriesscreen.dart';
// import 'package:edukaapp/screens/home/home_screen.dart';
// import 'package:edukaapp/utils/appcolors.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:convex_bottom_bar/convex_bottom_bar.dart';
// import 'package:provider/provider.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// class BottomNav extends StatefulWidget {
//   @override
//   State<BottomNav> createState() => _BottomNavState();
// }

// class _BottomNavState extends State<BottomNav> {
//   int selectedIndex = 0;
//   List<Widget> listWidgets = [
//     HomePage(),
//     AllCategoriesScreen(),
//     AllcoursesScreen(),
//     WishlistScreen(),
//     AccountScreen(),
//   ];

//   @override
//   void initState() {
//     // TODO: implement initState
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//           child: listWidgets[selectedIndex],
//         ),
//         bottomNavigationBar: ConvexAppBar(
//           backgroundColor: AppColors.appPrimarycolor,
//           items: [
//             TabItem(
//               icon: Icons.home,
//             ),
//             TabItem(
//               icon: Icons.category_outlined,
//             ),
//             TabItem(
//               icon: Icons.grid_view_outlined,
//             ),
//             TabItem(
//               icon: Icons.favorite_border_rounded,
//             ),
//             TabItem(
//               icon: Icons.account_circle,
//             ),
//           ],
//           onTap: onItemTapped,
//           activeColor: AppColors.colorWhite,

// //  Color? activeColor,
// //   Color? backgroundColor,
// //   Color? shadowColor,
// //   Gradient? gradient,
// //   double? height,
// //   double? curveSize,
// //   double? top,
// //   double? elevation,
// //   double? cornerRadius,
// //   TabStyle? style,
//         ));
//   }

//   void onItemTapped(int index) {
//     setState(() {
//       selectedIndex = index;
//     });
//   }
// }
