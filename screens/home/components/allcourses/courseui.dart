import 'package:edukaapp/model/api_models/allcourselist_model.dart';
import 'package:edukaapp/page_routes/routes.dart';
import 'package:edukaapp/screens/coursedetails/CourseDetailsScreen.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appimages.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/networkimages.dart';
import 'package:edukaapp/utils/ratingstar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CourseSUI extends StatefulWidget {
  final List<AllCourselistData> allcourselistdata;
  final String type;
  final String searchString;
  const CourseSUI(
      {Key? key,
      required this.allcourselistdata,
      required this.type,
      required this.searchString})
      : super(key: key);

  @override
  State<CourseSUI> createState() => _CourseSUIState();
}

class _CourseSUIState extends State<CourseSUI> {
  double ratingdata = 3.0;
  @override
  Widget build(BuildContext context) {
    // return Wrap(
    //   spacing: 8.0, // gap between adjacent chips
    //   runSpacing: 4.0,
    //   children: <Widget>[
    //     InkWell(
    //       onTap: () {
    //         Navigator.pushNamed(context, Routes.courseDetailsScreen);
    //       },
    //       child: Padding(
    //         padding: EdgeInsets.all(1.h),
    //         child: Container(
    //           decoration: BoxDecoration(
    //             color: AppColors.colorWhite,
    //             borderRadius: BorderRadius.all(Radius.circular(1.h)),
    //             border: Border.all(color: AppColors.colorWhite, width: 1),
    //             boxShadow: [
    //               BoxShadow(
    //                 color: Colors.grey,
    //                 spreadRadius: 1,
    //                 blurRadius: 1,
    //                 offset: Offset(1, 1),
    //               ),
    //             ],
    //           ),
    //           child: Column(
    //             children: [
    //               Container(
    //                 height: 12.h,
    //                 width: 100.w,
    //                 decoration: BoxDecoration(
    //                   color: AppColors.colorWhite.withOpacity(0.5),
    //                   borderRadius: BorderRadius.only(
    //                     topLeft: Radius.circular(1.h),
    //                     topRight: Radius.circular(1.h),
    //                   ),
    //                 ),
    //                 child:
    //                     //  ClipRRect(
    //                     //   borderRadius: BorderRadius.all(Radius.circular(1.h)),
    //                     //   child: NetWorkImageScreen(
    //                     //     image: (widget.allcourselistdata[index].icon!),
    //                     //   ),
    //                     // ),
    //                     ClipRRect(
    //                   borderRadius: BorderRadius.only(
    //                     topLeft: Radius.circular(1.h),
    //                     topRight: Radius.circular(1.h),
    //                   ),
    //                   child: Image.asset(
    //                     AppImages.course,
    //                     fit: BoxFit.fill,
    //                   ),
    //                 ),
    //               ),
    //               Padding(
    //                 padding: EdgeInsets.only(top: 0.5.h, left: 1.h),
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.start,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     FittedBox(
    //                       child: SizedBox(
    //                         width: 40.w,
    //                         child: Text(
    //                             //widget.allcourselistdata[index].title!,

    //                             "Learn to build React apps with scratch",
    //                             maxLines: 2,
    //                             overflow: TextOverflow.ellipsis,
    //                             style: AppStyle.textcatsubtitle
    //                                 .copyWith(fontSize: 16.sp)),
    //                       ),
    //                     ),
    //                     SizedBox(
    //                       height: 1.h,
    //                     ),
    //                     Row(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       children: [
    //                         StarRating(
    //                           rating: ratingdata,
    //                           callback: (value) {
    //                             setState(() {
    //                               ratingdata = value;
    //                             });
    //                           },
    //                           onRatingChanged: (ratings) {},
    //                           color: Colors.amber,
    //                           size: 2.h,
    //                         ),
    //                         SizedBox(
    //                           width: 2.w,
    //                         ),
    //                         Text(
    //                           //  widget.allcourselistdata[index].webinarsCount!
    //                           //  .toString(),
    //                           "4.8",
    //                           maxLines: 1,
    //                           overflow: TextOverflow.ellipsis,
    //                           style: AppStyle.textsubtitle.copyWith(
    //                               color: Colors.black, fontSize: 15.sp),
    //                         ),
    //                         SizedBox(
    //                           width: 1.w,
    //                         ),
    //                       ],
    //                     ),
    //                     SizedBox(
    //                       height: 1.h,
    //                     ),
    //                     Row(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           "USD: ",
    //                           style: AppStyle.textcatsubtitle.copyWith(
    //                               color: Colors.black,
    //                               fontWeight: FontWeight.bold),
    //                         ),
    //                         Text(
    //                           "\$50.00 ",
    //                           style: AppStyle.textcatsubtitle.copyWith(
    //                               color: AppColors.appPrimarycolor,
    //                               fontWeight: FontWeight.bold),
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     )
    //   ],
    // );

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 6,
        crossAxisSpacing: 16,
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 1.8),
      ),
      itemCount: widget.allcourselistdata.length,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.courseDetailsScreen);
          },
          child: Padding(
            padding: EdgeInsets.all(1.h),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.colorWhite,
                borderRadius: BorderRadius.all(Radius.circular(1.h)),
                border: Border.all(color: AppColors.colorWhite, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    height: 12.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: AppColors.colorWhite.withOpacity(0.5),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(1.h),
                        topRight: Radius.circular(1.h),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(1.h),
                        topRight: Radius.circular(1.h),
                      ),
                      //  borderRadius: BorderRadius.all(Radius.circular(1.h)),
                      child: NetWorkImageScreen(
                        image: (widget.allcourselistdata[index].icon!),
                      ),
                    ),
                    // ClipRRect(
                    //   borderRadius: BorderRadius.only(
                    //     topLeft: Radius.circular(1.h),
                    //     topRight: Radius.circular(1.h),
                    //   ),
                    //   child: Image.asset(
                    //     AppImages.course,
                    //     fit: BoxFit.fill,
                    //   ),
                    // ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0.5.h, left: 1.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          child: SizedBox(
                            width: 40.w,
                            child: Text(widget.allcourselistdata[index].title!,

                                // "Learn to build React apps with scratch",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppStyle.textcatsubtitle
                                    .copyWith(fontSize: 16.sp)),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              widget.allcourselistdata[index].webinarsCount!
                                  .toString(),
                              //"4.8",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppStyle.textsubtitle.copyWith(
                                  color: Colors.black, fontSize: 15.sp),
                            ),
                            SizedBox(
                              width: 1.w,
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
    );
  }
}
