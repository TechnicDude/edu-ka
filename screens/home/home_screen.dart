import 'package:edukaapp/localization/Language/languages.dart';
import 'package:edukaapp/page_routes/routes.dart';
import 'package:edukaapp/provider/dashboard_Provider.dart';
import 'package:edukaapp/provider/profile_Provider.dart';
import 'package:edukaapp/screens/GloabeSearch/globlesearch.dart';

import 'package:edukaapp/screens/coursedetails/CourseDetailsScreen.dart';
import 'package:edukaapp/screens/home/components/Home_Cards/allcourselist_card.dart';
import 'package:edukaapp/screens/home/components/Home_Cards/enrollcourse_card.dart';
import 'package:edukaapp/screens/home/components/auther/autherscreen.dart';
import 'package:edukaapp/screens/home/components/categories/allcategoriesscreen.dart';
import 'package:edukaapp/screens/home/components/allcourses/allcourses_screen.dart';
import 'package:edukaapp/screens/home/components/popularcourse/popularcoursescreen.dart';

import 'package:edukaapp/screens/home/components/Home_Cards/auther_card.dart';
import 'package:edukaapp/screens/home/components/Home_Cards/category_card.dart';
import 'package:edukaapp/screens/notification/notification.dart';
import 'package:edukaapp/screens/home/components/Home_Cards/popularcourse_card.dart';
import 'package:edukaapp/screens/profilepage/instructureprofile.dart';
import 'package:edukaapp/screens/profilepage/profilescreen.dart';
import 'package:edukaapp/utils/app_helper.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/loaderscreen.dart';
import 'package:edukaapp/utils/no_internetconnection.dart';
import 'package:edukaapp/utils/nodatafoundscreen.dart';

import 'package:edukaapp/utils/slidderbanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'components/Home_Cards/course_card.dart';

class HomePage extends StatefulWidget {
  final Function? callback;
  const HomePage({this.callback, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DashBoradProvider _dashBoradProvider = DashBoradProvider();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _dashBoradProvider = Provider.of<DashBoradProvider>(context, listen: false);
    getalldata();
    print("userid ${AppHelper.userid}");
    print(AppHelper.userid);
    print(AppHelper.AUTH_TOKEN_VALUE);
    super.initState();
  }

  getalldata() async {
    await _dashBoradProvider.bannerlist();
    await _dashBoradProvider.categorylist();
    await _dashBoradProvider.popularlist();
    await _dashBoradProvider.allcourselist();
    await _dashBoradProvider.autherlist();
    await _dashBoradProvider.profileuserlist(AppHelper.userid ?? '');
  }

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    return Consumer<DashBoradProvider>(
        builder: (context, dashBoradProvider, child) {
      return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.95),
        body: Provider.of<InternetConnectionStatus>(context) ==
                InternetConnectionStatus.disconnected
            ? InternetNotAvailable()
            : SafeArea(
                bottom: false,
                child: Shimmer(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 3.h, bottom: 5.h, left: 1.5.h, right: 1.5.h),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 7.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    _dashBoradProvider.profileuserModel.data !=
                                            null
                                        ? _dashBoradProvider.profiledatanotfound
                                            ? Text("Username")
                                            : Text(
                                                "Hi, ${_dashBoradProvider.profileuserList[0].fullName ?? ''}",
                                                style: AppStyle.texttitle
                                                    .copyWith(
                                                        color: Colors.black),
                                              )
                                        : Container(),
                                  ],
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, Routes.globalSearch);
                                        },
                                        child: Icon(Icons.search)),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(context,
                                              Routes.notificationScreen);
                                        },
                                        child: Icon(Icons.notifications)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 2.5.h),
                          if (dashBoradProvider.bannerList.isNotEmpty)
                            SliderScreen(
                                bannerdata: dashBoradProvider.bannerList),
                          SizedBox(height: 1.5.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                Languages.of(context)!.categories,
                                style: AppStyle.texttitle
                                    .copyWith(color: Colors.black),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.allCategoriesScreen);
                                },
                                child: Text(
                                  Languages.of(context)!.seeall,
                                  style: AppStyle.textsubtitle.copyWith(
                                      color: AppColors.appPrimarycolor),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.h),
                          dashBoradProvider.categoryModel.data != null
                              ? dashBoradProvider.datanotfound
                                  ? NoDataFoundErrorScreens(
                                      height: 50.h,
                                    )
                                  : CategoriesCard(
                                      categorydata:
                                          dashBoradProvider.categoryList,
                                      type: "categorytype",
                                      searchString: '',
                                    )
                              : Container(),
                          SizedBox(height: 1.5.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                Languages.of(context)!.popularcourse,
                                //  "Popular Course",
                                style: AppStyle.texttitle
                                    .copyWith(color: Colors.black),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.popularCourseScreen);
                                },
                                child: Text(
                                  Languages.of(context)!.seeall,
                                  style: AppStyle.textsubtitle.copyWith(
                                      color: AppColors.appPrimarycolor),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.h),
                          dashBoradProvider.popularListModel.data != null
                              ? dashBoradProvider.datanotfound
                                  ? NoDataFoundErrorScreens(
                                      height: 50.h,
                                    )
                                  : PopularCourseCard(
                                      popularcoursedata:
                                          dashBoradProvider.popularList,
                                      type: "popularcoursetype",
                                      searchString: '',
                                    )
                              : Container(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                // Languages.of(context)!.enrollcourse,
                                "All Course",
                                style: AppStyle.texttitle
                                    .copyWith(color: Colors.black),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.allcoursesScreen);
                                },
                                child: Text(
                                  Languages.of(context)!.seeall,
                                  style: AppStyle.textsubtitle.copyWith(
                                      color: AppColors.appPrimarycolor),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.h),
                          dashBoradProvider.allCourselistModel.data != null
                              ? dashBoradProvider.datanotfound
                                  ? NoDataFoundErrorScreens(
                                      height: 50.h,
                                    )
                                  : CourseCard(
                                      allcourselistdata:
                                          dashBoradProvider.allCourseListbyid,
                                      type: "allcourselisttype",
                                      searchString: '',
                                    )
                              : Container(),
                          SizedBox(height: 1.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                Languages.of(context)!.enrollcourse,
                                style: AppStyle.texttitle
                                    .copyWith(color: Colors.black),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.myCoursesScreen);
                                },
                                child: Text(
                                  Languages.of(context)!.seeall,
                                  style: AppStyle.textsubtitle.copyWith(
                                      color: AppColors.appPrimarycolor),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.h),
                          EnrollCourseCard(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context,
                                      Routes.instructureProfiledetails);
                                },
                                child: Text(
                                  Languages.of(context)!.auther,
                                  //  "Auther",
                                  style: AppStyle.texttitle
                                      .copyWith(color: Colors.black),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.autherScreen);
                                },
                                child: Text(
                                  Languages.of(context)!.seeall,
                                  style: AppStyle.textsubtitle.copyWith(
                                      color: AppColors.appPrimarycolor),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.h),
                          dashBoradProvider.autherListModel.data != null
                              ? dashBoradProvider.datanotfound
                                  ? NoDataFoundErrorScreens(
                                      height: 50.h,
                                    )
                                  : AutherCard(
                                      autherlistdata:
                                          dashBoradProvider.autherList,
                                      type: "autherlisttype",
                                      searchString: '',
                                    )
                              : Container(),
                          SizedBox(height: 4.h),
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
                ),
              ),
      );
    });
  }
}
