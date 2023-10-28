import 'dart:io';

import 'package:edukaapp/page_routes/routes.dart';
import 'package:edukaapp/screens/PaymentPage/cartcourses.dart';
import 'package:edukaapp/utils/DetailspageBuyNow.dart';
import 'package:edukaapp/utils/VideoSlidderScreen.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appimages.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/ratingstar.dart';
import 'package:edukaapp/utils/simplebutton.dart';
import 'package:edukaapp/utils/simplebuttonoutline.dart';
import 'package:edukaapp/utils/simplebuttontwo.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../localization/Language/languages.dart';

class CourseDetailsScreen extends StatefulWidget {
  const CourseDetailsScreen({super.key});

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  double ratingdata = 3.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DetailspageBuyNow(
        price: "\$499.00",
        text: Languages.of(context)!.buynow,
        onTap: () {
          Navigator.pushNamed(context, Routes.addtoCartScreen);
        },
      ),
      backgroundColor: Colors.white.withOpacity(0.95),
      body: RefreshIndicator(
        displacement: 40.h,
        backgroundColor: Colors.white,
        color: AppColors.appPrimarycolor,
        strokeWidth: 2,
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: () async {
          await Future.delayed(Duration(milliseconds: 2000));
        },
        child: SafeArea(
            child: Shimmer(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  EdgeInsets.only(top: 1.h, left: 2.h, right: 2.h, bottom: 4.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Platform.isAndroid
                              ? Icons.arrow_back
                              : Icons.arrow_back_ios,
                        ),
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Share.share(
                                    'hey! check out this course https://play.google.com/store/apps/details?id=com.facebook.katana');
                              },
                              child: Icon(Icons.share)),
                          SizedBox(
                            width: 6.w,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.addtoCartScreen);
                              },
                              child: Icon(Icons.shopping_cart_outlined)),
                        ],
                      ),
                    ],
                  ),
                  VideoSliderScreen(),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    width: 90.w,
                    child: Text(
                      "The Complete Flutter Developement Course Bootcamp with Dart Language ",
                      style: AppStyle.texttitle.copyWith(color: Colors.black),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    width: 90.w,
                    child: Text(
                      "Flutter is Google's portable UI toolkit for crafting beautiful, natively compiled applications for mobile, web, and desktop from a single codebase. Flutter ... ",
                      style: AppStyle.textsubtitle
                          .copyWith(color: Colors.grey, fontSize: 15.sp),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "4.6",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyle.textsubtitle
                            .copyWith(color: Colors.black, fontSize: 15.sp),
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
                  SizedBox(height: 1.h),
                  SizedBox(
                    width: 90.w,
                    child: Text(
                      "(47,704 ratings) 165,851 students ",
                      style: AppStyle.textsubsubtitle.copyWith(fontSize: 13.sp),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Created by ",
                        style: AppStyle.textsubsubtitle
                            .copyWith(color: Colors.black, fontSize: 13.5.sp),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        "Mrs. Deepika Mourya",
                        style: AppStyle.textsubsubtitle.copyWith(
                            color: AppColors.appPrimarycolor,
                            fontSize: 13.5.sp),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.report,
                        size: 4.w,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        "Last updated 02/2023",
                        style: AppStyle.textsubsubtitle.copyWith(
                            color: AppColors.colorBlack, fontSize: 13.sp),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.language,
                        size: 4.w,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        "English",
                        style: AppStyle.textsubsubtitle.copyWith(
                            color: AppColors.colorBlack, fontSize: 13.sp),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.closed_caption,
                        size: 4.w,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Row(
                        children: [
                          Text(
                            "English, Spenish ",
                            style: AppStyle.textsubsubtitle.copyWith(
                                color: AppColors.colorBlack, fontSize: 13.sp),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "23 more ",
                            style: AppStyle.textsubsubtitle.copyWith(
                                color: AppColors.appPrimarycolor,
                                fontSize: 13.sp),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "USD : ",
                        style: AppStyle.onbaordtitle.copyWith(
                          color: AppColors.colorBlack,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "\$499.00 ",
                        style: AppStyle.onbaordtitle.copyWith(
                          color: AppColors.appPrimarycolor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Center(
                    child: SimpleButton(
                      text: Languages.of(context)!.buynow,
                      onTap: () {
                        Navigator.pushNamed(context, Routes.checkoutScreen);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 1.2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: SimpleButtontwo(
                            text: Languages.of(context)!.addtocart,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.addtoCartScreen);
                            }),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Center(
                        child: SimpleButtontwo(
                          text: Languages.of(context)!.addtofavorite,
                          onTap: () {
                            Navigator.pushNamed(context, Routes.favoriteCourse);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    "What you'll learn",
                    style: AppStyle.texttitle.copyWith(color: Colors.black),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    width: 90.w,
                    child: Text(
                      "✔ Build beautiful, fast and native-quality apps with Flutter  \n\n✔ Become a fully-fledged Flutter developer \n\n✔ Build iOS and Android apps with just one codebase \n\n✔ Build iOS and Android apps using just one programming language (Dart)",
                      style: AppStyle.textsubsubtitle
                          .copyWith(color: Colors.black, fontSize: 15.sp),
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Show more",
                    style: AppStyle.texttitle
                        .copyWith(color: AppColors.appPrimarycolor),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    width: 90.w,
                    child: Text(
                      "Curriculum ",
                      style: AppStyle.texttitle.copyWith(color: Colors.black),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "18",
                        style:
                            AppStyle.textsubsubtitle.copyWith(fontSize: 14.sp),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(
                        "sections •",
                        style:
                            AppStyle.textsubsubtitle.copyWith(fontSize: 14.sp),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(
                        "218",
                        style:
                            AppStyle.textsubsubtitle.copyWith(fontSize: 14.sp),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(
                        "lectures •",
                        style:
                            AppStyle.textsubsubtitle.copyWith(fontSize: 14.sp),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(
                        "28h 47m",
                        style:
                            AppStyle.textsubsubtitle.copyWith(fontSize: 14.sp),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(
                        "total length",
                        style:
                            AppStyle.textsubsubtitle.copyWith(fontSize: 14.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 90.w,
                        child: Text(
                          "•Section: 1 ➤Intoduction to flutter , fast and native-quality apps with Flutter  \n\n•Section: 2 ➤Intoduction to widget Become a fully-fledged Flutter developer \n\n•Section: 3 ➤Android apps with just one codebase \n\n•Section: 4 ➤iOS and Android apps using just one programming language (Dart)",
                          style: AppStyle.textsubsubtitle
                              .copyWith(color: Colors.black, fontSize: 15.sp),
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      //  Icon(Icons.add),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),

                  Center(
                    child: SimpleButtonOutline(
                      text: "12 more sections",
                    ),
                  ),

                  SizedBox(
                    height: 4.h,
                  ),
                  SizedBox(
                    width: 90.w,
                    child: Text(
                      "This course includes",
                      style: AppStyle.texttitle.copyWith(color: Colors.black),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.video_library_outlined,
                        size: 4.w,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        "29 hours on-demand video",
                        style: AppStyle.textsubsubtitle
                            .copyWith(color: Colors.black, fontSize: 15.sp),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(height: 1.5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.download,
                        size: 4.w,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        "49 downloadable resources",
                        style: AppStyle.textsubsubtitle
                            .copyWith(color: Colors.black, fontSize: 15.sp),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(height: 1.5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.article_outlined,
                        size: 4.w,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        "86 articles",
                        style: AppStyle.textsubsubtitle
                            .copyWith(color: Colors.black, fontSize: 15.sp),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(height: 1.5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.mobile_screen_share_sharp,
                        size: 4.w,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        "8 coding exercises",
                        style: AppStyle.textsubsubtitle
                            .copyWith(color: Colors.black, fontSize: 15.sp),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(height: 1.5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.card_membership_rounded,
                        size: 4.w,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        "Certificate of completion",
                        style: AppStyle.textsubsubtitle
                            .copyWith(color: Colors.black, fontSize: 15.sp),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    "Requirments",
                    style: AppStyle.texttitle.copyWith(color: Colors.black),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 90.w,
                        child: Text(
                          "• No programming experience needed - I'll teach you everything you need to know \n\n• A computer with access to the internet \n\n• No paid software required \n\n• I'll walk you through, step-by-step how to get all the software installed and set up ",
                          style: AppStyle.textsubsubtitle
                              .copyWith(color: Colors.black, fontSize: 15.sp),
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      //  Icon(Icons.add),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    "Description",
                    style: AppStyle.texttitle.copyWith(color: Colors.black),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 90.w,
                        child: Text(
                          "Welcome to the Complete Web Development Bootcamp, the only course you need to learn to code and become a full-stack web developer. With 150,000+ ratings and a 4.8 average, my Web Development course is one of the HIGHEST RATED courses in the history of Udemy! \n\n At 65+ hours, this Web Development course is without a doubt the most comprehensive web development course available online. Even if you have zero programming experience, this course will take you from beginner to mastery.",
                          style: AppStyle.textsubsubtitle
                              .copyWith(color: Colors.black, fontSize: 15.sp),
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      //  Icon(Icons.add),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Show more",
                    style: AppStyle.texttitle
                        .copyWith(color: AppColors.appPrimarycolor),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    "Students also bought",
                    style: AppStyle.texttitle.copyWith(color: Colors.black),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),

                  CartCourses(),

                  // add here student bought ui

                  SizedBox(
                    height: 3.h,
                  ),
                  Center(
                    child: SimpleButtonOutline(
                      text: "See all",
                    ),
                  ),

                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    "Instructor",
                    style: AppStyle.texttitle.copyWith(color: Colors.black),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),

                  Text(
                    "Mrs. Deepika Mourya",
                    style: AppStyle.textsubtitle
                        .copyWith(color: AppColors.appPrimarycolor),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "Developer and Lead Instructor",
                    style: AppStyle.textsubtitle
                        .copyWith(color: AppColors.colorGrey),
                  ),

                  SizedBox(
                    height: 1.h,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 4.h,
                            backgroundImage: AssetImage(
                              AppImages.auther,
                            )),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "4.7 Instructor Rating",
                            style: AppStyle.textsubsubtitle
                                .copyWith(color: Colors.black, fontSize: 15.sp),
                          ),
                          SizedBox(
                            height: 0.5,
                          ),
                          Text("619,668 Reviews",
                              style: AppStyle.textsubsubtitle.copyWith(
                                  color: Colors.black, fontSize: 15.sp)),
                          SizedBox(
                            height: 0.5,
                          ),
                          Text(
                            "1,955,950 Students",
                            style: AppStyle.textsubsubtitle
                                .copyWith(color: Colors.black, fontSize: 15.sp),
                          ),
                          SizedBox(
                            height: 0.5,
                          ),
                          Text(
                            "9 Courses",
                            style: AppStyle.textsubsubtitle
                                .copyWith(color: Colors.black, fontSize: 15.sp),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                        ],
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      SizedBox(
                        width: 90.w,
                        child: Text(
                          "I'm Deepika, I'm a developer with a passion for teaching. I'm the lead instructor at the London App Brewery, London's leading Programming Bootcamp. I've helped hundreds of thousands of students learn to code and change their lives by becoming a developer. I've been invited by companies such as Twitter, Facebook and Google to teach their employees.",
                          style: AppStyle.textsubsubtitle
                              .copyWith(color: Colors.black, fontSize: 15.sp),
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      //  Icon(Icons.add),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Show more",
                    style: AppStyle.texttitle
                        .copyWith(color: AppColors.appPrimarycolor),
                  ),

                  SizedBox(
                    height: 3.h,
                  ),
                  Center(
                    child: SimpleButtonOutline(
                      text: "View Profile",
                    ),
                  ),

                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    "Student Feedback",
                    style: AppStyle.texttitle.copyWith(color: Colors.black),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "4.6",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyle.textsubtitle
                            .copyWith(color: Colors.black, fontSize: 20.sp),
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
                            size: 4.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    "course rating",
                    style: AppStyle.textsubtitle
                        .copyWith(color: Colors.black, fontSize: 16.sp),
                  ),

                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    "David E.Barrera",
                    style: AppStyle.textsubtitle
                        .copyWith(color: Colors.black, fontSize: 16.sp),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                            size: 4.h,
                          ),
                        ],
                      ),
                      Text(
                        "2 month ago",
                        style: AppStyle.textsubtitle
                            .copyWith(color: Colors.grey, fontSize: 14.sp),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 90.w,
                        child: Text(
                          "This is a really good course to take if you are planning to be a web developer. Though some things aren't updated, but you can solve it anyway through the Q&A sections and through reading the documentations.",
                          style: AppStyle.textsubsubtitle
                              .copyWith(color: Colors.black, fontSize: 15.sp),
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      //  Icon(Icons.add),
                    ],
                  ),

                  SizedBox(
                    height: 4.h,
                  ),

                  Center(
                    child: SimpleButtonOutline(
                      text: "See More Reviews",
                    ),
                  ),
                ],
              ),
            ),
          ),

          duration: Duration(seconds: 3),
          // This is NOT the default value. Default value: Duration(seconds: 0)
          interval: Duration(seconds: 5),
          // This is the default value
          color: Colors.white,
          // This is the default value
          colorOpacity: 0.3,
          // This is the default value
          enabled: true,
          // This is the default value
          direction: ShimmerDirection.fromLTRB(),
        )),
      ),
    );
  }
}
