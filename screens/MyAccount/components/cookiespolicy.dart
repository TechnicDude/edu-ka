import 'package:edukaapp/localization/Language/languages.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/webviewscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CookiesPolicy extends StatefulWidget {
  const CookiesPolicy({super.key});

  @override
  State<CookiesPolicy> createState() => _CookiesPolicyState();
}

class _CookiesPolicyState extends State<CookiesPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.95),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: AppColors.colorBlack,
          ),
          backgroundColor: Colors.white.withOpacity(0.95),
          elevation: 0,
          title: Text(Languages.of(context)!.cookiespolicy,
              style: AppStyle.mytexttitle),
        ),
        body: WebViewScreensShow(
            url: "https://edukavvnand.imperialitforweb.com/cookiesPolicy"));
  }
}
