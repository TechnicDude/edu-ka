import 'package:edukaapp/localization/Language/languages.dart';
import 'package:edukaapp/page_routes/routes.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final Uri _url = Uri.parse(
      'https://play.google.com/store/apps/details?id=com.facebook.katana');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Row(
            //   children: [
            //     Icon(
            //       Icons.contrast_rounded,
            //       size: 25.0,
            //       color: AppColors.colorBlack,
            //     ),
            //     SizedBox(
            //       width: 2.w,
            //     ),
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           "Theme",
            //           style: AppStyle.texttitle.copyWith(color: Colors.black),
            //         ),
            //         Text(
            //           "System default",
            //           style: AppStyle.textsubtitle.copyWith(color: Colors.grey),
            //         )
            //       ],
            //     ),
            //   ],
            // ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Languages.of(context)!.contactus,
                  style: AppStyle.textsubtitle.copyWith(color: Colors.black),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.contactus);
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 23.0,
                      color: Colors.grey,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Languages.of(context)!.feedback,
                  style: AppStyle.textsubtitle.copyWith(color: Colors.black),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.feedbacks);
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 23.0,
                      color: Colors.grey,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Languages.of(context)!.privacypolicy,
                  style: AppStyle.textsubtitle.copyWith(color: Colors.black),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.privacyPolicy);
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 23.0,
                      color: Colors.grey,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Languages.of(context)!.cookiespolicy,
                  style: AppStyle.textsubtitle.copyWith(color: Colors.black),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.cookiesPolicy);
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 23.0,
                      color: Colors.grey,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Languages.of(context)!.termsandcondition,
                  style: AppStyle.textsubtitle.copyWith(color: Colors.black),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.termsAndCondition);
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 23.0,
                      color: Colors.grey,
                    )),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  Languages.of(context)!.helpnsupport,
                  style: AppStyle.textsubsubtitle
                      .copyWith(color: AppColors.colorBlack, fontSize: 13.sp),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  Languages.of(context)!.abouteduka,

                  //  "About Eduka",
                  style: AppStyle.textsubtitle.copyWith(color: Colors.black),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.aboutUs);
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 23.0,
                      color: Colors.grey,
                    )),
              ],
            ),
            Row(
              children: [
                Text(
                  Languages.of(context)!.rateapp,
                  style: AppStyle.textsubtitle.copyWith(color: Colors.black),
                ),
                Spacer(),
                IconButton(
                    onPressed: _launchUrl,
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 23.0,
                      color: Colors.grey,
                    )),
              ],
            ),

            Row(
              children: [
                Text(
                  Languages.of(context)!.shareapp,

                  //"Share the Eduka app",
                  style: AppStyle.textsubtitle.copyWith(color: Colors.black),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      Share.share(
                          'hey! check out Eduka app https://play.google.com/store/apps/details?id=com.facebook.katana');
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 23.0,
                      color: Colors.grey,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
