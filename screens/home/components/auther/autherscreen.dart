import 'package:edukaapp/provider/dashboard_Provider.dart';
import 'package:edukaapp/screens/home/components/auther/autherUI.dart';
import 'package:edukaapp/screens/home/components/categories/allcategoriesui.dart';
import 'package:edukaapp/utils/app_helper.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/backbutton.dart';
import 'package:edukaapp/utils/no_internetconnection.dart';
import 'package:edukaapp/utils/nodatafoundscreen.dart';
import 'package:edukaapp/utils/searchwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AutherScreen extends StatefulWidget {
  const AutherScreen({super.key});

  @override
  State<AutherScreen> createState() => _AutherScreenState();
}

class _AutherScreenState extends State<AutherScreen> {
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
    await _dashBoradProvider.autherlist();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoradProvider>(
        builder: (context, dashBoradProvider, child) {
      return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.95),
        body: Provider.of<InternetConnectionStatus>(context) ==
                InternetConnectionStatus.disconnected
            ? InternetNotAvailable()
            : SafeArea(
                child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          height: 32.h,
                          width: 100.w,
                          color: AppColors.appPrimarycolor,
                          child: Column(
                            children: [
                              BackButtonscreen(),
                              Text(
                                "Course Auther",
                                style: AppStyle.onbaordtitle
                                    .copyWith(color: Colors.black),
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
                              child:
                                  dashBoradProvider.autherListModel.data != null
                                      ? dashBoradProvider.datanotfound
                                          ? NoDataFoundErrorScreens(
                                              height: 50.h,
                                            )
                                          : AutherUI(
                                              autherlistdata:
                                                  dashBoradProvider.autherList,
                                              type: "autherlisttype",
                                            )
                                      : Container(),
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
      );
    });
  }
}
