import 'package:edukaapp/api/api.dart';
import 'package:edukaapp/api/network.dart';
import 'package:edukaapp/model/api_models/profile_model.dart';
import 'package:flutter/material.dart';
import '../utils/app_helper.dart';

class ProfileUserProvider extends ChangeNotifier {
  ProfileUserModel profileuserModel = ProfileUserModel();

  List<ProfileUserData> _profileuserlist = [];
  List<ProfileUserData> get profileuserList => _profileuserlist;

  bool datanotfound = false;

  Future profileuserlist(String email) async {
    // print("object data");
    var url = APIURL.userprofile;
    ServiceWithHeader _service = new ServiceWithHeader(url);
    final response = await _service.data();
    // print(response);
    _profileuserlist = [];
    profileuserModel = ProfileUserModel.fromJson(response);
    if (profileuserModel.data != null) {
      var profileuser = profileuserModel.data;
      _profileuserlist.add(profileuser!);
      notifyListeners();
    }
  }
}
