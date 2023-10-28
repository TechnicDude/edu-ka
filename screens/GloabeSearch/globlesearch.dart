import 'dart:io';

import 'package:edukaapp/page_routes/routes.dart';
import 'package:edukaapp/screens/GloabeSearch/components/SearchUI.dart';
import 'package:edukaapp/screens/GloabeSearch/components/topsearchesui.dart';
import 'package:edukaapp/screens/PaymentPage/AddtoCart.dart';
import 'package:edukaapp/utils/browsecategories.dart';
import 'package:edukaapp/utils/appbar.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../localization/Language/languages.dart';

class GlobalSearch extends StatefulWidget {
  const GlobalSearch({super.key});

  @override
  State<GlobalSearch> createState() => _GlobalSearchState();
}

class _GlobalSearchState extends State<GlobalSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      // appBar: PreferredSize(
      //     preferredSize: Size.fromHeight(50),
      //     child: AppBarScreens(
      //         // text: "Search",
      //         )),
      body: SafeArea(
        child: SingleChildScrollView(
          // physics: ScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(
              left: 1.h,
              right: 1.h,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 1.5.h,
                    ),
                    SizedBox(
                      width: 80.w,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3.w),
                              borderSide: BorderSide(color: Colors.teal)),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.search),
                            color: AppColors.colorGrey,
                            onPressed: () {},
                          ),
                          hintText: Languages.of(context)!.searchcourse,
                          hintStyle: TextStyle(
                              fontSize: 14,
                              fontFamily: 'PublicSans',
                              color: AppColors.colorGrey),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.addtoCartScreen);
                      },
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        size: 3.5.h,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                SearchUI(),
                //  BrowseCategories(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
