import 'dart:io';

import 'package:edukaapp/localization/Language/languages.dart';
import 'package:edukaapp/screens/loginsignup/components/change_newpassword_form.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChangenewPassword extends StatefulWidget {
  final String? id;
  final String? password;
  final String? userid;
  final String? pagetype;
  final String? otp;
  final String? email;

  const ChangenewPassword(
      {Key? key,
      this.id,
      this.password,
      this.pagetype,
      this.email,
      this.userid,
      this.otp})
      : super(key: key);

  @override
  State<ChangenewPassword> createState() => _ChangenewPasswordState();
}

class _ChangenewPasswordState extends State<ChangenewPassword> {
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
              SafeArea(
                  child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Languages.of(context)!.changenewpassword,
                      style:
                          AppStyle.onbaordtitle.copyWith(color: Colors.black),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    const ChangenewPasswordForm(),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
