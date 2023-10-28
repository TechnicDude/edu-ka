import 'package:edukaapp/api/loginapi.dart';
import 'package:edukaapp/localization/Language/languages.dart';
import 'package:edukaapp/page_routes/routes.dart';
import 'package:edukaapp/screens/entryPoint/entry_point.dart';
import 'package:edukaapp/utils/app_helper.dart';
import 'package:edukaapp/utils/appStringfile.dart';
import 'package:edukaapp/utils/app_validator.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/buttonwidget.dart';
import 'package:edukaapp/utils/buttonwidgetloader.dart';
import 'package:edukaapp/utils/dialog_helper.dart';
import 'package:edukaapp/utils/textform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  bool isLoading = false;
  bool isShowLoading = false;
  bool isShowConfetti = false;
  bool _obscureText = true;
  late SMITrigger error;
  late SMITrigger success;
  late SMITrigger reset;
  bool valuedata = false;
  String _error = '';
  late SMITrigger confetti;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _onCheckRiveInit(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');

    artboard.addController(controller!);
    error = controller.findInput<bool>('Error') as SMITrigger;
    success = controller.findInput<bool>('Check') as SMITrigger;
    reset = controller.findInput<bool>('Reset') as SMITrigger;
  }

  void _onConfettiRiveInit(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, "State Machine 1");
    artboard.addController(controller!);

    confetti = controller.findInput<bool>("Trigger explosion") as SMITrigger;
  }

  void signup(firstname, lastname, email, password, mobile) async {
    setState(() {
      isLoading = true;
      isShowLoading = true;
      isShowConfetti = true;
    });

    Future.delayed(const Duration(seconds: 1), () async {
      final bool isConnected = await InternetConnectionChecker().hasConnection;
      if (isConnected) {
        if (valuedata == true) {
          if (_formKey.currentState!.validate()) {
            var data = {
              'first_name': firstname,
              'last_name': lastname,
              'email': email,
              'password': password,
              'mobile': mobile,
              'language': AppHelper.language
            };
            LoginApi registerresponse = LoginApi(data);
            var response = await registerresponse.register();

            print(response);
            print(data.toString());

            if (response['status'].toString().toLowerCase() == "true") {
              Map<String, dynamic> user = response['data'];

              success.fire();
              Future.delayed(
                const Duration(seconds: 2),
                () {
                  setState(() {
                    isShowLoading = false;
                    isLoading = false;
                  });
                  confetti.fire();
                  Future.delayed(const Duration(seconds: 1), () {
                    Navigator.pushNamed(context, Routes.otpVerify, arguments: {
                      StringFile.pagetype: StringFile.signup,
                      StringFile.email: email,
                    });
                    DialogHelper.showFlutterToast(strMsg: "OTP has been sent");
                  });
                },
              );
            } else {
              error.fire();
              Future.delayed(
                const Duration(seconds: 2),
                () {
                  setState(() {
                    isShowLoading = false;
                    _error = response['error'].toString();
                    isLoading = false;
                  });
                  reset.fire();
                },
              );
            }
          } else {
            error.fire();
            Future.delayed(
              const Duration(seconds: 2),
              () {
                setState(() {
                  isShowLoading = false;
                  isLoading = false;
                });
                reset.fire();
              },
            );
          }
        } else {
          error.fire();
          Future.delayed(
            const Duration(seconds: 2),
            () {
              setState(() {
                isShowLoading = false;
                isLoading = false;
              });
              reset.fire();
              DialogHelper.showFlutterToast(
                  strMsg: "Please accept the terms and conditions");
            },
          );
        }
      } else {
        error.fire();
        Future.delayed(
          const Duration(seconds: 2),
          () {
            setState(() {
              isShowLoading = false;
              isLoading = false;
            });
            reset.fire();
            DialogHelper().shoppopDialog(context);
          },
        );
      }
    });
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
              Text(
                Languages.of(context)!.firstname,
                style:
                    AppStyle.onbaordtitlesubtitle.copyWith(color: Colors.black),
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.h, bottom: 2.h),
                child: TextFormScreen(
                  hinttext: Languages.of(context)!.firstname,
                  icon: Icons.account_circle,
                  textEditingController: firstnameController,
                  validator: AppValidator.nameValidator,
                ),
              ),
              Text(
                Languages.of(context)!.lastname,
                style:
                    AppStyle.onbaordtitlesubtitle.copyWith(color: Colors.black),
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.h, bottom: 2.h),
                child: TextFormScreen(
                  hinttext: Languages.of(context)!.lastname,
                  icon: Icons.account_circle,
                  textEditingController: lastnameController,
                  validator: AppValidator.nameValidator,
                ),
              ),
              Text(
                Languages.of(context)!.email,
                style:
                    AppStyle.onbaordtitlesubtitle.copyWith(color: Colors.black),
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.h, bottom: 2.h),
                child: TextFormScreen(
                  textEditingController: emailController,
                  hinttext: Languages.of(context)!.email.toLowerCase(),
                  icon: Icons.email,
                  validator: AppValidator.emailValidator,
                ),
              ),
              Text(
                Languages.of(context)!.password,
                style:
                    AppStyle.onbaordtitlesubtitle.copyWith(color: Colors.black),
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.h, bottom: 2.h),
                child: TextFormScreen(
                  hinttext: Languages.of(context)!.password,
                  icon: Icons.lock,
                  textEditingController: passwordController,
                  validator: AppValidator.passwordValidator,
                  suffixIcon: true,
                  obscure: _obscureText,
                  onPressed: _toggle,
                ),
              ),
              Text(
                Languages.of(context)!.mobile,
                style:
                    AppStyle.onbaordtitlesubtitle.copyWith(color: Colors.black),
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
                child: TextFormScreen(
                  hinttext: Languages.of(context)!.mobile,
                  icon: Icons.phone_android_rounded,
                  textEditingController: mobileController,
                  validator: AppValidator.mobileValidator,
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: this.valuedata,
                    onChanged: (bool? value) {
                      setState(() {
                        this.valuedata = value!;
                      });
                    },
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.webViewScreensShow,
                          arguments: {
                            StringFile.url: "http://imp-lms.impdevops.com/"
                          });
                    },
                    child: Row(
                      children: [
                        Text(
                          Languages.of(context)!.iacceptthe,
                          style: AppStyle.textcatsubtitle
                              .copyWith(color: Colors.black),
                        ),
                        Text(
                          Languages.of(context)!.termsandcondition,
                          style: AppStyle.textcatsubtitle
                              .copyWith(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
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
                onTap: () {
                  // if (isLoading) {
                  //   return;
                  // }

                  signup(
                      firstnameController.text,
                      lastnameController.text,
                      emailController.text,
                      passwordController.text,
                      mobileController.text);
                  // signup(
                  //   context);
                },
                text: Languages.of(context)!.signup,
              ),
            ],
          ),
        ),
        isShowLoading
            ? CustomPositioned(
                child: RiveAnimation.asset(
                  'assets/RiveAssets/check.riv',
                  fit: BoxFit.cover,
                  onInit: _onCheckRiveInit,
                ),
              )
            : const SizedBox(),
        isShowConfetti
            ? CustomPositioned(
                scale: 6,
                child: RiveAnimation.asset(
                  "assets/RiveAssets/confetti.riv",
                  onInit: _onConfettiRiveInit,
                  fit: BoxFit.cover,
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  signup1(firatname, lastname, email, password, mobile) async {
    setState(() {
      isLoading = true;
    });

    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (valuedata == true) {
        if (_formKey.currentState!.validate()) {
          var data = {
            'first_name': firatname,
            'last_name': lastname,
            'email': email,
            'password': password,
            'mobile': mobile,
          };
          LoginApi registerresponse = LoginApi(data);
          var response = await registerresponse.register();
          print(response);
          print(data.toString());

          if (response['status'].toString().toLowerCase() == "success") {
            Map<String, dynamic> user = response['data'];

            Navigator.pushNamed(context, Routes.otpVerify, arguments: {
              StringFile.pagetype: StringFile.signup,
              StringFile.email: email,
            });
            setState(() {
              isLoading = false;
            });
            DialogHelper.showFlutterToast(strMsg: "OTP has been sent");
          } else {
            setState(() {
              _error = response['error'].toString();
              isLoading = false;
            });
          }

          // DialogHelper.showFlutterToast(strMsg: "Registration Successful");
        } else {
          setState(() {
            isLoading = false;
          });
        }
      } else {
        setState(() {
          DialogHelper.showFlutterToast(strMsg: "Please accept the terms");
          isLoading = false;
        });
      }
    } else {
      setState(() {
        isLoading = false;
      });
      // DialogHelper().shoppopDialog(context);
    }
  }
}

class CustomPositioned extends StatelessWidget {
  const CustomPositioned({super.key, this.scale = 1, required this.child});

  final double scale;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          const Spacer(),
          SizedBox(
            height: 100,
            width: 100,
            child: Transform.scale(
              scale: scale,
              child: child,
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
