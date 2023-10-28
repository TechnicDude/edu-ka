import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.95),
        iconTheme: IconThemeData(
          color: AppColors.colorBlack,
        ),
        elevation: 0,
        title: Text("Payment Card", style: AppStyle.mytexttitle),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 8.h, right: 2.h, left: 2.h),
        child: Container(
          height: 40.h,
          width: 90.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(1.h)),
              border: Border.all(color: Colors.white, width: 0.2),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(1, 2),
                ),
              ],
              color: Colors.white),
          child: Padding(
            padding: EdgeInsets.all(2.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add new card",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp),
                ),
                SizedBox(
                  height: 1.h,
                ),
                TextField(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.h),
                    hintText: '0000 0000 0000 0000',
                    labelText: 'Card number',
                    hintStyle: TextStyle(fontSize: 15.sp),
                    labelStyle: TextStyle(fontSize: 15.sp),
                    suffixIcon: Icon(Icons.credit_card),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1.h),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  onChanged: (text) {},
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 40.w,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 1.h, horizontal: 1.h),
                          hintText: 'MM/YY',
                          labelText: 'Expiry date',
                          hintStyle: TextStyle(fontSize: 15.sp),
                          labelStyle: TextStyle(fontSize: 15.sp),
                          suffixIcon: Icon(Icons.credit_card),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1.h),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                        ),
                        onChanged: (text) {},
                      ),
                    ),
                    SizedBox(
                      width: 40.w,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 1.h, horizontal: 1.h),
                          hintText: '···',
                          hintStyle: TextStyle(fontSize: 15.sp),
                          labelText: 'CVC/CVV',
                          labelStyle: TextStyle(fontSize: 15.sp),
                          suffixIcon: Icon(
                            Icons.error,
                            size: 2.h,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1.h),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                        ),
                        onChanged: (text) {},
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                TextField(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.h),
                    hintText: "Enter cardholder's full name",
                    hintStyle: TextStyle(fontSize: 15.sp),
                    labelText: 'Cardholder name',
                    labelStyle: TextStyle(fontSize: 15.sp),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1.h),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  onChanged: (text) {},
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.blue,
                      size: 2.h,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      "Save card",
                      style: TextStyle(color: Colors.black, fontSize: 14.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 5.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(1.h)),
                      gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 51, 65, 251),
                            Color.fromARGB(255, 32, 26, 194),
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    child: Center(
                      child: Text(
                        "Add Card",
                        style: TextStyle(color: Colors.white, fontSize: 16.sp),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
