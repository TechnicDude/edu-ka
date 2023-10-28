import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appimages.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/seekbarui.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllCourseListDetails extends StatefulWidget {
  const AllCourseListDetails({super.key});

  @override
  State<AllCourseListDetails> createState() => _AllCourseListDetailsState();
}

class _AllCourseListDetailsState extends State<AllCourseListDetails> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 1.h, bottom: 0.5.h),
            child: InkWell(
              child: Container(
                height: 17.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(1.h),
                ),
                child: Padding(
                  padding: EdgeInsets.all(0.2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.colorGrey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(1.h)),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(1.h),
                              child: Image.asset(
                                AppImages.course,
                                fit: BoxFit.cover,
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
                            width: 68.w,
                            child: Text(
                                "Flutter & Dart - The Complete Guide Developement Course with Dart ",
                                maxLines: 2,
                                style: AppStyle.textcatsubtitle
                                    .copyWith(fontSize: 15.sp)),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          SizedBox(
                            width: 65.w,
                            child: Text("Rahul Shetty",
                                maxLines: 1, style: AppStyle.textsubsubtitle),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.downloading_outlined,
                                size: 2.h,
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              Text("378 lectures downloaded",
                                  maxLines: 1, style: AppStyle.textsubsubtitle),
                            ],
                          ),
                          // Seekbar(),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          SizedBox(
                            width: 65.w,
                            child: Text("20% complete",
                                maxLines: 1, style: AppStyle.textsubsubtitle),
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Text("Start Course",
                              style: AppStyle.textsubsubtitle.copyWith(
                                  color: AppColors.appPrimarycolor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
