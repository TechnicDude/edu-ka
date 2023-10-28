import 'dart:io';
import 'dart:ui';
import 'package:edukaapp/localization/Language/languages.dart';
import 'package:edukaapp/page_routes/routes.dart';
import 'package:edukaapp/screens/loginsignup/login.dart';
import 'package:edukaapp/utils/appimages.dart';
import 'package:edukaapp/utils/apprives.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';

import '../loginsignup/components/animated_btn.dart';

class OnbodingScreen extends StatefulWidget {
  const OnbodingScreen({super.key});

  @override
  State<OnbodingScreen> createState() => _OnbodingScreenState();
}

class _OnbodingScreenState extends State<OnbodingScreen> {
  late RiveAnimationController _btnAnimationController;

  bool isShowSignInDialog = false;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.6,
            left: 100,
            bottom: 100,
            child: Image.asset(
              AppImages.splineonborad,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: const SizedBox(),
            ),
          ),
          const RiveAnimation.asset(
            AppRives.splineonborad,
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            top: isShowSignInDialog ? -50 : 0,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            duration: const Duration(milliseconds: 260),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Platform.isAndroid
                            ? Icons.arrow_back
                            : Icons.arrow_back_ios,
                      ),
                      color: Colors.black,
                    ),

                    const Spacer(),
                    SizedBox(
                      width: 50.w,
                      child: Column(
                        children: [
                          Text(
                            Languages.of(context)!.onboardtitle,
                            style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins",
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 1.h),
                          Text(
                            Languages.of(context)!.onboardsubtitle,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 2),
                    AnimatedBtn(
                      btnAnimationController: _btnAnimationController,
                      press: () {
                        _btnAnimationController.isActive = true;

                        Navigator.pushNamed(context, Routes.intro);

                        // Navigator.pushNamed(context, Routes.loginScreen);

                        // Future.delayed(
                        //   const Duration(milliseconds: 800),
                        //   () {
                        //     setState(() {
                        //       isShowSignInDialog = true;
                        //     });
                        //     showCustomDialog(
                        //       context,
                        //       onValue: (_) {
                        //         setState(() {
                        //           isShowSignInDialog = false;
                        //         });
                        //       },
                        //     );
                        //   },
                        // );
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    )
                    // const Padding(
                    //   padding: EdgeInsets.symmetric(vertical: 24),
                    //   child: Text(
                    //       "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates."),
                    // )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
