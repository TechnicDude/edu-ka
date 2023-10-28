import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CheckoutCart extends StatefulWidget {
  final String? text;
  final Function()? onTap;
  const CheckoutCart({
    Key? key,
    this.text,
    this.onTap,
  }) : super(key: key);

  @override
  State<CheckoutCart> createState() => _CheckoutCartState();
}

class _CheckoutCartState extends State<CheckoutCart> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: 12.h,
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
                padding: const EdgeInsets.all(8.0),
                child: Container(
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
                      style: AppStyle.texttitle.copyWith(color: Colors.white),
                    ),
                  )),
                ),
              ),
            ],
          ),
        ));
  }
}
