import 'dart:io';

import 'package:edukaapp/localization/Language/languages.dart';
import 'package:edukaapp/page_routes/routes.dart';
import 'package:edukaapp/screens/loginsignup/login.dart';
import 'package:edukaapp/screens/loginsignup/components/sign_in_form.dart';
import 'package:edukaapp/screens/loginsignup/components/sign_up_form.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignupScreenActivity extends StatefulWidget {
  const SignupScreenActivity({super.key});

  @override
  State<SignupScreenActivity> createState() => _SignupScreenActivityState();
}

class _SignupScreenActivityState extends State<SignupScreenActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 4.h, right: 2.h, left: 2.h),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                ],
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      Languages.of(context)!.signup,
                      style:
                          AppStyle.onbaordtitle.copyWith(color: Colors.black),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    const SignUpForm(),
                    SizedBox(
                      height: 1.h,
                    ),
                    RichText(
                      text: TextSpan(
                        text: Languages.of(context)!.alreadyregister,
                        style: TextStyle(
                          color: Colors.black26,
                          fontWeight: FontWeight.w500,
                        ),
                        // style: Style_File.subtitle.copyWith(
                        //   color: Colors.grey,
                        // ),
                        children: <TextSpan>[
                          TextSpan(
                              text: Languages.of(context)!.login,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              // style: Style_File.subtitle.copyWith(
                              //     color: colorBlack, fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.pushNamed(
                                    context, Routes.loginScreen)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
