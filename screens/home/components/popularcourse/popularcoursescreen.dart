import 'dart:io';

import 'package:edukaapp/provider/dashboard_Provider.dart';
import 'package:edukaapp/screens/home/components/allcourses/courseui.dart';
import 'package:edukaapp/screens/home/components/popularcourse/popularcourseUI.dart';
import 'package:edukaapp/utils/app_helper.dart';
import 'package:edukaapp/utils/appbar.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/backbutton.dart';
import 'package:edukaapp/utils/loaderscreen.dart';
import 'package:edukaapp/utils/no_internetconnection.dart';
import 'package:edukaapp/utils/nodatafoundscreen.dart';
import 'package:edukaapp/utils/searchwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PopularCourseScreen extends StatefulWidget {
  const PopularCourseScreen({super.key});

  @override
  State<PopularCourseScreen> createState() => _PopularCourseScreenState();
}

class _PopularCourseScreenState extends State<PopularCourseScreen> {
  DashBoradProvider _dashBoradProvider = DashBoradProvider();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _dashBoradProvider = Provider.of<DashBoradProvider>(context, listen: false);
    getalldata();

    super.initState();
  }

  getalldata() async {
    await _dashBoradProvider.popularlist();
  }

  double ratingdata = 0.0;
  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoradProvider>(
        builder: (context, dashBoradProvider, child) {
      return Scaffold(
        backgroundColor: AppColors.colorWhite,
        body: Provider.of<InternetConnectionStatus>(context) ==
                InternetConnectionStatus.disconnected
            ? InternetNotAvailable()
            : RefreshIndicator(
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
                  child: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            height: 35.h,
                            width: 100.w,
                            color: AppColors.appPrimarycolor,
                            child: Column(
                              children: [
                                BackButtonscreen(),
                                Text(
                                  "Popular Course",
                                  style: AppStyle.onbaordtitle
                                      .copyWith(color: Colors.white),
                                ),
                                SearchWidget()
                              ],
                            ),
                          ),
                          Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.bottomCenter,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 25.h, left: 2.h, right: 2.h),

                                child: dashBoradProvider
                                            .popularListModel.data !=
                                        null
                                    ? dashBoradProvider.datanotfound
                                        ? NoDataFoundErrorScreens(
                                            height: 50.h,
                                          )
                                        : PopularCourseUI(
                                            popularcoursedata:
                                                dashBoradProvider.popularList,
                                            type: "popularcoursetype",
                                            searchString: '',
                                          )
                                    : LoaderScreen(),

                                // AllCategoriesUI(),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                    ],
                  ),
                )),
              ),
      );
    });
  }
}
