import 'package:edukaapp/api/api.dart';
import 'package:edukaapp/api/network.dart';
import 'package:edukaapp/model/api_models/favorite_model.dart';
import 'package:edukaapp/utils/app_helper.dart';
import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  FavoriteModel favoriteModel = FavoriteModel();

  List<FavoriteData> _favoritelist = [];
  List<FavoriteData> get favoriteList => _favoritelist;

  bool datanotfound = false;

  Future favoritelist() async {
    var url = APIURL.favorite + "?language=${AppHelper.language}";

    ServiceWithHeader service = new ServiceWithHeader(url);
    final response = await service.data();

    favoriteModel = FavoriteModel.fromJson(response);

    _favoritelist = [];
    if (favoriteModel.data != null) {
      if (favoriteModel.data!.isNotEmpty) {
        for (int i = 0; i < favoriteModel.data!.length; i++) {
          _favoritelist.add(favoriteModel.data![i]);
        }
      }
    }
    datanotfound = true;
    notifyListeners();
    return;
  }
}
