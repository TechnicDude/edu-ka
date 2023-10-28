import 'package:edukaapp/page_routes/routes.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appimages.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/ratingstar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EnrollCourseCard extends StatefulWidget {
  const EnrollCourseCard({
    Key? key,
  }) : super(key: key);

  @override
  State<EnrollCourseCard> createState() => _EnrollCourseCardState();
}

class _EnrollCourseCardState extends State<EnrollCourseCard> {
  double ratingdata = 3.0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      width: 100.w,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.courseDetailsScreen);
            },
            child: Padding(
              padding: EdgeInsets.all(1.h),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(1.h)),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 12.h,
                      width: 42.w,
                      decoration: BoxDecoration(
                        color: AppColors.colorWhite,
                        borderRadius: BorderRadius.all(Radius.circular(1.h)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(1.h)),
                        child: Image.asset(
                          AppImages.course,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 1.h,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            child: SizedBox(
                              width: 40.w,
                              child: Text(
                                  "Learn React JS in This Free 7-Hour Course",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppStyle.textcatsubtitle
                                      .copyWith(fontSize: 16.sp)),
                            ),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Text(
                            "John Morley",
                            style: AppStyle.textsubsubtitle.copyWith(
                                color: AppColors.colorBlack, fontSize: 13.sp),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "3.0",
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
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
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
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
