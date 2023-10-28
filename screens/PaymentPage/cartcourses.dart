import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appimages.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/ratingstar.dart';

import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class CartCourses extends StatefulWidget {
  const CartCourses({super.key});

  @override
  State<CartCourses> createState() => _CartCoursesState();
}

class _CartCoursesState extends State<CartCourses> {
  double ratingdata = 4.0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const PageScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              child: Container(
                height: 22.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(1.h),
                ),
                child: Padding(
                  padding: EdgeInsets.all(0.2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 55.w,
                                    child: Text(
                                        "Dart and Flutter:The Complete Guide Developement Course with Dart ",
                                        maxLines: 3,
                                        style: AppStyle.textcatsubtitle
                                            .copyWith(fontSize: 15.sp)),
                                  ),
                                ],
                              ),
                              SizedBox(height: 0.5.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "4.6",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppStyle.textsubtitle.copyWith(
                                        color: Colors.black, fontSize: 15.sp),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                ],
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              SizedBox(
                                width: 45.w,
                                child: Text("(4,801 ratings)",
                                    maxLines: 1,
                                    style: AppStyle.textsubsubtitle),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              SizedBox(
                                width: 55.w,
                                child: Text(
                                    "31 total hours • 402 lecture • Expert",
                                    maxLines: 1,
                                    style: AppStyle.textsubsubtitle),
                              ),
                              SizedBox(
                                height: 1.2.h,
                              ),
                              Row(
                                children: [
                                  Text("Remove",
                                      style: AppStyle.textsubsubtitle.copyWith(
                                          color: AppColors.appPrimarycolor,
                                          fontSize: 14.sp)),
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Text("Save for Later",
                                      style: AppStyle.textsubsubtitle.copyWith(
                                          color: AppColors.appPrimarycolor,
                                          fontSize: 14.sp)),
                                ],
                              ),
                              SizedBox(
                                height: 1.2.h,
                              ),
                              Text("Move to Wishlist",
                                  style: AppStyle.textsubsubtitle.copyWith(
                                      color: AppColors.appPrimarycolor,
                                      fontSize: 14.sp)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "\$499",
                                style: AppStyle.textcatsubtitle.copyWith(
                                  fontSize: 15.sp,
                                  color: AppColors.appPrimarycolor,
                                ),
                              ),
                              Icon(
                                Icons.sell,
                                size: 2.h,
                                color: AppColors.appPrimarycolor,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            "\$1499",
                            style: AppStyle.textcatsubtitle.copyWith(
                              fontSize: 15.sp,
                              color: AppColors.colorGrey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
