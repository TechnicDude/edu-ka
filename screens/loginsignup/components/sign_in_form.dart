import 'package:edukaapp/api/loginapi.dart';
import 'package:edukaapp/localization/Language/languages.dart';
import 'package:edukaapp/page_routes/routes.dart';
import 'package:edukaapp/screens/entryPoint/entry_point.dart';
import 'package:edukaapp/screens/loginsignup/forgetpassword.dart';
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
import 'package:shared_preferences/shared_preferences.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isShowLoading = false;
  bool isShowConfetti = false;
  bool _obscureText = true;
  late SMITrigger error;
  late SMITrigger success;
  late SMITrigger reset;
  String _error = '';
  bool isLoading = false;
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

  void login(email, password) {
    setState(() {
      isLoading = true;
      isShowLoading = true;
      isShowConfetti = true;
    });

    Future.delayed(const Duration(seconds: 1), () async {
      final bool isConnected = await InternetConnectionChecker().hasConnection;

      if (isConnected) {
        if (_formKey.currentState!.validate()) {
          var data = {
            'username': email,
            'password': password,
            'language': AppHelper.language
          };

          print(data.toString());
          LoginApi registerresponse = LoginApi(data);
          final response = await registerresponse.login();
          print(response);
          if (response['status'].toString().toLowerCase() == "true") {
            Map<String, dynamic> res = response['data'];

            SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();

            AppHelper.userid = res['user_id'].toString();
            AppHelper.email_VALUE = res['email'].toString();
            AppHelper.AUTH_TOKEN_VALUE = res['token'].toString();
            AppHelper.user_name = res['user_name'].toString();
            AppHelper.avatar = res['avatar'].toString();
            AppHelper.role_name = res['role_name'].toString();
            AppHelper.data = res['data'];

            sharedPreferences.setString(
                StringFile.userid, res['user_id'].toString());
            sharedPreferences.setString(
                StringFile.email, res['email'].toString());
            sharedPreferences.setString(
                StringFile.authtoken, res['token'].toString());
            sharedPreferences.setString(
                StringFile.user_name, res['user_name'].toString());
            sharedPreferences.setString(
                StringFile.avatar, res['avatar'].toString());
            sharedPreferences.setString(
                StringFile.role_name, res['role_name'].toString());
            sharedPreferences.setString(StringFile.data, res['data']);
            String? token;

            // var body = {"facId": token};
            // LoginApi responsefcmtoken = LoginApi(body);

            // final responsefcmtokenreturn =
            //     await responsefcmtoken.factokenregister();
            // print(responsefcmtokenreturn);

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
                  // Navigator.pushNamed(context, Routes.entryPoint);

                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.entryPoint, (route) => false);
                  DialogHelper.showFlutterToast(strMsg: "Login successful");
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

                if (_error == "The email has not been verified")
                  Navigator.pushNamed(context, Routes.otpVerify, arguments: {
                    StringFile.pagetype: StringFile.signup,
                    StringFile.email: email,
                  });
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
            DialogHelper().shoppopDialog(context);
          },
        );
      }
    });
  }

  bool valuedata = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.forgetPassword);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      Languages.of(context)!.forgotpassword,
                      //  "Forget Password ?",
                      style: TextStyle(
                        color: Colors.black26,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
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
                text: Languages.of(context)!.login,
                onTap: () {
                  login(emailController.text, passwordController.text);
                },
              )
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
