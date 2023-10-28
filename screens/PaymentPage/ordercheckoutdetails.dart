import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appimages.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Ordercheckoutdetails extends StatefulWidget {
  const Ordercheckoutdetails({super.key});

  @override
  State<Ordercheckoutdetails> createState() => _OrdercheckoutdetailsState();
}

class _OrdercheckoutdetailsState extends State<Ordercheckoutdetails> {
  double ratingdata = 4.0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const PageScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                top: 1.h,
              ),
              child: InkWell(
                child: Container(
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(1.h),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(0.2.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
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
                                  AppImages.course1,
                                  fit: BoxFit.cover,
                                  height: 5.h,
                                  width: 5.h,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            SizedBox(
                              width: 55.w,
                              child: Text(
                                  "Learn Python: The Complete Python Programming Course",
                                  maxLines: 3,
                                  style: AppStyle.textcatsubtitle
                                      .copyWith(fontSize: 15.sp)),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\$499",
                              style: AppStyle.textcatsubtitle.copyWith(
                                fontSize: 15.sp,
                                color: AppColors.colorBlack,
                              ),
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
              ),
            );
          }),
    );
  }
}
