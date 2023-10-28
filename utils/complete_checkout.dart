import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CompleteCheckout extends StatefulWidget {
  final String? text;
  final Function()? onTap;
  const CompleteCheckout({
    Key? key,
    this.text,
    this.onTap,
  }) : super(key: key);

  @override
  State<CompleteCheckout> createState() => _CompleteCheckoutState();
}

class _CompleteCheckoutState extends State<CompleteCheckout> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: 24.h,
          width: 100.w,
          decoration: BoxDecoration(
            color: AppColors.colorWhite,
            // borderRadius: BorderRadius.circular(1.h),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 4,
                blurRadius: 10,
                offset: Offset(6, 1),
              )
            ],
          ),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 1.5.h, left: 2.h, right: 2.h, bottom: 1.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total:",
                            style: AppStyle.mytexttitle.copyWith(
                              color: AppColors.colorBlack,
                            )),
                        Text("\$1,497", style: AppStyle.mytexttitle)
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "By completing your purchase you agree to these:",
                          style: AppStyle.textsubsubtitle
                              .copyWith(color: AppColors.colorGrey),
                        ),
                        Text(
                          "Terms of Service.",
                          style: AppStyle.textsubsubtitle
                              .copyWith(color: AppColors.appPrimarycolor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 6.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        color: AppColors.appPrimarycolor,
                        borderRadius: BorderRadius.circular(1.h),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 10,
                            offset: Offset(-1, 3),
                          )
                        ],
                      ),
                      child: Center(
                          child: Padding(
                        padding: EdgeInsets.only(left: 2.w, right: 2.w),
                        child: Text(
                          widget.text ?? '',
                          style:
                              AppStyle.texttitle.copyWith(color: Colors.white),
                        ),
                      )),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "30-Day Money-Back Guarantee",
                      style: AppStyle.textsubsubtitle
                          .copyWith(color: AppColors.colorGrey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
