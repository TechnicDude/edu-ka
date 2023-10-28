import 'package:flutter/material.dart';

abstract class Languages {
  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get appName;
  String get labelWelcome;
  String get labelInfo;
  String get labelChangeLanguage;
  String get labelSelectLanguage;

  //onborard screen
  String get onboardtitle;
  String get onboardsubtitle;
  String get onboardstarts;
  String get skip;
  String get done;

  String get name;
  String get email;
  String get password;
  String get mobile;

  String get pleaseenteremail;
  String get pleaseentervalidemail;
  String get pleaseenterpassword;
  String get pleaseentervalidpassword;

// authentication part
  String get login;
  String get signup;
  String get forgotpassword;
  String get sendrequest;
  String get passwordrequest;
  String get passwordrequestmsg;
  String get otpverify;
  String get verify;
  String get submit;
  String get changenewpassword;
  String get changepassword;
  String get rememberyourpassword;
  String get plzenterotpverify;

  String get newpassword;
  String get confirmnewpassword;
  String get oldpassword;

  //dashboard part
  String get course;
  String get categories;
  String get subcategories;

// social login
  String get loginwithgoogle;
  String get loginwithfb;
  String get loginwithapple;
  String get orloginwith;
  String get donthaveaccount;
  String get otpnotrecive;
  String get resend;
  String get alreadyregister;
  String get iacceptthe;
  String get termsandcondition;
  String get firstname;
  String get lastname;

// profile show and update profile
  String get editprofile;
  String get subscriptions;
  String get paymentmethod;
  String get deleteaccount;
  String get logout;
  String get logoutedukamsg;
  String get deleteaccountmsg;
  String get update;

//account section
  String get myaccount;
  String get contactus;
  String get feedback;
  String get privacypolicy;
  String get cookiespolicy;
  String get accountsettings;
  String get helpnsupport;
  String get abouteduka;
  String get rateapp;
  String get shareapp;

  // home
  String get seeall;
  String get enrollcourse;
  String get popularcourse;
  String get auther;

  //drawer
  String get myprofile;
  String get home;
  String get mycourse;
  String get mycart;
  String get changelanguage;
  String get checkout;
  String get completecheckout;
  // details page
  String get buynow;
  String get addtocart;
  String get addtofavorite;
  String get favoritecourse;
  // others
  String get notification;
  String get searchcourse;
}
