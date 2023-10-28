import 'package:edukaapp/screens/myCourses/components/AllCoursesWidgets/AllcourseListdetails.dart';
import 'package:edukaapp/screens/myCourses/components/ArchivedCourse/archivedCourses.dart';
import 'package:edukaapp/screens/myCourses/components/DownloadCourse/downloadedCourses.dart';
import 'package:edukaapp/screens/myCourses/components/FavoritedCourse/favoritedCourse.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MycourseHistorytext extends StatefulWidget {
  const MycourseHistorytext({super.key});

  @override
  State<MycourseHistorytext> createState() => _MycourseHistorytextState();
}

bool favorited = false;
bool archived = false;
bool downloaded = false;
bool allcourse = true;

class _MycourseHistorytextState extends State<MycourseHistorytext> {

  int selectedIndex = 0;

  var selectedPage = [
    AllCourseListDetails(),
     DownloadedCourse(),
    ArchivedCourse(),
    FavoriteCourse()
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 6.h,
        child: ListView.builder(
            itemCount: 1,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 0.5.h, right: 0.5.h),
                child: Row(
                  children: [
                    InkWell(

                      onTap: () {
                        setState(() {
                          favorited = false;
                          archived = false;
                          downloaded = false;
                          allcourse = true;
                        });
                        selectedIndex = index;
                      },
                      child: Container(
                        height: 5.h,
                        decoration: BoxDecoration(
                          color: allcourse ? Colors.black : Colors.transparent,
                          borderRadius: BorderRadius.circular(3.h),
                          border:
                              Border.all(color: AppColors.colorBlack, width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(1, 1),
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 1.h, right: 1.h),
                              child: Text("All Course",
                                  style: AppStyle.texttitle.copyWith(
                                    color:
                                        allcourse ? Colors.white : Colors.black,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          favorited = false;
                          archived = false;
                          downloaded = true;
                          allcourse = false;

                        });
                        selectedIndex = index;
                      },
                      child: Container(
                        height: 5.h,
                        decoration: BoxDecoration(
                          color: downloaded ? Colors.black : Colors.transparent,
                          borderRadius: BorderRadius.circular(3.h),
                          border:
                              Border.all(color: AppColors.colorBlack, width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(1, 1),
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 1.h, right: 1.h),
                              child: Text("Downloaded",
                                  style: AppStyle.texttitle.copyWith(
                                    color: downloaded
                                        ? Colors.white
                                        : Colors.black,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          favorited = false;
                          archived = true;
                          downloaded = false;
                          allcourse = false;
                        });
                        selectedIndex = index;
                      },
                      child: Container(
                        height: 5.h,
                        decoration: BoxDecoration(
                          color: archived ? Colors.black : Colors.transparent,
                          borderRadius: BorderRadius.circular(3.h),
                          border:
                              Border.all(color: AppColors.colorBlack, width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(1, 1),
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 1.h, right: 1.h),
                              child: Text("Archived",
                                  style: AppStyle.texttitle.copyWith(
                                    color:
                                        archived ? Colors.white : Colors.black,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          favorited = true;
                          archived = false;
                          downloaded = false;
                          allcourse = false;
                        });
                        selectedIndex = index;
                      },
                      child: Container(
                        height: 5.h,
                        decoration: BoxDecoration(
                          color: favorited ? Colors.black : Colors.transparent,
                          borderRadius: BorderRadius.circular(3.h),
                          border:
                              Border.all(color: AppColors.colorBlack, width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(1, 1),
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 1.h, right: 1.h),
                              child: Text("Favorited",
                                  style: AppStyle.texttitle.copyWith(
                                    color:
                                        favorited ? Colors.white : Colors.black,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //  if (allcourse) FavoriteCourse(),
                  ],
                ),
              );
            }));
  }
}



               // custombuttonwidget("    All    "),
               // custombuttonwidget("Downloaded"),
                //custombuttonwidget("Archived"),
                //custombuttonwidget("Favorited"),
             // ],
            //);
            // return Row(
            //   children: [
            //     custombuttonwidget("    All    "),
            //     custombuttonwidget("Downloaded"),
            //     custombuttonwidget("Archived"),
            //     custombuttonwidget("Favorited"),
            //   ],
            // );
//           }),
//     );
//   }
//   custombuttonwidget(String btnval) {
//     return    
//     Padding(
//       padding: EdgeInsets.only(left: 0.5.h, right: 0.5.h),
//       child: InkWell(
//           onTap: () {
//                                     for (int i = 0; i < check.length; i++) {
//                                       setState(() {
//                                         check[i] = false;
//                                       });
//                                     }
//                                     setState(() {
//                                       check[index] = true;
//                                     });},
//         child: Container(
//           height: 5.h,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(3.h),
//             border: Border.all(color: AppColors.colorBlack, width: 2),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.1),
//                 spreadRadius: 1,
//                 blurRadius: 1,
//                 offset: Offset(1, 1),
//               )
//             ],
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: EdgeInsets.all(0.5.h),
//                 child: Text(btnval,
//                     style: AppStyle.texttitle
//                         .copyWith(color: AppColors.colorBlack)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }