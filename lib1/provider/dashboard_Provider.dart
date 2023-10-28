import 'package:edukaapp/api/network.dart';
import 'package:edukaapp/model/api_models/allcourselist_model.dart';
import 'package:edukaapp/model/api_models/autherlist_model.dart';
import 'package:edukaapp/model/api_models/banner_model.dart';
import 'package:edukaapp/model/api_models/categort_model.dart';
import 'package:edukaapp/model/api_models/popularlist_model.dart';
import 'package:edukaapp/utils/app_helper.dart';
import 'package:flutter/cupertino.dart';

import '../api/api.dart';
import '../model/api_models/profile_model.dart';

class DashBoradProvider extends ChangeNotifier {
  ProfileUserModel profileuserModel = ProfileUserModel();
  BannerListModel bannerListModel = BannerListModel();
  CategoryModel categoryModel = CategoryModel();
  PopularListModel popularListModel = PopularListModel();
  AutherListModel autherListModel = AutherListModel();
  AutherListModel autherListModelbyid = AutherListModel();
  AllCourselistModel allCourselistModel = AllCourselistModel();

  List<ProfileUserData> _profileuserlist = [];
  List<ProfileUserData> get profileuserList => _profileuserlist;

  List<BannerData> _bannerlist = [];
  List<BannerData> get bannerList => _bannerlist;

  List<CategoryData> _categorylist = [];
  List<CategoryData> get categoryList => _categorylist;

  List<PopularlistData> _popularlist = [];
  List<PopularlistData> get popularList => _popularlist;
  List<AllCourselistData> _allCourselistbyid = [];
  List<AllCourselistData> get allCourseListbyid => _allCourselistbyid;

  List<AutherlistData> _autherlist = [];
  List<AutherlistData> get autherList => _autherlist;

  List<AutherlistData> _autherlistbyid = [];
  List<AutherlistData> get autherListbyid => _autherlistbyid;

  bool profiledatanotfound = false;
  bool datanotfound = false;
  bool bannerfetch = false;
  bool popularfetch = false;
  bool autherfetch = false;
  bool allcourselistfetch = false;

  Future profileuserlist(String email) async {
    var url = APIURL.userprofile;
    ServiceWithHeader _service = new ServiceWithHeader(url);
    final response = await _service.data();

    _profileuserlist = [];
    profileuserModel = ProfileUserModel.fromJson(response);
    if (profileuserModel.data != null) {
      var profileuser = profileuserModel.data;
      _profileuserlist.add(profileuser!);
      notifyListeners();
    }
  }

  Future bannerlist() async {
    bannerfetch = false;
    ServiceWithHeader service = new ServiceWithHeader(
        APIURL.bannerurl + "?language=${AppHelper.language}");

    final response = await service.data();

    bannerListModel = BannerListModel.fromJson(response);
    _bannerlist = [];
    if (bannerListModel.data != null) {
      if (bannerListModel.data!.isNotEmpty) {
        for (int i = 0; i < bannerListModel.data!.length; i++) {
          _bannerlist.add(bannerListModel.data![i]);
        }
      }
    }
    bannerfetch = true;
    notifyListeners();
    return;
  }

  Future categorylist() async {
    print(AppHelper.AUTH_TOKEN_VALUE);
    var url = APIURL.coursecategory + "?language=${AppHelper.language}";
    ServiceWithHeader service = new ServiceWithHeader(url);

    final response = await service.datame();

    categoryModel = CategoryModel.fromJson(response);
    if (categoryModel.data != null) {
      if (categoryModel.data!.isNotEmpty) {
        _categorylist = [];
        for (int i = 0; i < categoryModel.data!.length; i++) {
          _categorylist.add(categoryModel.data![i]);
        }
      }
    }
    notifyListeners();
    return;
  }

  Future allcourselist() async {
    allcourselistfetch = false;
    ServiceWithHeader service = new ServiceWithHeader(
        APIURL.allcourselist + "?language=${AppHelper.language}");

    final response = await service.data();

    allCourselistModel = AllCourselistModel.fromJson(response);
    _allCourselistbyid = [];
    if (allCourselistModel.data != null) {
      if (allCourselistModel.data!.isNotEmpty) {
        for (int i = 0; i < allCourselistModel.data!.length; i++) {
          _allCourselistbyid.add(allCourselistModel.data![i]);
        }
      }
    }
    allcourselistfetch = true;
    notifyListeners();
    return;
  }

  Future popularlist() async {
    popularfetch = false;
    ServiceWithHeader service = new ServiceWithHeader(
        APIURL.popularcourse + "?language=${AppHelper.language}");

    final response = await service.data();

    popularListModel = PopularListModel.fromJson(response);
    _popularlist = [];
    if (popularListModel.data != null) {
      if (popularListModel.data!.isNotEmpty) {
        for (int i = 0; i < popularListModel.data!.length; i++) {
          _popularlist.add(popularListModel.data![i]);
        }
      }
    }
    popularfetch = true;
    notifyListeners();
    return;
  }

  Future autherlist() async {
    autherfetch = false;
    ServiceWithHeader service = new ServiceWithHeader(
        APIURL.autherlist + "?language=${AppHelper.language}");

    final response = await service.data();

    autherListModel = AutherListModel.fromJson(response);
    _autherlist = [];
    if (autherListModel.data != null) {
      if (autherListModel.data!.isNotEmpty) {
        for (int i = 0; i < autherListModel.data!.length; i++) {
          _autherlist.add(autherListModel.data![i]);
        }
      }
    }
    autherfetch = true;
    notifyListeners();
    return;
  }

  Future autherlistbyid(String autherId) async {
    datanotfound = false;

    var url = APIURL.autherlist + autherId + "?language=${AppHelper.language}";
    ServiceWithHeader service = new ServiceWithHeader(url);

    final response = await service.data();
    autherListModelbyid = AutherListModel.fromJson(response);
    _autherlistbyid = [];
    if (autherListModelbyid.data != null) {
      // print(recipeModelbyid.data!.length);
      // for (int i = 0; i < autherListModelbyid.data!.length; i++) {
      //print(autherListModelbyid.data!);

      // _autherlistbyid.add(autherListModelbyid.data);

      // }
      //  }
      notifyListeners();
      return;
    }
  }
}
