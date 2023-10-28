import 'dart:async';
import 'package:edukaapp/page_routes/routes.dart';
import 'package:edukaapp/screens/loginsignup/components/locdb.dart';
import 'package:edukaapp/utils/appStringfile.dart';
import 'package:edukaapp/utils/appimages.dart';
import 'package:edukaapp/utils/loaderscreen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, homePageRoute);
  }

  //Navigator.pushNamed(context, Routes.intro);
  //Navigator.pushNamed(context, Routes.changeLanguageScreen);
  homePageRoute() async {
    String? onbard;
    await LocDb().isLoggedIn();
    bool check = await LocDb().loginapp;
    SharedPreferences preferences = await SharedPreferences.getInstance();

    onbard = preferences.getString(StringFile.onBoard).toString();

    if (check) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.entryPoint, (Route<dynamic> route) => false);
    } else {
      if (onbard != "0") {
        Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.changeLanguageScreen, (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.changeLanguageScreen, (Route<dynamic> route) => false);
      }

      //Routes.loginallTab, (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: Column(
        children: [
          Center(
            child: SizedBox(
              height: 90.h,
              child: Image.asset(
                AppImages.splashlogo,
              ),
            ),
          ),
          const Center(
            child: LoaderScreen(),
          )
        ],
      ),
    );
  }
}
