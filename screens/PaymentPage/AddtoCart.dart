import 'package:edukaapp/page_routes/routes.dart';

import 'package:edukaapp/screens/PaymentPage/cartcourses.dart';

import 'package:edukaapp/utils/appcolors.dart';

import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/checkout_cart.dart';

import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../localization/Language/languages.dart';

class AddtoCartScreen extends StatefulWidget {
  const AddtoCartScreen({super.key});

  @override
  State<AddtoCartScreen> createState() => _AddtoCartScreenState();
}

class _AddtoCartScreenState extends State<AddtoCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CheckoutCart(
        text: Languages.of(context)!.checkout,
        onTap: () {
          Navigator.pushNamed(context, Routes.checkoutScreen);
        },
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.colorBlack,
        ),
        backgroundColor: Colors.white.withOpacity(0.95),
        elevation: 0,
        title: Text(Languages.of(context)!.mycart, style: AppStyle.mytexttitle),
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
        child: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
          padding: EdgeInsets.only(
              top: 1.h, left: 1.5.h, right: 1.5.h, bottom: 1.5.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Total:  ",
                      style: AppStyle.textsubtitle.copyWith(
                          color: AppColors.colorGrey, fontSize: 16.sp)),
                  Text("\$1,497 ",
                      style: AppStyle.mytexttitle.copyWith(
                          color: AppColors.colorBlack, fontSize: 19.sp)),
                  Text("81% off",
                      style: AppStyle.textsubtitle.copyWith(
                        color: AppColors.colorBlack,
                        fontSize: 16.sp,
                      )),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Hide Codes",
                      style: AppStyle.textsubtitle.copyWith(
                        color: AppColors.appPrimarycolor,
                        fontSize: 16.sp,
                        decoration: TextDecoration.underline,
                      )),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Divider(
                color: Colors.grey.withOpacity(0.4),
                thickness: 1,
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Promotions",
                      style: AppStyle.textsubtitle.copyWith(
                        color: AppColors.colorBlack,
                      )),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.close,
                    size: 2.5.h,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text("FT3VGHBKND34",
                      style: AppStyle.textsubtitle.copyWith(
                        color: AppColors.colorGrey,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text("is applied",
                      style: AppStyle.textsubtitle.copyWith(
                        color: AppColors.colorGrey,
                      )),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 5.h,
                    width: 70.w,
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(2.w)),
                            borderSide: BorderSide(color: Colors.black)),
                        filled: true,
                        contentPadding:
                            EdgeInsets.only(bottom: 1.h, left: 1.h, right: 1.h),
                        labelText: "Enter Coupen",
                      ),
                    ),
                  ),
                  Container(
                    height: 5.h,
                    width: 20.w,
                    child: Center(
                      child: Text("Apply",
                          style: AppStyle.textsubtitle.copyWith(
                            color: AppColors.colorWhite,
                          )),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.appPrimarycolor,
                      borderRadius: BorderRadius.all(Radius.circular(2.w)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("2 Courses in Cart",
                      style: AppStyle.textsubtitle.copyWith(
                        color: AppColors.colorBlack,
                      )),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Divider(
                color: Colors.grey.withOpacity(0.4),
                thickness: 1,
              ),
              SizedBox(
                height: 2.h,
              ),
              CartCourses(),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ))),
      ),
    );
  }
}
