import 'package:country_picker/country_picker.dart';
import 'package:edukaapp/screens/PaymentPage/ordercheckoutdetails.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/complete_checkout.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../localization/Language/languages.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  TextEditingController _emailcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CompleteCheckout(
        text: Languages.of(context)!.completecheckout,
      ),
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.colorBlack,
        ),
        backgroundColor: Colors.white.withOpacity(0.95),
        elevation: 0,
        title:
            Text(Languages.of(context)!.checkout, style: AppStyle.mytexttitle),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding:
            EdgeInsets.only(top: 0.5.h, left: 2.5.h, right: 2.5.h, bottom: 2.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(Languages.of(context)!.checkout,
                    style: AppStyle.onbaordtitle.copyWith(
                      color: AppColors.colorBlack,
                    )),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Billing address",
                    style: AppStyle.mytexttitle.copyWith(
                      color: AppColors.colorBlack,
                    )),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("country",
                    style: AppStyle.textsubtitle.copyWith(
                      color: AppColors.colorBlack,
                    )),
                Text("Required",
                    style: AppStyle.textsubsubtitle.copyWith(
                      color: AppColors.colorGrey,
                    )),
              ],
            ),
            // Padding(
            //   padding: EdgeInsets.only(top: 1.5.h, bottom: 3.h),
            //   child: TextFormScreen(
            //     textEditingController: _emailcontroller,
            //     hinttext: "India",
            //     //   hinttext: Languages.of(context)!.email.toLowerCase(),
            //     icon: Icons.language,
            //     //  suffixIcon: Icons.keyboard_arrow_down,
            //   ),
            // ),

            SizedBox(
              height: 2.h,
            ),

            InkWell(
              onTap: () {
                showCountryPicker(
                  context: context,
                  exclude: <String>['KN', 'MF'],
                  favorite: <String>['SE'],
                  showPhoneCode: true,
                  onSelect: (Country country) {
                    print('Select country: ${country.displayName}');
                  },
                  countryListTheme: CountryListThemeData(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                    inputDecoration: InputDecoration(
                      labelText: 'Search',
                      hintText: 'Start typing to search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color(0xFF8C98A8).withOpacity(0.2),
                        ),
                      ),
                    ),
                    searchTextStyle: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                    ),
                  ),
                );
              },
              child: Container(
                height: 6.h,
                child: Row(
                  children: [
                    SizedBox(
                      width: 1.h,
                    ),
                    Icon(
                      Icons.language,
                      size: 2.h,
                    ),
                    SizedBox(
                      width: 1.h,
                    ),
                    Text("India",
                        style: AppStyle.textsubsubtitle.copyWith(
                          color: AppColors.colorBlack,
                        )),
                    Spacer(),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 3.h,
                    ),
                    SizedBox(
                      width: 1.h,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.colorBlack, width: 1),
                ),
              ),
            ),

            SizedBox(
              height: 3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("state/Union Territory",
                    style: AppStyle.textsubtitle.copyWith(
                      color: AppColors.colorBlack,
                    )),
                Text("Required",
                    style: AppStyle.textsubsubtitle.copyWith(
                      color: AppColors.colorGrey,
                    )),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              height: 6.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 2.h,
                  ),
                  Text("Please select...",
                      style: AppStyle.textsubsubtitle.copyWith(
                        color: AppColors.colorBlack,
                      )),
                  Spacer(),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 3.h,
                  ),
                  SizedBox(
                    width: 1.h,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.colorBlack, width: 1),
              ),
            ),

            SizedBox(
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 85.w,
                  child: Text(
                    "Eduka is required by law to collect applicable transaction taxes for purchase made in certain tax jurisdictions.",
                    style: AppStyle.textsubsubtitle.copyWith(fontSize: 13.sp),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Payment Method",
                    style: AppStyle.mytexttitle.copyWith(
                      color: AppColors.colorBlack,
                    )),
                Row(
                  children: [
                    Text("Secured connection",
                        style: AppStyle.textsubsubtitle.copyWith(
                          color: AppColors.colorGrey,
                        )),
                    SizedBox(
                      width: 2.w,
                    ),
                    Icon(
                      Icons.lock,
                      size: 2.h,
                    )
                  ],
                ),
              ],
            ),

            SizedBox(
              height: 3.h,
            ),
// payment card
            Container(
              height: 40.h,
              width: 90.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(1.h)),
                  border: Border.all(color: Colors.white, width: 0.1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(1, 1),
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
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 1.h),
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
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 1.h),
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
                          style:
                              TextStyle(color: Colors.black, fontSize: 14.sp),
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
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.sp),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 3.h,
            ),

            SizedBox(
              height: 3.h,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Order details",
                    style: AppStyle.mytexttitle.copyWith(
                      color: AppColors.colorBlack,
                    )),
              ],
            ),

            SizedBox(
              height: 2.h,
            ),

            Ordercheckoutdetails(),

            SizedBox(
              height: 3.h,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Summary",
                    style: AppStyle.mytexttitle.copyWith(
                      color: AppColors.colorBlack,
                    )),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Original Price",
                    style: AppStyle.textsubsubtitle.copyWith()),
                Text("\$7,797", style: AppStyle.textsubsubtitle.copyWith()),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Discounts:", style: AppStyle.textsubsubtitle.copyWith()),
                Text("-\$6,300", style: AppStyle.textsubsubtitle.copyWith()),
              ],
            ),

            SizedBox(
              height: 1.h,
            ),

            Divider(
              color: Colors.grey.withOpacity(0.4),
              thickness: 1,
            ),

            SizedBox(
              height: 1.h,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total:",
                    style: AppStyle.mytexttitle.copyWith(
                      color: AppColors.colorBlack,
                      fontSize: 16.sp,
                    )),
                Text("\$1,497",
                    style: AppStyle.mytexttitle.copyWith(
                      color: AppColors.colorBlack,
                      fontSize: 16.sp,
                    ))
              ],
            ),

            SizedBox(
              height: 4.h,
            ),
          ],
        ),
      ))),
    );
  }
}
