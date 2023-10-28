class BannerListModel {
  String? status;
  List<BannerData>? data;
  String? message;

  BannerListModel({this.status, this.data, this.message});

  BannerListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <BannerData>[];
      json['data'].forEach((v) {
        data!.add(new BannerData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class BannerData {
  int? id;
  int? advertisingBannerId;
  String? locale;
  String? title;
  String? image;

  BannerData(
      {this.id, this.advertisingBannerId, this.locale, this.title, this.image});

  BannerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    advertisingBannerId = json['advertising_banner_id'];
    locale = json['locale'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['advertising_banner_id'] = this.advertisingBannerId;
    data['locale'] = this.locale;
    data['title'] = this.title;
    data['image'] = this.image;
    return data;
  }
}
