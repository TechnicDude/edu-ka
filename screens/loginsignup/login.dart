import 'dart:developer';
import 'dart:io';
import 'package:edukaapp/api/loginapi.dart';
import 'package:edukaapp/localization/Language/languages.dart';
import 'package:edukaapp/main.dart';
import 'package:edukaapp/page_routes/routes.dart';
import 'package:edukaapp/screens/loginsignup/signup.dart';
import 'package:edukaapp/screens/loginsignup/components/sign_in_form.dart';
import 'package:edukaapp/utils/appStringfile.dart';
import 'package:edukaapp/utils/app_helper.dart';
import 'package:edukaapp/utils/appimages.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/dialog_helper.dart';
import 'package:edukaapp/utils/loaderscreen.dart';
import 'package:edukaapp/utils/socialbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginScreenActivity extends StatefulWidget {
  const LoginScreenActivity({super.key});

  @override
  State<LoginScreenActivity> createState() => _LoginScreenActivityState();
}

class _LoginScreenActivityState extends State<LoginScreenActivity> {
  bool isLoading = false;

  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    print("googleAuth $googleAuth");
    log(googleAuth!.idToken.toString());

    googlelogin(googleAuth.idToken.toString());
  }

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    log("lang ${AppHelper.language}");
    super.initState();
  }

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final AccessToken accessToken = loginResult.accessToken!;
    final OAuthCredential credential =
        FacebookAuthProvider.credential(accessToken.token);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  googlelogin(String token) async {
    var data = {
      'token': token,
    };
    LoginApi registerresponse = LoginApi(data);
    final response = await registerresponse.googlesocialmedialogin();
    if (response['status'] == 'true') {
      Map<String, dynamic> res = response['user'];
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      // MyApp.userid = res['id'].toString();
      // MyApp.email_VALUE = res['email'].toString();
      // MyApp.AUTH_TOKEN_VALUE = response['accessToken'].toString();
      // sharedPreferences.setString(StringFile.userid, res['id'].toString());
      // sharedPreferences.setString(StringFile.email, res['email'].toString());
      // sharedPreferences.setString(
      //     StringFile.authtoken, response['accessToken'].toString());
      String? token;
      try {
        token = (await FirebaseMessaging.instance.getToken())!;
        print(token);
      } catch (e) {
        print(e);
      }
      var body = {"facId": token};
      LoginApi responsefcmtoken = LoginApi(body);
      final responsefcmtokenreturn = await responsefcmtoken.factokenregister();
      print(responsefcmtokenreturn);
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.entryPoint, (route) => false);
      DialogHelper.showFlutterToast(strMsg: "Login Successful");
    }
  }

  facebooklogin(String token) async {
    var data = {
      'token': token,
    };
    print(data.toString());
    LoginApi registerresponse = LoginApi(data);
    final response = await registerresponse.facebooksocialmedialogin();

    if (response['status'] == 'success') {
      Map<String, dynamic> res = response['user'];

      // SharedPreferences sharedPreferences =
      //     await SharedPreferences.getInstance();
      // MyApp.userid = res['id'].toString();
      // MyApp.email_VALUE = res['email'].toString();
      // MyApp.AUTH_TOKEN_VALUE = response['accessToken'].toString();
      // sharedPreferences.setString(StringFile.userid, res['id'].toString());
      // sharedPreferences.setString(StringFile.email, res['email'].toString());
      // sharedPreferences.setString(
      //     StringFile.authtoken, response['accessToken'].toString());
      String? token;
      try {
        token = (await FirebaseMessaging.instance.getToken())!;
        print(token);
      } catch (e) {
        print(e);
      }
      var body = {"facId": token};
      LoginApi responsefcmtoken = LoginApi(body);
      final responsefcmtokenreturn = await responsefcmtoken.factokenregister();
      print(responsefcmtokenreturn);
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.entryPoint, (route) => false);
      DialogHelper.showFlutterToast(strMsg: "Login Successful");
    }
  }

  applelogin(String token) async {
    var data = {
      'token': token,
    };
    LoginApi registerresponse = LoginApi(data);
    final response = await registerresponse.appleocialmedialogin();
    if (response['status'] == 'success') {
      Map<String, dynamic> res = response['user'];

      // SharedPreferences sharedPreferences =
      //     await SharedPreferences.getInstance();
      // MyApp.userid = res['id'].toString();
      // MyApp.email_VALUE = res['email'].toString();
      // MyApp.AUTH_TOKEN_VALUE = response['accessToken'].toString();
      // sharedPreferences.setString(StringFile.userid, res['id'].toString());
      // sharedPreferences.setString(StringFile.email, res['email'].toString());
      // sharedPreferences.setString(
      //     StringFile.authtoken, response['accessToken'].toString());

      String? token;
      try {
        token = (await FirebaseMessaging.instance.getToken())!;
        print(token);
      } catch (e) {
        print(e);
      }
      var body = {"facId": token};
      LoginApi responsefcmtoken = LoginApi(body);
      final responsefcmtokenreturn = await responsefcmtoken.factokenregister();
      print(responsefcmtokenreturn);
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.entryPoint, (route) => false);
      DialogHelper.showFlutterToast(strMsg: "Login Successful");
    }
  }

  bool isLoadingpop = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: SingleChildScrollView(
        // child: Stack(
        //   children: [
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
                      Languages.of(context)!.login,
                      style:
                          AppStyle.onbaordtitle.copyWith(color: Colors.black),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    const SignInForm(),
                    SizedBox(
                      height: 1.h,
                    ),
                    RichText(
                      text: TextSpan(
                        text: Languages.of(context)!.donthaveaccount,
                        style: TextStyle(
                          color: Colors.black26,
                          fontWeight: FontWeight.w500,
                        ),
                        // style: Style_File.subtitle.copyWith(
                        //   color: Colors.grey,
                        // ),
                        children: <TextSpan>[
                          TextSpan(
                              text: Languages.of(context)!.signup,
                              style: TextStyle(
                                color: Colors.black,
                                // fontWeight: FontWeight.w500,
                              ),
                              // style: Style_File.subtitle.copyWith(
                              //     color: colorBlack, fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.pushNamed(
                                    context, Routes.signupScreen)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            Languages.of(context)!.orloginwith,
                            style: TextStyle(
                              color: Colors.black26,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     IconButton(
                    //       onPressed: () {},
                    //       padding: EdgeInsets.zero,
                    //       icon: SvgPicture.asset(
                    //         "assets/icons/email_box.svg",
                    //         height: 64,
                    //         width: 64,
                    //       ),
                    //     ),
                    //     IconButton(
                    //       onPressed: () {},
                    //       padding: EdgeInsets.zero,
                    //       icon: SvgPicture.asset(
                    //         "assets/icons/apple_box.svg",
                    //         height: 64,
                    //         width: 64,
                    //       ),
                    //     ),
                    //     IconButton(
                    //       onPressed: () {},
                    //       padding: EdgeInsets.zero,
                    //       icon: SvgPicture.asset(
                    //         "assets/icons/google_box.svg",
                    //         height: 64,
                    //         width: 64,
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    if (Platform.isIOS)
                      SocialButton(
                        image: AppImages.applewhite,
                        text: Languages.of(context)!.loginwithapple,
                        boxcolor: Colors.black,
                        textcolor: Colors.white,
                        onPressed: () async {
                          isLoading = true;
                          final credentials = await SignInWithApple.channel;
                          // print("credentials $credentials");
                          final credential =
                              await SignInWithApple.getAppleIDCredential(
                                  scopes: [
                                AppleIDAuthorizationScopes.email,
                                AppleIDAuthorizationScopes.fullName,
                              ],
                                  state: 'state');
                          log(credential.identityToken.toString());
                          applelogin(credential.identityToken.toString());
                        },
                      ),
                    SocialButton(
                      image: AppImages.google,
                      text: Languages.of(context)!.loginwithgoogle,
                      //  text: 'Sign in with Google',
                      boxcolor: Colors.white,
                      textcolor: Colors.black,
                      onPressed: () {
                        isLoading = true;
                        signInWithGoogle();
                      },
                    ),
                    SocialButton(
                      image: AppImages.facebook,
                      text: Languages.of(context)!.loginwithfb,
                      boxcolor: Colors.black,
                      textcolor: Colors.white,
                      onPressed: () async {
                        final userCredential = await signInWithFacebook();
                        if (userCredential != null) {
                          // here you will have your Firebase user in:
                          // userCredential.user

                          log(await userCredential.user!.getIdToken());
                          final idToken =
                              await userCredential.user!.getIdToken();
                          print("idToken $idToken");
                          print(await userCredential.user!);
                          facebooklogin(idToken.toString());
                        }
                      },
                    ),

                    SizedBox(
                      height: 4.h,
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),

        //   SizedBox(height: 90.h, child: LoaderScreen())
        //   ],
        // ),
      ),
    );
  }
}
