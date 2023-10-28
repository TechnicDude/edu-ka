import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appimages.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InstructureProfile extends StatefulWidget {
  const InstructureProfile({super.key});

  @override
  State<InstructureProfile> createState() => _InstructureProfileState();
}

class _InstructureProfileState extends State<InstructureProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.colorBlack,
        ),
        backgroundColor: AppColors.colorWhite,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 2.w,
            ),
            Text(
              "Instructractor Profile",
              style: AppStyle.texttitle.copyWith(color: Colors.black),
            ),
            Container(
              height: 3.5.h,
              width: 15.w,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                border: Border.all(color: Colors.black12, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(1, 2),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  "Lv 25",
                  style: AppStyle.texttitle.copyWith(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        displacement: 40.h,
        backgroundColor: Colors.white,
        color: AppColors.appPrimarycolor,
        strokeWidth: 2,
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: () async {
          await Future.delayed(Duration(milliseconds: 2000));
        },
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(2.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 12.h,
                      child: GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 6.h,
                            backgroundImage: AssetImage(
                              AppImages.profileinst,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "Dianne Russell",
                      style: AppStyle.texttitle.copyWith(color: Colors.black),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.location_on,
                        size: 20.0,
                        color: AppColors.colorGrey,
                      ),
                      label: Text(
                        "Noida City",
                        style: AppStyle.textsubsubtitle
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 4.h,
                          child: GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 2.h,
                                backgroundImage: AssetImage(
                                  AppImages.facebook,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                          child: GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 2.h,
                                backgroundImage: AssetImage(
                                  AppImages.twitter,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                          child: GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 2.h,
                                backgroundImage: AssetImage(
                                  AppImages.github,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                          child: GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 2.h,
                                backgroundImage: AssetImage(
                                  AppImages.instagram,
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Container(
                      height: 7.h,
                      decoration: BoxDecoration(
                        color: AppColors.appPrimarycolor,
                        borderRadius: BorderRadius.all(Radius.circular(5.h)),
                        border: Border.all(
                            color: AppColors.appPrimarycolor, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(1, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "80",
                                style: AppStyle.textsubtitle
                                    .copyWith(color: Colors.black),
                              ),
                              Text(
                                "Courses",
                                style: AppStyle.textsubsubtitle
                                    .copyWith(color: Colors.black),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "110",
                                style: AppStyle.textsubtitle
                                    .copyWith(color: Colors.black),
                              ),
                              Text(
                                "Enrollement",
                                style: AppStyle.textsubsubtitle
                                    .copyWith(color: Colors.black),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "1500",
                                style: AppStyle.textsubtitle
                                    .copyWith(color: Colors.black),
                              ),
                              Text(
                                "Following",
                                style: AppStyle.textsubsubtitle
                                    .copyWith(color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "About",
                              style: AppStyle.texttitle
                                  .copyWith(color: Colors.black),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            FittedBox(
                              child: SizedBox(
                                width: 90.w,
                                child: Text(
                                  "We're an education technology company with a mission to elevate student success, \namplify the power of teaching, and inspire everyone to learn together. \nYou can add the page to the student to-do list by clicking the Add to student to-do checkbox [2]. When you add a page to the student to-do, the to-do displays in the student's to-do list as well as the in the course calendar and students' course sidebar To Do list. \n\nYou can add the page to the student to-do list by clicking the Add to student to-do checkbox [2]. When you add a page to the student to-do, the to-do displays in the student's to-do list as well as the in the course calendar and students' course sidebar To Do list.",
                                  style: AppStyle.textsubtitle.copyWith(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
