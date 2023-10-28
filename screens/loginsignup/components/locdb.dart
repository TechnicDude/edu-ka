import 'dart:developer';

import 'package:edukaapp/utils/app_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/appStringfile.dart';

class LocDb {
  LocDb._internal();
  static final LocDb _db = LocDb._internal();
  factory LocDb() {
    return _db;
  }
  bool loginapp = false;

  Future<bool> isLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    AppHelper.language = preferences.getString("SelectedLanguageCode");
    AppHelper.AUTH_TOKEN_VALUE = preferences.getString(StringFile.authtoken);
    AppHelper.userid = preferences.getString(StringFile.userid);
    AppHelper.email_VALUE = preferences.getString(StringFile.email);

    log(AppHelper.userid.toString());
    log(AppHelper.language.toString());

    if (AppHelper.userid == null || AppHelper.userid == false) {
      print(AppHelper.userid);
      return false;
    } else {
      // LikeApi registerresponse = LikeApi();
      // final response = await registerresponse.meapi();
      // print(response);
      // if (response['status'].toString().toLowerCase() == "error") {
      //   AppHelper.logout();
      //   return false;
      // }
      return true;
      // print("object check 1");
    }
  }
}
