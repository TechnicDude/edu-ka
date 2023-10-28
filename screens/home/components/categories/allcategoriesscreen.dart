import 'package:edukaapp/localization/Language/languages.dart';
import 'package:edukaapp/provider/dashboard_Provider.dart';
import 'package:edukaapp/screens/home/components/categories/allcategoriesui.dart';
import 'package:edukaapp/utils/app_helper.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/loaderscreen.dart';
import 'package:edukaapp/utils/no_internetconnection.dart';
import 'package:edukaapp/utils/nodatafoundscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllCategoriesScreen extends StatefulWidget {
  const AllCategoriesScreen({super.key});

  @override
  State<AllCategoriesScreen> createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
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
    //await _dashBoradProvider.bannerlist("main/0");
    await _dashBoradProvider.categorylist();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoradProvider>(
        builder: (context, dashBoradProvider, child) {
      return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.95),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: AppColors.colorBlack,
          ),
          backgroundColor: Colors.white.withOpacity(0.95),
          elevation: 0,
          title: Center(
            child: Text(Languages.of(context)!.categories,
                style: AppStyle.mytexttitle),
          ),
        ),
        body: Provider.of<InternetConnectionStatus>(context) ==
                InternetConnectionStatus.disconnected
            ? InternetNotAvailable()
            : SafeArea(
                child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(2.h),
                      child: dashBoradProvider.categoryModel.data != null
                          ? dashBoradProvider.datanotfound
                              ? NoDataFoundErrorScreens(
                                  height: 50.h,
                                )
                              : AllCategoriesUI(
                                  categorydata: dashBoradProvider.categoryList,
                                  type: "category",
                                  searchString: '',
                                )
                          : LoaderScreen(),
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
