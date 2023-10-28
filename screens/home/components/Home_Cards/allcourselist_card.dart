import 'package:edukaapp/api/api.dart';
import 'package:edukaapp/model/api_models/allcourselist_model.dart';
import 'package:edukaapp/model/api_models/popularlist_model.dart';
import 'package:edukaapp/page_routes/routes.dart';
import 'package:edukaapp/screens/coursedetails/CourseDetailsScreen.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/networkimages.dart';
import 'package:edukaapp/utils/ratingstar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllCourseCard extends StatefulWidget {
  final List<AllCourselistData>? allcourselistdata;
  final String type;
  final String searchString;
  const AllCourseCard(
      {Key? key,
      required this.allcourselistdata,
      required this.type,
      required this.searchString})
      : super(key: key);

  @override
  State<AllCourseCard> createState() => _AllCourseCardState();
}

class _AllCourseCardState extends State<AllCourseCard> {
  double ratingdata = 4.0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      width: 100.w,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.allcourselistdata!.length,
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
                          image: (APIURL.bannerimage +
                              widget.allcourselistdata![index].icon!),
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
                                  widget.allcourselistdata![index].title!,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppStyle.textcatsubtitle
                                      .copyWith(fontSize: 16.sp)),
                            ),
                          ),
                          // SizedBox(
                          //   height: 0.5.h,
                          // ),
                          // Text(
                          //   widget.allcourselistdata![index].!
                          //       .toString(),
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
                                widget.allcourselistdata![index]
                                    .subCategories![index].webinarsCount!
                                    .toString(),
                                // "4.4",
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

                              // Text(
                              //   "(285)",
                              //   style: AppStyle.textsubtitle.copyWith(
                              //       color: Colors.black, fontSize: 12.sp),
                              // ),
                              // SizedBox(
                              //   width: 1.w,
                              // ),
                            ],
                          ),
                          // SizedBox(
                          //   height: 1.h,
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     Text(
                          //       "USD: ",
                          //       style: AppStyle.textcatsubtitle.copyWith(
                          //           color: Colors.black,
                          //           fontWeight: FontWeight.bold),
                          //     ),
                          //     Text(
                          //       "\$ ",
                          //       style: AppStyle.textcatsubtitle.copyWith(
                          //         color: AppColors.appPrimarycolor,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          // Text(
                          //   widget.popularcoursedata![index].price!
                          //       .toString(),
                          //   style: AppStyle.textcatsubtitle.copyWith(
                          //     color: AppColors.appPrimarycolor,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          //     )
                          //   ],
                          // ),
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
