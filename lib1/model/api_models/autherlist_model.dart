class AutherListModel {
  String? status;
  List<AutherlistData>? data;
  String? message;

  AutherListModel({this.status, this.data, this.message});

  AutherListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <AutherlistData>[];
      json['data'].forEach((v) {
        data!.add(new AutherlistData.fromJson(v));
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

class AutherlistData {
  int? id;
  String? fullName;
  String? about;
  String? roleName;
  String? otp;
  String? mobile;
  String? email;
  String? avatar;
  String? address;
  int? countryId;
  int? cityId;

  AutherlistData(
      {this.id,
      this.fullName,
      this.about,
      this.roleName,
      this.otp,
      this.mobile,
      this.email,
      this.avatar,
      this.address,
      this.countryId,
      this.cityId});

  AutherlistData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    about = json['about'];
    roleName = json['role_name'];
    otp = json['otp'];
    mobile = json['mobile'];
    email = json['email'];
    avatar = json['avatar'];
    address = json['address'];
    countryId = json['country_id'];
    cityId = json['city_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['about'] = this.about;
    data['role_name'] = this.roleName;
    data['otp'] = this.otp;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    data['address'] = this.address;
    data['country_id'] = this.countryId;
    data['city_id'] = this.cityId;
    return data;
  }
}
