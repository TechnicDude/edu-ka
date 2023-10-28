import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/simplebutton.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../localization/Language/languages.dart';

class OurPackage extends StatefulWidget {
  const OurPackage({super.key});

  @override
  State<OurPackage> createState() => _OurPackageState();
}

class _OurPackageState extends State<OurPackage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: AppColors.colorBlack,
          ),
          backgroundColor: Colors.white.withOpacity(0.95),
          elevation: 0,
          title: Text(Languages.of(context)!.subscriptions,
              style: AppStyle.mytexttitle),
        ),
        body: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            ListView.builder(
              itemCount: 2,
              itemBuilder: (context, i) {
                return Padding(
                  padding: EdgeInsets.all(2.h),
                  child: Container(
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: AppColors.colorWhite,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 6.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(2.w)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 4.h),
                          child: Row(
                            children: [
                              Stack(
                                fit: StackFit.loose,
                                clipBehavior: Clip.none,
                                children: [
                                  Text(
                                    "499.00",
                                    style: AppStyle.texttitle.copyWith(
                                        color: Colors.black, fontSize: 18.sp),
                                  ),
                                  Positioned(
                                    top: -10,
                                    left: -5.w,
                                    child: Text(
                                      "\$",
                                      style: AppStyle.textsubtitle.copyWith(
                                          color: Colors.black, fontSize: 18.sp),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 2.h),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.done_outline_rounded,
                                    size: 2.h,
                                    color: AppColors.appPrimarycolor,
                                  ),
                                  Text(
                                    "Incoporateion",
                                    style: AppStyle.textsubsubtitle.copyWith(
                                        color: Colors.black, fontSize: 16.sp),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.done_outline_rounded,
                                    size: 2.h,
                                    color: AppColors.appPrimarycolor,
                                  ),
                                  Text(
                                    "2 Course",
                                    style: AppStyle.textsubsubtitle.copyWith(
                                        color: Colors.black, fontSize: 16.sp),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.done_outline_rounded,
                                    size: 2.h,
                                    color: AppColors.appPrimarycolor,
                                  ),
                                  Text(
                                    "Offers",
                                    style: AppStyle.textsubsubtitle.copyWith(
                                        color: Colors.black, fontSize: 16.sp),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Padding(
                          padding: EdgeInsets.all(2.h),
                          child: SimpleButton(
                            text: "Proceed to payment",
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            // if (showpop)
            //   Container(
            //     height: 100.h,
            //     width: 100.w,
            //     color: Colors.transparent,
            //     child: HomeLoginPopScreens(
            //       callback: (value) {
            //         print(value);
            //         setState(() {
            //           showpop = false;
            //         });
            //       },
            //     ),
            // ),
          ],
        ));
  }
}
