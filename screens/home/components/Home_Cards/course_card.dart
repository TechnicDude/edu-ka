import 'package:edukaapp/api/api.dart';
import 'package:edukaapp/model/api_models/allcourselist_model.dart';
import 'package:edukaapp/page_routes/routes.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appimages.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/networkimages.dart';
import 'package:edukaapp/utils/ratingstar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CourseCard extends StatefulWidget {
  final List<AllCourselistData> allcourselistdata;
  final String type;
  final String searchString;
  const CourseCard(
      {Key? key,
      required this.allcourselistdata,
      required this.type,
      required this.searchString})
      : super(key: key);

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  double ratingdata = 3.0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26.h,
      width: 100.w,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.allcourselistdata.length,
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
                        child: NetWorkImageScreen(
                          image: (widget.allcourselistdata[index].icon!),
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
                                  widget.allcourselistdata[index].title!,
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
                          // //  "John Morley",
                          //   style: AppStyle.textsubsubtitle.copyWith(
                          //       color: AppColors.colorBlack, fontSize: 13.sp),
                          // ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                widget.allcourselistdata[index].webinarsCount!
                                    .toString(),
                                // "3.0",
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
