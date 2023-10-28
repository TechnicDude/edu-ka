import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appimages.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/ratingstar.dart';
import 'package:edukaapp/utils/seekbarui.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllCourseUI extends StatefulWidget {
  const AllCourseUI({super.key});

  @override
  State<AllCourseUI> createState() => _AllCourseUIState();
}

class _AllCourseUIState extends State<AllCourseUI> {
  double ratingdata = 4.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            itemCount: 4,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: 1.h, bottom: 0.5.h),
                child: InkWell(
                  child: Container(
                    height: 12.h,
                    decoration: BoxDecoration(
                      color: Colors.white12,
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
                                width: 70.w,
                                child: Text(
                                    "Flutter & Dart - The Complete Guide in Developement Course with scratch ",
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
                                    maxLines: 1,
                                    style: AppStyle.textsubsubtitle),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "4.9",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppStyle.textsubsubtitle
                                            .copyWith(color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          StarRating(
                                            rating: ratingdata,
                                            callback: (value) {
                                              setState(() {
                                                ratingdata = value;
                                              });
                                            },
                                            onRatingChanged: (ratings) {},
                                            color: Colors.amber,
                                            size: 2.h,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text(
                                        "(234,677)",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppStyle.textsubsubtitle
                                            .copyWith(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "USD: ",
                                    style: AppStyle.textcatsubtitle.copyWith(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "\$199.00",
                                    style: AppStyle.textcatsubtitle.copyWith(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }
}
