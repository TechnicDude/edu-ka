import 'package:edukaapp/api/loginapi.dart';
import 'package:edukaapp/localization/Language/languages.dart';
import 'package:edukaapp/page_routes/routes.dart';
import 'package:edukaapp/screens/entryPoint/entry_point.dart';
import 'package:edukaapp/utils/app_helper.dart';
import 'package:edukaapp/utils/app_validator.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/buttonwidget.dart';
import 'package:edukaapp/utils/dialog_helper.dart';

import 'package:edukaapp/utils/textform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';

class ChangenewPasswordForm extends StatefulWidget {
  final String? id;
  final String? password;
  final String? userid;
  final String? pagetype;
  final String? otp;
  final String? email;
  const ChangenewPasswordForm(
      {super.key,
      this.id,
      this.password,
      this.pagetype,
      this.email,
      this.userid,
      this.otp});

  @override
  State<ChangenewPasswordForm> createState() => _ChangenewPasswordFormState();
}

class _ChangenewPasswordFormState extends State<ChangenewPasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  bool _obscureText = true;
  bool _obscureText1 = true;

  String _error = '';

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirm_passwordController = TextEditingController();
  bool isShowLoading = false;
  bool isShowConfetti = false;

  late SMITrigger error;
  late SMITrigger success;
  late SMITrigger reset;

  late SMITrigger confetti;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggle1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  resetPassword(String newpassword, String confirmpassword) async {
    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (_formKey.currentState!.validate()) {
        if (passwordController.text == confirm_passwordController.text) {
          var data = {
            'otp': widget.otp,
            'newPassword': newpassword,
            'email': widget.email,
            'language': AppHelper.language
          };

          LoginApi registerresponse = LoginApi(data);
          var response = await registerresponse.forgetpassword();

          setState(() {
            isLoading = false;
          });

          if (response['status'].toString() == 'true') {
            setState(() {
              isLoading = false;
            });

            DialogHelper.showFlutterToast(
                strMsg: "User New password updated!!");
            Navigator.pushReplacementNamed(context, Routes.loginScreen);

            // Navigator.pop(context);
          } else {
            DialogHelper.showFlutterToast(
                strMsg: "The password and confirm password must be match.");
          }
        } else {
          setState(() {
            _error = "Confirm password must match";
            isLoading = false;
          });
          DialogHelper.showFlutterToast(strMsg: "Confirm password must match");
        }
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } else {
      setState(() {
        isLoading = false;
      });
      DialogHelper().shoppopDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 1.h,
                ),
                TextFormScreen(
                  textEditingController: passwordController,
                  hinttext: Languages.of(context)!.newpassword,
                  suffixIcon: true,
                  icon: Icons.lock,
                  obscure: _obscureText,
                  onPressed: _toggle,
                  validator: AppValidator.passwordValidator,
                ),
                SizedBox(
                  height: 2.h,
                ),
                TextFormScreen(
                  textEditingController: confirm_passwordController,
                  hinttext: Languages.of(context)!.confirmnewpassword,
                  suffixIcon: true,
                  icon: Icons.lock,
                  obscure: _obscureText1,
                  onPressed: _toggle1,
                  validator: AppValidator.confirm_passwordValidator,
                ),
                SizedBox(
                  height: 3.h,
                ),
                Center(
                  child: Text(
                    _error,
                    style: AppStyle.textsubsubtitle
                        .copyWith(color: Colors.red, fontSize: 15.sp),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                ButtonWidget(
                  text: Languages.of(context)!.changenewpassword,
                  onTap: () {
                    setState(() {
                      _error = '';
                    });
                    if (isLoading) {
                      return;
                    }

                    resetPassword(passwordController.text,
                        confirm_passwordController.text);
                  },
                )
              ],
            )),
      ],
    );
  }
}
