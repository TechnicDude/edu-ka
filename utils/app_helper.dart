import 'package:edukaapp/utils/appStringfile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppHelper {
  static String? userid;
  static String? AUTH_TOKEN_VALUE;
  static String? email_VALUE;
  static String? language;
  static String? user_name;
  static String? role_name;

  static String? data;

  static String? avatar;

  static logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    sharedPreferences.setString(StringFile.onBoard, "0");
    userid = null;
  }
}
