import 'package:edukaapp/api/loginapi.dart';
import 'package:edukaapp/localization/Language/languages.dart';
import 'package:edukaapp/page_routes/routes.dart';
import 'package:edukaapp/screens/entryPoint/entry_point.dart';
import 'package:edukaapp/utils/app_helper.dart';
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

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  bool _obscureText = true;
  bool _obscureText1 = true;

  String _error = '';

  TextEditingController currentpasswordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();
  TextEditingController confirmnewpasswordController = TextEditingController();

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

  // void singIn(BuildContext context) {
  //   // confetti.fire();
  //   setState(() {
  //     isShowConfetti = true;
  //     isShowLoading = true;
  //   });
  //   Future.delayed(
  //     const Duration(seconds: 1),
  //     () {
  //       if (_formKey.currentState!.validate()) {
  //         success.fire();
  //         Future.delayed(
  //           const Duration(seconds: 2),
  //           () {
  //             setState(() {
  //               isShowLoading = false;
  //             });
  //             confetti.fire();
  //             // Navigate & hide confetti
  //             Future.delayed(const Duration(seconds: 1), () {
  //               Navigator.pushNamed(context, Routes.entryPoint);
  //             });
  //           },
  //         );
  //       } else {
  //         error.fire();
  //         Future.delayed(
  //           const Duration(seconds: 2),
  //           () {
  //             setState(() {
  //               isShowLoading = false;
  //             });
  //             reset.fire();
  //           },
  //         );
  //       }
  //     },
  //   );
  // }

  changePassword(String currentpassword, String newpassword,
      String confirmnewpassword) async {
    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (_formKey.currentState!.validate()) {
        if (newpasswordController.text == confirmnewpasswordController.text) {
          if (currentpasswordController.text != newpasswordController.text) {
            var data = {
              //'id': widget.id,
              'currentPassword': currentpassword,
              'newPassword': newpassword,
              'confirmnewpassword': confirmnewpassword,
              'language': AppHelper.language

              // 'email': widget.email,
            };

            LoginApi registerresponse = LoginApi(data);
            var response = await registerresponse.changepassword();
            print(response);
            setState(() {
              isLoading = false;
            });

            if (response['status'].toString() == 'success') {
              setState(() {
                isLoading = false;
              });

              DialogHelper.showFlutterToast(
                  strMsg: "User New password Updated!!");
              // Navigator.pushReplacementNamed(context, Routes.loginScreen);

              Navigator.pop(context);
            } else {
              DialogHelper.showFlutterToast(
                  strMsg: "Current password is Incorrect");
            }
          } else {
            setState(() {
              _error = "Current password and new password should not be same";
              isLoading = false;
            });
            DialogHelper.showFlutterToast(
                strMsg: "Current password and new password should not be same");
          }
        } else {
          setState(() {
            _error = "New password and current password must be not match";
            isLoading = false;
          });
          DialogHelper.showFlutterToast(
              strMsg: "New password and current password must be not match");
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
                  textEditingController: currentpasswordController,
                  hinttext: Languages.of(context)!.oldpassword,
                  // suffixIcon: true,
                  icon: Icons.lock,
                  // obscure: _obscureText1,
                  // onPressed: _toggle1,

                  validator: AppValidator.currentpasswordValidator,
                ),
                SizedBox(
                  height: 2.h,
                ),
                TextFormScreen(
                  textEditingController: newpasswordController,
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
                  textEditingController: confirmnewpasswordController,
                  hinttext: Languages.of(context)!.confirmnewpassword,
                  suffixIcon: true,
                  icon: Icons.lock,
                  obscure: _obscureText1,
                  onPressed: _toggle1,
                  validator: AppValidator.confirm_passwordValidator,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  _error,
                  style: AppStyle.textsubtitle
                      .copyWith(color: Colors.red, fontSize: 15.sp),
                ),
                SizedBox(
                  height: 3.h,
                ),
                ButtonWidget(
                  onTap: () {
                    //  singIn(context);

                    !isLoading
                        ? ButtonWidget(
                            text: Languages.of(context)!.submit,
                            onTap: () {
                              setState(() {
                                _error = '';
                              });
                              if (isLoading) {
                                return;
                              }

                              changePassword(
                                  currentpasswordController.text,
                                  newpasswordController.text,
                                  confirmnewpasswordController.text);
                            },
                          )
                        : ButtonWidgetLoader();
                  },
                  text: Languages.of(context)!.changepassword,
                ),
              ],
            )),
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
