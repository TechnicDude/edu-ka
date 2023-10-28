import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:edukaapp/api/api.dart';
import 'package:edukaapp/localization/Language/languages.dart';
import 'package:edukaapp/page_routes/routes.dart';
import 'package:edukaapp/provider/profile_Provider.dart';
import 'package:edukaapp/screens/drawer/paymentcard.dart';
import 'package:edukaapp/screens/loginsignup/changepassword.dart';
import 'package:edukaapp/screens/profilepage/editprofile.dart';
import 'package:edukaapp/utils/app_helper.dart';
import 'package:edukaapp/utils/appStringfile.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appimages.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/buttonwidgetloader.dart';
import 'package:edukaapp/utils/no_internetconnection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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

  String _error = '';
  @override
  Widget build(BuildContext context) {
    return Provider.of<InternetConnectionStatus>(context) ==
            InternetConnectionStatus.disconnected
        ? InternetNotAvailable()
        : Scaffold(
            backgroundColor: Colors.white.withOpacity(0.95),
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: AppColors.colorBlack,
              ),
              backgroundColor: AppColors.appPrimarycolor,
              elevation: 0,
              //title: Text("Account Security", style: AppStyle.mytexttitle),
            ),
            body: Consumer<ProfileUserProvider>(
                builder: ((context, profileUserProvider, child) {
              print(profileUserProvider.profileuserList);

              return RefreshIndicator(
                displacement: 40.h,
                backgroundColor: Colors.white,
                color: AppColors.appPrimarycolor,
                strokeWidth: 2,
                triggerMode: RefreshIndicatorTriggerMode.onEdge,
                onRefresh: () async {
                  await Future.delayed(Duration(milliseconds: 2000));
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 18.h,
                        decoration: BoxDecoration(
                          color: AppColors.appPrimarycolor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5.w),
                            bottomRight: Radius.circular(5.w),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 1.h, left: 3.h, right: 2.h, bottom: 2.h),
                          child: profileUserProvider.profileuserList.length != 0
                              ? Row(
                                  children: [
                                    SizedBox(
                                      height: 10.h,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: CircleAvatar(
                                          backgroundColor: Colors.grey,
                                          radius: 5.h,
                                          backgroundImage: profileUserProvider
                                                      .profileuserList[0]
                                                      .avatar !=
                                                  null
                                              ? NetworkImage(APIURL.imageurl +
                                                  profileUserProvider
                                                      .profileuserList[0]
                                                      .avatar!)
                                              : AssetImage(
                                                  AppImages.profile,
                                                ) as ImageProvider,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 2.h, left: 4.h, right: 1.h),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                profileUserProvider
                                                        .profileuserList
                                                        .isNotEmpty
                                                    ? profileUserProvider
                                                            .profileuserList[0]
                                                            .fullName ??
                                                        ''
                                                    : '',
                                                style: AppStyle.textsubtitle
                                                    .copyWith(
                                                        color: Colors.white),
                                              ),
                                              Text(' '),
                                              // Text(
                                              //   profileUserProvider
                                              //           .profileuserList
                                              //           .isNotEmpty
                                              //       ? profileUserProvider
                                              //               .profileuserList[0]
                                              //               .roleName ??
                                              //           ''
                                              //       : '',
                                              //   style: AppStyle.textsubtitle
                                              //       .copyWith(
                                              //           color: Colors.white),
                                              // ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 0.5.h,
                                          ),
                                          Text(
                                            profileUserProvider
                                                    .profileuserList.isNotEmpty
                                                ? profileUserProvider
                                                        .profileuserList[0]
                                                        .email ??
                                                    ''
                                                : '',
                                            // "deepika@gmail.com",
                                            style: AppStyle.textsubtitle
                                                .copyWith(color: Colors.white),
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          profileUserProvider
                                                  .profileuserList.isNotEmpty
                                              ? InkWell(
                                                  onTap: () {
                                                    // Navigator.pushNamed(context,
                                                    //     Routes.editProfile);
                                                    Navigator.pushNamed(context,
                                                        Routes.editProfile,
                                                        arguments: {
                                                          StringFile
                                                                  .profileuserdata:
                                                              profileUserProvider
                                                                  .profileuserList,
                                                        }).then((value) {
                                                      _profileuserProvider
                                                          .profileuserlist(
                                                              AppHelper
                                                                      .userid ??
                                                                  '');
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 4.h,
                                                    width: 16.h,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          Languages.of(context)!
                                                              .editprofile,
                                                          style: AppStyle
                                                              .textsubtitle
                                                              .copyWith(
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        Icon(
                                                          Icons.edit,
                                                          size: 20,
                                                          color: AppColors
                                                              .appPrimarycolor,
                                                        )
                                                      ],
                                                    ),
                                                    decoration: BoxDecoration(
                                                        color: AppColors
                                                            .colorWhite,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.w),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: AppColors
                                                                .colorWhite,
                                                            blurRadius: 1.h,
                                                          ),
                                                        ]),
                                                  ),
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : Container(),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 4.h, left: 1.5.h, right: 1.5.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.lock_outline,
                                      size: 25.0,
                                      color: AppColors.colorGrey,
                                    ),
                                    label: Text(
                                      Languages.of(context)!.changepassword,
                                      style: AppStyle.textsubtitle
                                          .copyWith(color: Colors.black),
                                    )),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, Routes.changePassword);
                                        },
                                        icon: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 25.0,
                                          color: Colors.grey,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                            const Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.stars_sharp,
                                      size: 25.0,
                                      color: AppColors.colorGrey,
                                    ),
                                    label: Text(
                                      Languages.of(context)!.subscriptions,
                                      style: AppStyle.textsubtitle
                                          .copyWith(color: Colors.black),
                                    )),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, Routes.ourPackage);
                                        },
                                        icon: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 25.0,
                                          color: Colors.grey,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                            const Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     TextButton.icon(
                            //         onPressed: () {},
                            //         icon: Icon(
                            //           Icons.monetization_on_outlined,
                            //           size: 25.0,
                            //           color: AppColors.colorGrey,
                            //         ),
                            //         label: Text(
                            //           "Payout & Tax settings",
                            //           style: AppStyle.textsubtitle
                            //               .copyWith(color: Colors.black),
                            //         )),
                            //     Row(
                            //       mainAxisAlignment: MainAxisAlignment.end,
                            //       children: [
                            //         IconButton(
                            //             onPressed: () {
                            //               // Navigator.pushNamed(
                            //               //     context, Routes.packageScreen);
                            //             },
                            //             icon: Icon(
                            //               Icons.arrow_forward_ios,
                            //               size: 25.0,
                            //               color: Colors.grey,
                            //             )),
                            //       ],
                            //     ),
                            //   ],
                            // ),
                            // const Divider(
                            //   color: Colors.grey,
                            //   thickness: 1,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.payment_rounded,
                                      size: 25.0,
                                      color: AppColors.colorGrey,
                                    ),
                                    label: Text(
                                      Languages.of(context)!.paymentmethod,
                                      style: AppStyle.textsubtitle
                                          .copyWith(color: Colors.black),
                                    )),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PaymentCard()));
                                        },
                                        icon: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 25.0,
                                          color: Colors.grey,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                            const Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                !isLoading
                                    ? TextButton.icon(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.delete,
                                          size: 25.0,
                                          color: AppColors.colorGrey,
                                        ),
                                        label: Text(
                                          Languages.of(context)!.deleteaccount,
                                          style: AppStyle.textsubtitle
                                              .copyWith(color: Colors.black),
                                        ))
                                    : ButtonWidgetLoader(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.INFO,
                                            btnOkColor: Colors.red,
                                            borderSide: BorderSide(
                                                color:
                                                    AppColors.appPrimarycolor,
                                                width: 0.1.h),
                                            buttonsBorderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(2)),
                                            headerAnimationLoop: false,
                                            animType: AnimType.BOTTOMSLIDE,
                                            title: Languages.of(context)!
                                                .deleteaccount,

                                            desc: Languages.of(context)!
                                                .deleteaccountmsg,

                                            showCloseIcon: true,
                                            // btnCancelOnPress: () {
                                            //   Navigator.pop(context);
                                            // },
                                            btnOkOnPress: () {},
                                          )..show();
                                        },
                                        icon: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 25.0,
                                          color: Colors.grey,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                            const Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.logout_outlined,
                                      size: 25.0,
                                      color: AppColors.colorGrey,
                                    ),
                                    label: Text(
                                      Languages.of(context)!.logout,
                                      style: AppStyle.textsubtitle
                                          .copyWith(color: Colors.black),
                                    )),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.INFO,
                                            btnOkColor:
                                                AppColors.appPrimarycolor,
                                            borderSide: BorderSide(
                                                color:
                                                    AppColors.appPrimarycolor,
                                                width: 0.1.h),
                                            buttonsBorderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(2)),
                                            headerAnimationLoop: false,
                                            animType: AnimType.BOTTOMSLIDE,
                                            title:
                                                Languages.of(context)!.logout,
                                            desc: Languages.of(context)!
                                                .logoutedukamsg,
                                            //'Are you sure want to Logout Eduka app?',
                                            showCloseIcon: true,
                                            // btnCancelOnPress: () {
                                            //   Navigator.pop(context);
                                            // },
                                            btnOkOnPress: () {},
                                          )..show();
                                        },
                                        icon: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 25.0,
                                          color: Colors.grey,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                            const Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            })));
  }
}

Widget accountTextUI(
  BuildContext context,
  IconData icon1,
  String title,
  IconData icon2,
  String navigation, {
  Object? arguments,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      TextButton.icon(
          onPressed: () {},
          icon: Icon(
            icon1,
            size: 25.0,
            color: AppColors.appPrimarycolor,
          ),
          label: Text(
            title,
            // style: Style_File.title
          )),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              onPressed: () => navigation,
              //onPressed: () {},
              icon: Icon(
                icon2,
                size: 25.0,
                color: Colors.grey,
              )),
        ],
      ),
    ],
  );
}
