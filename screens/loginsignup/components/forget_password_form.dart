import 'package:edukaapp/api/loginapi.dart';
import 'package:edukaapp/localization/Language/languages.dart';
import 'package:edukaapp/page_routes/routes.dart';
import 'package:edukaapp/screens/entryPoint/entry_point.dart';
import 'package:edukaapp/screens/loginsignup/otpverify.dart';
import 'package:edukaapp/screens/loginsignup/components/sign_in_form.dart';
import 'package:edukaapp/utils/app_helper.dart';
import 'package:edukaapp/utils/appStringfile.dart';
import 'package:edukaapp/utils/app_validator.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/buttonwidget.dart';
import 'package:edukaapp/utils/buttonwidgetloader.dart';
import 'package:edukaapp/utils/textform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';

import '../../../utils/dialog_helper.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({super.key});

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  String _error = '';

  bool isLoading = false;
  TextEditingController emailController = TextEditingController();

  bool isShowLoading = false;
  bool isShowConfetti = false;
  bool _obscureText = true;
  late SMITrigger error;
  late SMITrigger success;
  late SMITrigger reset;

  late SMITrigger confetti;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 1.h, bottom: 2.h),
            child: TextFormScreen(
              textEditingController: emailController,
              hinttext: Languages.of(context)!.passwordrequest.toLowerCase(),
              icon: Icons.email,
              validator: AppValidator.emailValidator,
            ),
          ),
          Center(
            child: Text(
              Languages.of(context)!.passwordrequestmsg,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          // SizedBox(
          //   height: 5.h,
          // ),
          // ButtonWidget(
          //   onTap: () {
          //     Navigator.pushNamed(context, Routes.otpVerify);
          //   },
          //   text: Languages.of(context)!.sendrequest,
          // ),

          SizedBox(
            height: 4.h,
          ),

          Center(
            child: Text(
              _error,
              style: AppStyle.textsubsubtitle
                  .copyWith(color: Colors.red, fontSize: 15.sp),
            ),
          ),

          SizedBox(
            height: 3.h,
          ),

          !isLoading
              ? ButtonWidget(
                  text: Languages.of(context)!.sendrequest,
                  onTap: () {
                    setState(() {
                      _error = '';
                    });
                    if (isLoading) {
                      return;
                    }

                    forgotPassword(emailController.text);
                  },
                )
              : ButtonWidgetLoader(),
        ],
      ),
    );
  }

  forgotPassword(String email) async {
    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (_formKey.currentState!.validate()) {
        var data = {'email': email, 'language': AppHelper.language};
        print(email.toString());
        LoginApi registerresponse = LoginApi(data);
        final response = await registerresponse.sentotp();
        if (response['status'].toString() == "true") {
          Navigator.pushNamed(context, Routes.otpVerify, arguments: {
            StringFile.email: email,
            StringFile.pagetype: StringFile.forgot_password,
          });
        } else {
          print(response);
          setState(() {
            _error = response['error'].toString();
            isLoading = false;
          });
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
}
