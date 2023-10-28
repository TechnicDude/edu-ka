import 'package:edukaapp/api/api.dart';
import 'package:edukaapp/localization/Language/languages.dart';
import 'package:edukaapp/page_routes/routes.dart';
import 'package:edukaapp/provider/profile_Provider.dart';
import 'package:edukaapp/screens/MyAccount/components/languagechangeedit.dart';
import 'package:edukaapp/screens/MyAccount/settings/settings.dart';
import 'package:edukaapp/screens/PaymentPage/AddtoCart.dart';
import 'package:edukaapp/screens/profilepage/instructureprofile.dart';
import 'package:edukaapp/screens/profilepage/profilescreen.dart';
import 'package:edukaapp/utils/app_helper.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appimages.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/no_internetconnection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountScreen extends StatefulWidget {
  final Function? callback;
  const AccountScreen({this.callback, super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool showpop = false;

  bool isLoading = false;

  ProfileUserProvider _profileuserProvider = ProfileUserProvider();

  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();

    _profileuserProvider =
        Provider.of<ProfileUserProvider>(context, listen: false);
    _profileuserProvider.profileuserlist(AppHelper.userid ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: AppColors.colorBlack,
          ),
          backgroundColor: Colors.white.withOpacity(0.95),
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 2.w,
              ),
              Center(
                child: Text(Languages.of(context)!.myaccount,
                    style: AppStyle.mytexttitle),
              ),
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.addtoCartScreen);
                      },
                      child: Icon(Icons.shopping_cart_outlined)),
                ],
              ),
            ],
          ),
        ),
        body: Provider.of<InternetConnectionStatus>(context) ==
                InternetConnectionStatus.disconnected
            ? InternetNotAvailable()
            : Consumer<ProfileUserProvider>(
                builder: ((context, profileUserProvider, child) {
                print(profileUserProvider.profileuserList);
                return Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Shimmer(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 2.h, left: 2.h, right: 2.h),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: profileUserProvider
                                            .profileuserList.length !=
                                        0
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 10.h,
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: CircleAvatar(
                                                backgroundColor: Colors.grey,
                                                radius: 5.h,
                                                backgroundImage:
                                                    profileUserProvider
                                                                .profileuserList[
                                                                    0]
                                                                .avatar !=
                                                            null
                                                        ? NetworkImage(APIURL
                                                                .imageurl +
                                                            profileUserProvider
                                                                .profileuserList[
                                                                    0]
                                                                .avatar!)
                                                        : AssetImage(
                                                            AppImages.profile,
                                                          ) as ImageProvider,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Text(
                                            profileUserProvider
                                                    .profileuserList.isNotEmpty
                                                ? profileUserProvider
                                                        .profileuserList[0]
                                                        .fullName ??
                                                    ''
                                                : '',
                                            style: AppStyle.texttitle
                                                .copyWith(color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 0.5.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.mail_outline_outlined,
                                                size: 2.h,
                                              ),
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              Text(
                                                profileUserProvider
                                                        .profileuserList
                                                        .isNotEmpty
                                                    ? profileUserProvider
                                                            .profileuserList[0]
                                                            .email ??
                                                        ''
                                                    : '',
                                                style: AppStyle.textsubtitle
                                                    .copyWith(
                                                        color: Colors.black87),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                        ],
                                      )
                                    : Container(),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.instructureProfile);
                                },
                                child: Text(
                                  "Become an Instructor",
                                  style: AppStyle.texttitle.copyWith(
                                      color: AppColors.appPrimarycolor),
                                ),
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    Languages.of(context)!.accountsettings,
                                    style: AppStyle.textsubsubtitle.copyWith(
                                        color: AppColors.colorBlack,
                                        fontSize: 13.sp),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 0.1.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    Languages.of(context)!.changelanguage,
                                    style: AppStyle.textsubtitle
                                        .copyWith(color: Colors.black),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          showpop = true;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 23.0,
                                        color: Colors.grey,
                                      )),
                                ],
                              ),
                              SettingScreen(),
                              Text(
                                Languages.of(context)!.logout,

                                //"Sign out",
                                style: AppStyle.texttitle
                                    .copyWith(color: AppColors.appPrimarycolor),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                "Eduka v1.0.0",
                                style: AppStyle.textsubsubtitle.copyWith(
                                    color: AppColors.colorBlack,
                                    fontSize: 13.sp),
                              ),
                              SizedBox(
                                height: 9.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                      duration: Duration(seconds: 3),
                      // This is NOT the default value. Default value: Duration(seconds: 0)
                      interval: Duration(seconds: 5),
                      // This is the default value
                      color: Colors.grey.withOpacity(0.1),
                      // This is the default value
                      colorOpacity: 0.3,
                      // This is the default value
                      enabled: true,
                      // This is the default value
                      direction: ShimmerDirection.fromLTRB(),
                    ),
                    if (showpop)
                      Center(child: EditLanguagePopup(
                        callback: (value) {
                          setState(() {
                            showpop = false;
                          });
                        },
                      )),
                  ],
                );
              })));
  }
}
