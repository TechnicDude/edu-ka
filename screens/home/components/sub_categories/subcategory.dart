import 'package:edukaapp/localization/Language/languages.dart';
import 'package:edukaapp/model/api_models/categort_model.dart';
import 'package:edukaapp/provider/dashboard_Provider.dart';
import 'package:edukaapp/screens/home/components/categories/allcategoriesui.dart';
import 'package:edukaapp/screens/home/components/sub_categories/subcategoryui.dart';
import 'package:edukaapp/utils/app_helper.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/backbutton.dart';
import 'package:edukaapp/utils/loaderscreen.dart';
import 'package:edukaapp/utils/no_internetconnection.dart';
import 'package:edukaapp/utils/nodatafoundscreen.dart';
import 'package:edukaapp/utils/searchwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SubcategorieScreen extends StatefulWidget {
  final String categoryName;
  final String categoryId;
  final List<SubCategories> subcategory;
  const SubcategorieScreen(
      {required this.categoryId,
      required this.categoryName,
      required this.subcategory});

  @override
  State<SubcategorieScreen> createState() => _SubcategorieScreenState();
}

class _SubcategorieScreenState extends State<SubcategorieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.colorBlack,
        ),
        backgroundColor: Colors.white.withOpacity(0.95),
        elevation: 0,
        title: Center(
            child: Text(Languages.of(context)!.subcategories,
                style: AppStyle.mytexttitle)),
      ),
      body: Provider.of<InternetConnectionStatus>(context) ==
              InternetConnectionStatus.disconnected
          ? InternetNotAvailable()
          : SafeArea(
              child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.all(2.h),
                      child: SubCategoriesUI(
                        subcategorydata: widget.subcategory,
                      )),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            )),
    );
  }
}




// import 'package:edukaapp/page_routes/routes.dart';
// import 'package:edukaapp/screens/PaymentPage/AddtoCart.dart';
// import 'package:edukaapp/screens/home/components/popularcourse/popularcourseUI.dart';
// import 'package:edukaapp/screens/home/components/Home_Cards/auther_card.dart';
// import 'package:edukaapp/screens/home/components/Home_Cards/course_card.dart';
// import 'package:edukaapp/screens/home/components/Home_Cards/popularcourse_card.dart';
// import 'package:edukaapp/screens/home/components/sub_categories/allcourse_ui.dart';
// import 'package:edukaapp/utils/appcolors.dart';
// import 'package:edukaapp/utils/appstyle.dart';
// import 'package:flutter/material.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import '../../../myCourses/components/AllCoursesWidgets/courselist.dart';

// class SubcategorieScreen extends StatefulWidget {
//   const SubcategorieScreen({super.key});

//   @override
//   State<SubcategorieScreen> createState() => _SubcategorieScreenState();
// }

// class _SubcategorieScreenState extends State<SubcategorieScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white.withOpacity(0.95),
//       appBar: AppBar(
//         iconTheme: IconThemeData(
//           color: AppColors.colorBlack,
//         ),
//         backgroundColor: AppColors.colorWhite,
//         elevation: 0,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "Subcategory",
//               style: AppStyle.texttitle.copyWith(color: Colors.black),
//             ),
//             InkWell(child: Icon(Icons.filter_list)),

//             // InkWell(
//             //     onTap: () {
//             //       Navigator.pushNamed(context, Routes.addtoCartScreen);
//             //     },
//             //     child: InkWell(child: Icon(Icons.shopping_cart_outlined))),
//           ],
//         ),
//       ),
//       body: RefreshIndicator(
//         displacement: 40.h,
//         backgroundColor: Colors.white,
//         color: AppColors.appPrimarycolor,
//         strokeWidth: 2,
//         triggerMode: RefreshIndicatorTriggerMode.onEdge,
//         onRefresh: () async {
//           await Future.delayed(Duration(milliseconds: 2000));
//         },
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.only(left: 1.5.h, right: 1.5.h, bottom: 2.h),
//               child: Column(
//                 children: [
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //   children: [
//                   //     Text(
//                   //       "Development",
//                   //       //Languages.of(context)!.categories,
//                   //       style:
//                   //           AppStyle.onbaordtitle.copyWith(color: Colors.black),
//                   //     ),
//                   //     // InkWell(
//                   //     //   onTap: () {
//                   //     //     Navigator.push(
//                   //     //         context,
//                   //     //         MaterialPageRoute(
//                   //     //             builder: (context) => de()));
//                   //     //   },
//                   //     //   child: Text(
//                   //     //     "See all",
//                   //     //     style: AppStyle.textsubtitle
//                   //     //         .copyWith(color: AppColors.appPrimarycolor),
//                   //     //   ),
//                   //     //),
//                   //   ],
//                   // ),
//                   // SizedBox(
//                   //   height: 3.h,
//                   // ),
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.start,
//                   //   children: [
//                   //     Text(
//                   //       "Courses to get you started",
//                   //       style: AppStyle.texttitle
//                   //           .copyWith(color: Colors.black, fontSize: 18.sp),
//                   //     ),
//                   //   ],
//                   // ),
//                   // SizedBox(
//                   //   height: 2.h,
//                   // ),
//                   CourseCard(),
//                   SizedBox(
//                     height: 4.h,
//                   ),

//                   // SizedBox(
//                   //   height: 4.h,
//                   // ),
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.start,
//                   //   children: [
//                   //     Text(
//                   //       "Popular topics",
//                   //       style: AppStyle.texttitle
//                   //           .copyWith(color: Colors.black, fontSize: 18.sp),
//                   //     ),
//                   //   ],
//                   // ),
//                   // SizedBox(
//                   //   height: 2.h,
//                   // ),
//                   // MycourseHistorytext(),
//                   // SizedBox(
//                   //   height: 4.h,
//                   // ),
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.start,
//                   //   children: [
//                   //     Text(
//                   //       "Subcategories",
//                   //       style: AppStyle.texttitle
//                   //           .copyWith(color: Colors.black, fontSize: 18.sp),
//                   //     ),
//                   //   ],
//                   // ),
//                   // SizedBox(
//                   //   height: 2.h,
//                   // ),
//                   // MycourseHistorytext(),
//                   // SizedBox(
//                   //   height: 4.h,
//                   // ),
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.start,
//                   //   children: [
//                   //     Text(
//                   //       "Top Instructors",
//                   //       style: AppStyle.texttitle
//                   //           .copyWith(color: Colors.black, fontSize: 18.sp),
//                   //     ),
//                   //   ],
//                   // ),
//                   // SizedBox(
//                   //   height: 2.h,
//                   // ),
//                   //AutherCard(),
//                   // SizedBox(
//                   //   height: 4.h,
//                   // ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                         "All Courses",
//                         style: AppStyle.texttitle.copyWith(
//                             color: Colors.black.withOpacity(0.6),
//                             fontSize: 18.sp),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 2.h,
//                   ),
//                   AllCourseUI(),
//                   SizedBox(
//                     height: 3.h,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
