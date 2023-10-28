import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appimages.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/ratingstar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchUI extends StatefulWidget {
  const SearchUI({super.key});

  @override
  State<SearchUI> createState() => _SearchUIState();
}

class _SearchUIState extends State<SearchUI> {
  double ratingdata = 3.0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            child: Column(
              children: [
                Container(
                  height: 12.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(1.h),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(1.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                  AppImages.pic1,
                                  fit: BoxFit.cover,
                                  height: 8.h,
                                  width: 8.h,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              child: SizedBox(
                                width: 65.w,
                                child: Text(
                                    "Flutter with dart in This Free 7-Hour Course Let us enroll this course with scratch asdfghjkl",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppStyle.textcatsubtitle
                                        .copyWith(fontSize: 16.sp)),
                              ),
                            ),
                            // SizedBox(
                            //   height: 0.5.h,
                            // ),
                            // Text(
                            //   "John Morley",
                            //   style: AppStyle.textsubsubtitle.copyWith(
                            //       color: AppColors.colorBlack, fontSize: 13.sp),
                            // ),
                            SizedBox(
                              height: 0.8.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "5.0",
                                  style: AppStyle.textsubtitle.copyWith(
                                      color: Colors.black, fontSize: 14.sp),
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
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
                                SizedBox(
                                  width: 1.w,
                                ),
                                Text(
                                  "(678)",
                                  style: AppStyle.textsubtitle.copyWith(
                                      color: Colors.grey, fontSize: 14.sp),
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
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "\$50.00 ",
                                  style: AppStyle.textcatsubtitle.copyWith(
                                      color: AppColors.appPrimarycolor,
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
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ],
            ),
          );
        });
  }
}
