import 'package:edukaapp/localization/Language/languages.dart';
import 'package:edukaapp/page_routes/routes.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appimages.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FavoriteCourse extends StatefulWidget {
  const FavoriteCourse({super.key});

  @override
  State<FavoriteCourse> createState() => _FavoriteCourseState();
}

class _FavoriteCourseState extends State<FavoriteCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.colorBlack,
        ),
        backgroundColor: Colors.white.withOpacity(0.95),
        elevation: 0,
        title:
            Center(child: Text("Favorite Course", style: AppStyle.mytexttitle)),
      ),
      body: Column(
        children: [
          ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const PageScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(top: 1.h, bottom: 0.5.h),
                  child: InkWell(
                    child: Container(
                      height: 10.h,
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(1.h),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(0.2.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.colorGrey,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(1.h)),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(1.h),
                                        child: Image.asset(
                                          AppImages.course,
                                          fit: BoxFit.fill,
                                          height: 7.h,
                                          width: 7.h,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 58.w,
                                      child: Text(
                                          "Flutter & Dart - The Complete Guide Developement Course with scratch ",
                                          maxLines: 2,
                                          style: AppStyle.textcatsubtitle
                                              .copyWith(fontSize: 15.sp)),
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    SizedBox(
                                      width: 55.w,
                                      child: Text("Mrs. Deepika Mourya",
                                          maxLines: 1,
                                          style: AppStyle.textsubsubtitle),
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.video_call_outlined,
                                          size: 2.h,
                                        ),
                                        SizedBox(
                                          width: 1.w,
                                        ),
                                        Text("378 lectures",
                                            maxLines: 1,
                                            style: AppStyle.textsubsubtitle),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.favorite),
                              color: Colors.red,
                              iconSize: 3.5.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
