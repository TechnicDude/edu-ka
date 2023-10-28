import 'dart:io';
import 'package:edukaapp/api/loginapi.dart';
import 'package:edukaapp/localization/Language/languages.dart';
import 'package:edukaapp/page_routes/routes.dart';
import 'package:edukaapp/screens/loginsignup/changenewpassword.dart';
import 'package:edukaapp/screens/loginsignup/changepassword.dart';
import 'package:edukaapp/utils/app_helper.dart';
import 'package:edukaapp/utils/appStringfile.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/buttonwidget.dart';
import 'package:edukaapp/utils/buttonwidgetloader.dart';
import 'package:edukaapp/utils/dialog_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpVerify extends StatefulWidget {
  final String? id;
  final String? email;
  final String? userid;
  final String? pagetype;
  const OtpVerify({Key? key, this.id, this.email, this.pagetype, this.userid})
      : super(key: key);

  @override
  State<OtpVerify> createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String _finalotp = '';
  String _error = '';

  forgotPassword(String email) async {
    var data = {
      'username': email,
    };
    print(email.toString());
    LoginApi registerresponse = LoginApi(data);
    final response = await registerresponse.sentotp();
    if (response['status'].toString() == "true") {
      // Navigator.pushNamed(context, Routes.otpVerify, arguments: {
      //   StringFile.email: email,
      //   StringFile.pagetype: StringFile.forgot_password,
      //   // StringFile.id: response['user']['id'],
      // });

      DialogHelper.showFlutterToast(strMsg: "success");
    } else {
      setState(() {
        _error = response['_error'].toString();
        isLoading = false;
      });
    }
  }

  Future<void> fetchdata() async {
    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (_finalotp.length == 6) {
        var data = {
          'username': widget.email,
          'otp': _finalotp,
          'language': AppHelper.language
        };
        LoginApi registerresponse = LoginApi(data);
        var response;
        if (widget.pagetype == StringFile.forgot_password) {
          response = await registerresponse.verifyForgot();

          print(response);
          print(data.toString());
          if (response['status'].toString().toLowerCase() == "true") {
            Navigator.pushNamed(context, Routes.changenewPassword, arguments: {
              StringFile.email: widget.email,
              StringFile.id: widget.id,
              StringFile.otp: _finalotp,
            });
            DialogHelper.showFlutterToast(
                strMsg: "Otp Verification Done Successfully");
            setState(() {
              isLoading = false;
            });
          } else {
            DialogHelper.showFlutterToast(strMsg: "Registration Failed!");
            setState(() {
              _error = response['error'];
            });
          }
        } else {
          print("object data new");
          // response = await registerresponse.forgetverifyOtp();
          response = await registerresponse.verifyOtp();
          print(response);
          print(data.toString());
          if (response['status'].toString().toLowerCase() == "true") {
            Map<String, dynamic> res = response['data'];
            SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            AppHelper.userid = res['id'].toString();
            AppHelper.email_VALUE = widget.email;
            AppHelper.AUTH_TOKEN_VALUE = response['accessToken'].toString();
            sharedPreferences.setString(
                res['id'].toString(), widget.userid.toString());
            sharedPreferences.setString(
                StringFile.email, widget.email.toString());
            sharedPreferences.setString(
                StringFile.authtoken, response['accessToken'].toString());

            DialogHelper.showFlutterToast(strMsg: response['message']);
            String? token;
            // try {
            //   token = (await FirebaseMessaging.instance.getToken())!;
            //   print(token);
            // } catch (e) {
            //   print(e);
            // }
            // var body = {"facId": token};
            // LoginApi responsefcmtoken = LoginApi(body);
            // final responsefcmtokenreturn =
            //     await responsefcmtoken.factokenregister();
            // print(responsefcmtokenreturn);
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.entryPoint, (route) => false);
          } else {
            print(response);
            DialogHelper.showFlutterToast(strMsg: response['error']);
            setState(() {
              _error = response['error'].toString();
              isLoading = false;
            });
          }
        }
      }
    } else {
      setState(() {
        isLoading = false;
      });
      DialogHelper().shoppopDialog(context);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 4.h, right: 2.h, left: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
                ),
                color: Colors.black,
              ),

              SizedBox(
                height: 3.h,
              ),
              Center(
                child: Text(
                  Languages.of(context)!.otpverify,
                  style: AppStyle.onbaordtitle.copyWith(color: Colors.black),
                ),
              ),

              SizedBox(
                height: 6.h,
              ),
              PinCodeTextField(
                appContext: context,
                length: 6,
                obscureText: false,
                cursorColor: AppColors.colorBlack,
                animationType: AnimationType.fade,
                pastedTextStyle: TextStyle(
                  color: AppColors.appPrimarycolor,
                  fontWeight: FontWeight.bold,
                ),
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    disabledColor: AppColors.colorWhite,
                    borderRadius: BorderRadius.circular(1.h),
                    fieldHeight: 100.w / 8,
                    fieldWidth: 100.w / 8,
                    activeFillColor: AppColors.colorWhite,
                    inactiveColor: AppColors.colorGrey,
                    inactiveFillColor: AppColors.colorWhite,
                    selectedFillColor: AppColors.colorWhite,
                    selectedColor: AppColors.backgroundColor2,
                    activeColor: AppColors.backgroundColor2),
                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: true,
                onCompleted: (v) {
                  print("Completed");
                  _finalotp = v;
                  print(_finalotp);
                },
                onChanged: (value) {
                  print(value);
                  setState(() {
                    // currentText = value;
                  });
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  return true;
                },
              ),
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
                height: 4.h,
              ),
              Center(
                child: Text(
                  Languages.of(context)!.plzenterotpverify,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),

              // ButtonWidget(
              //   onTap: () {
              //     //singIn(context);
              //   },
              //   text: Languages.of(context)!.submit,
              // ),

              !isLoading
                  ? ButtonWidget(
                      text: Languages.of(context)!.verify,
                      onTap: () {
                        setState(() {
                          _error = '';
                        });

                        fetchdata();
                      })
                  : ButtonWidgetLoader(),

              Center(
                child: RichText(
                  text: TextSpan(
                    text: Languages.of(context)!.otpnotrecive,
                    style: AppStyle.onbaordtitlesubtitle
                        .copyWith(color: Colors.grey),
                    children: <TextSpan>[
                      TextSpan(
                          text: Languages.of(context)!.resend,
                          style: AppStyle.onbaordtitlesubtitle
                              .copyWith(color: Colors.black),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              forgotPassword(widget.email!);
                            }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
