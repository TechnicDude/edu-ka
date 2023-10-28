import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:edukaapp/localization/Language/languages.dart';
import 'package:edukaapp/page_routes/routes.dart';
import 'package:edukaapp/utils/app_helper.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../../../model/menu.dart';
import '../../../provider/profile_Provider.dart';
import '../../MyAccount/components/languagechangeedit.dart';
import 'info_card.dart';

class SideBar extends StatefulWidget {
  final Function? callback;
  const SideBar({this.callback, super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  Menu selectedSideMenu = sidebarMenus.first;
  bool showpop = false;

  // ProfileUserProvider _profileuserProvider = ProfileUserProvider();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.portraitUp,
  //     DeviceOrientation.portraitDown,
  //   ]);
  //   super.initState();

  //   _profileuserProvider =
  //       Provider.of<ProfileUserProvider>(context, listen: false);
  //   _profileuserProvider.profileuserlist(AppHelper.userid ?? '');
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Shimmer(
            child: Container(
              width: 288,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.appPrimarycolor,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: DefaultTextStyle(
                style: const TextStyle(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const InfoCard(
                      name: "Deepika Mourya",
                      bio: "Hey, I am Eduka!",
                    ),
                    ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(left: 1.h, right: 1.h),
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.home,
                            size: 18,
                            color: Colors.white,
                          ),
                          title: Text(Languages.of(context)!.home,
                              style: AppStyle.textsubtitle),
                          onTap: () {
                            // Navigator.pushReplacementNamed(context, Routes.bottomNav);
                          },
                        ),
                        const Divider(
                          color: Colors.black12,
                          thickness: 1,
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.grid_view_rounded,
                            size: 18,
                            color: Colors.white,
                          ),
                          title: Text(Languages.of(context)!.categories,
                              style: AppStyle.textsubtitle),
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.allCategoriesScreen);
                          },
                        ),
                        const Divider(
                          color: Colors.black12,
                          thickness: 1,
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.play_circle,
                            size: 18,
                            color: Colors.white,
                          ),
                          title: Text(Languages.of(context)!.mycourse,
                              style: AppStyle.textsubtitle),
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.myCoursesScreen);
                          },
                        ),
                        const Divider(
                          color: Colors.black12,
                          thickness: 1,
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.shopping_cart_rounded,
                            size: 18,
                            color: Colors.white,
                          ),
                          title: Text(Languages.of(context)!.mycart,
                              style: AppStyle.textsubtitle),
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.addtoCartScreen);
                          },
                        ),
                        const Divider(
                          color: Colors.black12,
                          thickness: 1,
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.account_circle,
                            size: 18,
                            color: Colors.white,
                          ),
                          title: Text(Languages.of(context)!.myprofile,
                              style: AppStyle.textsubtitle),
                          onTap: () {
                            Navigator.pushNamed(context, Routes.profileScreen);
                          },
                        ),
                        const Divider(
                          color: Colors.black12,
                          thickness: 1,
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.settings_outlined,
                            size: 18,
                            color: Colors.white,
                          ),
                          title: Text(Languages.of(context)!.myaccount,
                              style: AppStyle.textsubtitle),
                          onTap: () {
                            Navigator.pushNamed(context, Routes.accountScreen);
                          },
                        ),
                        const Divider(
                          color: Colors.black12,
                          thickness: 1,
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.translate,
                            size: 18,
                            color: Colors.white,
                          ),
                          title: Text(Languages.of(context)!.changelanguage,
                              style: AppStyle.textsubtitle),
                          onTap: () {
                            setState(() {
                              showpop = true;
                            });
                            // Navigator.pushNamed(context, Routes.profileScreen);
                          },
                        ),
                        const Divider(
                          color: Colors.black12,
                          thickness: 1,
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.login,
                            size: 18,
                            color: Colors.white,
                          ),
                          title: Text(
                              //"Logout",
                              AppHelper.userid == null
                                  ? Languages.of(context)!.login
                                  : Languages.of(context)!.logout,
                              style: AppStyle.textsubtitle),
                          onTap: () {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.INFO,
                              btnOkColor: AppColors.appPrimarycolor,
                              borderSide: BorderSide(
                                  color: AppColors.appPrimarycolor,
                                  width: 0.1.h),
                              buttonsBorderRadius:
                                  BorderRadius.all(Radius.circular(2)),
                              headerAnimationLoop: false,
                              animType: AnimType.BOTTOMSLIDE,
                              title: Languages.of(context)!.logout,
                              desc: Languages.of(context)!.logoutedukamsg,
                              showCloseIcon: true,
                              // btnCancelOnPress: () {
                              //   Navigator.pop(context);
                              // },
                              btnOkOnPress: () {
                                // Navigator.pushNamed(context, Routes.loginScreen);
                                if (AppHelper.userid == null) {
                                  Navigator.pushNamed(
                                      context, Routes.loginScreen);
                                } else {
                                  AppHelper.logout();
                                  Navigator.of(context, rootNavigator: true)
                                      .pushNamedAndRemoveUntil(
                                          Routes.loginScreen,
                                          (Route<dynamic> route) => false);
                                }
                              },
                            )..show();
                          },
                        ),
                        const Divider(
                          color: Colors.black12,
                          thickness: 1,
                        ),
                      ],
                    ),
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
          if (showpop)
            Center(child: EditLanguagePopup(
              callback: (value) {
                setState(() {
                  showpop = false;
                });
              },
            )),
        ],
      ),
    );
  }
}
