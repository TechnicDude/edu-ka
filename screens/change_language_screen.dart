import 'dart:developer';
import 'package:edukaapp/localization/Language/languages.dart';
import 'package:edukaapp/localization/locale_constants.dart';
import 'package:edukaapp/model/language_model.dart';
import 'package:edukaapp/page_routes/routes.dart';
import 'package:edukaapp/utils/app_helper.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  _ChangeLanguageScreenState createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  List<bool> checklanguage = [true, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appPrimarycolor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(2.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    Languages.of(context)!.labelSelectLanguage,
                    style: AppStyle.onbaordtitle,
                  ),
                  Text(
                    Languages.of(context)!.labelChangeLanguage,
                    style: AppStyle.onbaordtitlesubtitle,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  ListView.builder(
                      itemCount: 1,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            for (int i = 0;
                                i < LanguageModel.languageList().length;
                                i++)
                              InkWell(
                                onTap: () async {
                                  for (int j = 0;
                                      j < checklanguage.length;
                                      j++) {
                                    setState(() {
                                      checklanguage[j] = false;
                                    });
                                  }

                                  log(LanguageModel.languageList()[i]
                                      .languageCode);
                                  changeLanguage(
                                      context,
                                      LanguageModel.languageList()[i]
                                          .languageCode);
                                  SharedPreferences _prefs =
                                      await SharedPreferences.getInstance();
                                  String languageCode = _prefs.getString(
                                          prefSelectedLanguageCode) ??
                                      "en";
                                  setState(() {
                                    AppHelper.language =
                                        LanguageModel.languageList()[i]
                                            .languageCode;
                                  });

                                  await _prefs.setString(
                                      prefSelectedLanguageCode,
                                      LanguageModel.languageList()[i]
                                          .languageCode);
                                  if (languageCode ==
                                      LanguageModel.languageList()[i]
                                          .languageCode) {
                                    setState(() {
                                      checklanguage[i] = true;
                                    });
                                  }

                                  Navigator.pushNamed(
                                      context, Routes.onBoardScreen);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 2.h),
                                  child: Container(
                                    width: 80.w,
                                    height: 10.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(2.h),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(2.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            LanguageModel.languageList()[i]
                                                .flag,
                                            style: AppStyle.onbaordtitle
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontSize: 16.sp),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                LanguageModel.languageList()[i]
                                                    .name,
                                                style: AppStyle.onbaordtitle
                                                    .copyWith(
                                                        color: AppColors
                                                            .appPrimarycolor,
                                                        fontSize: 14.sp),
                                              ),
                                              if (checklanguage[i])
                                                Icon(
                                                  Icons.done,
                                                  color: Colors.red,
                                                )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _createLanguageDropDown() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.h),
        border: Border.all(color: Colors.black),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 2.h, right: 2.h),
        child: DropdownButton<LanguageModel>(
          iconSize: 30,
          underline: SizedBox(),
          hint: Text(Languages.of(context)!.labelSelectLanguage),
          onChanged: (LanguageModel? language) {
            changeLanguage(context, language!.languageCode);
          },
          items: LanguageModel.languageList()
              .map<DropdownMenuItem<LanguageModel>>(
                (e) => DropdownMenuItem<LanguageModel>(
                  value: e,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        e.flag,
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(e.name)
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
