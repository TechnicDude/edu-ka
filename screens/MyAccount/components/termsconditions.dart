import 'package:edukaapp/localization/Language/languages.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/webviewscreen.dart';
import 'package:flutter/material.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({Key? key}) : super(key: key);

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: AppColors.colorBlack,
          ),
          backgroundColor: Colors.white.withOpacity(0.95),
          elevation: 0,
          title: Text(Languages.of(context)!.termsandcondition,
              style: AppStyle.mytexttitle),
        ),
        body: WebViewScreensShow(
            url: "https://edukavvnand.imperialitforweb.com/terms-condition"));
  }
}
