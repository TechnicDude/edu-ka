class ProfileUserModel {
  String? status;
  ProfileUserData? data;
  String? message;

  ProfileUserModel({this.status, this.data, this.message});

  ProfileUserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null
        ? new ProfileUserData.fromJson(json['data'])
        : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class ProfileUserData {
  int? id;
  String? fullName;
  String? roleName;
  String? otp;
  String? organId;
  String? mobile;
  String? email;
  String? bio;
  int? verified;
  int? financialApproval;
  String? avatar;
  String? avatarSettings;
  String? coverImg;
  String? headline;
  String? about;
  String? address;
  String? countryId;
  String? provinceId;
  String? cityId;
  String? districtId;
  String? location;
  String? levelOfTraining;
  String? meetingType;
  String? status;
  int? accessContent;
  String? language;
  String? timezone;
  int? newsletter;
  int? publicMessage;
  String? accountType;
  String? iban;
  String? accountId;
  String? identityScan;
  String? certificate;
  String? commission;
  int? affiliate;
  int? canCreateStore;
  int? ban;
  String? banStartAt;
  String? banEndAt;
  int? offline;
  String? offlineMessage;
  int? createdAt;
  int? updatedAt;
  String? deletedAt;

  ProfileUserData(
      {this.id,
      this.fullName,
      this.roleName,
      this.otp,
      this.organId,
      this.mobile,
      this.email,
      this.bio,
      this.verified,
      this.financialApproval,
      this.avatar,
      this.avatarSettings,
      this.coverImg,
      this.headline,
      this.about,
      this.address,
      this.countryId,
      this.provinceId,
      this.cityId,
      this.districtId,
      this.location,
      this.levelOfTraining,
      this.meetingType,
      this.status,
      this.accessContent,
      this.language,
      this.timezone,
      this.newsletter,
      this.publicMessage,
      this.accountType,
      this.iban,
      this.accountId,
      this.identityScan,
      this.certificate,
      this.commission,
      this.affiliate,
      this.canCreateStore,
      this.ban,
      this.banStartAt,
      this.banEndAt,
      this.offline,
      this.offlineMessage,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  ProfileUserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    roleName = json['role_name'];
    otp = json['otp'];
    organId = json['organ_id'];
    mobile = json['mobile'];
    email = json['email'];
    bio = json['bio'];
    verified = json['verified'];
    financialApproval = json['financial_approval'];
    avatar = json['avatar'];
    avatarSettings = json['avatar_settings'];
    coverImg = json['cover_img'];
    headline = json['headline'];
    about = json['about'];
    address = json['address'];
    countryId = json['country_id'];
    provinceId = json['province_id'];
    cityId = json['city_id'];
    districtId = json['district_id'];
    location = json['location'];
    levelOfTraining = json['level_of_training'];
    meetingType = json['meeting_type'];
    status = json['status'];
    accessContent = json['access_content'];
    language = json['language'];
    timezone = json['timezone'];
    newsletter = json['newsletter'];
    publicMessage = json['public_message'];
    accountType = json['account_type'];
    iban = json['iban'];
    accountId = json['account_id'];
    identityScan = json['identity_scan'];
    certificate = json['certificate'];
    commission = json['commission'];
    affiliate = json['affiliate'];
    canCreateStore = json['can_create_store'];
    ban = json['ban'];
    banStartAt = json['ban_start_at'];
    banEndAt = json['ban_end_at'];
    offline = json['offline'];
    offlineMessage = json['offline_message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['role_name'] = this.roleName;
    data['otp'] = this.otp;
    data['organ_id'] = this.organId;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['bio'] = this.bio;
    data['verified'] = this.verified;
    data['financial_approval'] = this.financialApproval;
    data['avatar'] = this.avatar;
    data['avatar_settings'] = this.avatarSettings;
    data['cover_img'] = this.coverImg;
    data['headline'] = this.headline;
    data['about'] = this.about;
    data['address'] = this.address;
    data['country_id'] = this.countryId;
    data['province_id'] = this.provinceId;
    data['city_id'] = this.cityId;
    data['district_id'] = this.districtId;
    data['location'] = this.location;
    data['level_of_training'] = this.levelOfTraining;
    data['meeting_type'] = this.meetingType;
    data['status'] = this.status;
    data['access_content'] = this.accessContent;
    data['language'] = this.language;
    data['timezone'] = this.timezone;
    data['newsletter'] = this.newsletter;
    data['public_message'] = this.publicMessage;
    data['account_type'] = this.accountType;
    data['iban'] = this.iban;
    data['account_id'] = this.accountId;
    data['identity_scan'] = this.identityScan;
    data['certificate'] = this.certificate;
    data['commission'] = this.commission;
    data['affiliate'] = this.affiliate;
    data['can_create_store'] = this.canCreateStore;
    data['ban'] = this.ban;
    data['ban_start_at'] = this.banStartAt;
    data['ban_end_at'] = this.banEndAt;
    data['offline'] = this.offline;
    data['offline_message'] = this.offlineMessage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
