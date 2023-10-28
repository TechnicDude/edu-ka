import 'package:edukaapp/localization/Language/languages.dart';
import 'package:edukaapp/page_routes/routes.dart';
import 'package:edukaapp/screens/PaymentPage/AddtoCart.dart';
import 'package:edukaapp/screens/myCourses/components/AllCoursesWidgets/courselist.dart';
import 'package:edukaapp/screens/myCourses/components/AllCoursesWidgets/coursewidget.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'components/FavoritedCourse/favoritedCourse.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 2.w,
            ),
            Text(Languages.of(context)!.mycourse, style: AppStyle.mytexttitle),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(child: Icon(Icons.search)),
                SizedBox(
                  width: 6.w,
                ),
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.addtoCartScreen);
                    },
                    child: Icon(Icons.shopping_cart_outlined)),
              ],
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        displacement: 40.h,
        backgroundColor: Colors.white,
        color: AppColors.appPrimarycolor,
        strokeWidth: 2,
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: () async {
          await Future.delayed(Duration(milliseconds: 2000));
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(1.5.h),
              child: Column(
                children: [
                  MycourseHistorytext(),
                  SizedBox(
                    height: 2.h,
                  ),
                  MyCourseWidgetUI(),
                  //DownloadedCourse(),
                  //ArchivedCourse(),
                  // FavoriteCourse(),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
