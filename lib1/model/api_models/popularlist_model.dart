class PopularListModel {
  String? status;
  List<PopularlistData>? data;
  String? message;

  PopularListModel({this.status, this.data, this.message});

  PopularListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <PopularlistData>[];
      json['data'].forEach((v) {
        data!.add(new PopularlistData.fromJson(v));
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

class PopularlistData {
  int? id;
  int? teacherId;
  int? creatorId;
  int? categoryId;
  String? type;
  int? private;
  String? slug;
  int? startDate;
  int? duration;
  String? timezone;
  String? thumbnail;
  String? imageCover;
  String? videoDemo;
  String? videoDemoSource;
  int? capacity;
  int? price;
  String? organizationPrice;
  int? support;
  int? certificate;
  int? downloadable;
  int? partnerInstructor;
  int? subscribe;
  int? forum;
  String? accessDays;
  int? points;
  String? messageForReviewer;
  String? status;
  int? createdAt;
  int? updatedAt;
  String? deletedAt;
  int? webinarId;
  String? locale;
  String? title;
  String? seoDescription;
  String? description;
  int? teacherUserId;
  String? teacherName;
  String? teacherImage;
  String? rates;
  //double? avgRates;

  PopularlistData({
    this.id,
    this.teacherId,
    this.creatorId,
    this.categoryId,
    this.type,
    this.private,
    this.slug,
    this.startDate,
    this.duration,
    this.timezone,
    this.thumbnail,
    this.imageCover,
    this.videoDemo,
    this.videoDemoSource,
    this.capacity,
    this.price,
    this.organizationPrice,
    this.support,
    this.certificate,
    this.downloadable,
    this.partnerInstructor,
    this.subscribe,
    this.forum,
    this.accessDays,
    this.points,
    this.messageForReviewer,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.webinarId,
    this.locale,
    this.title,
    this.seoDescription,
    this.description,
    this.teacherUserId,
    this.teacherName,
    this.teacherImage,
    this.rates,
    //this.avgRates
  });

  PopularlistData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teacherId = json['teacher_id'];
    creatorId = json['creator_id'];
    categoryId = json['category_id'];
    type = json['type'];
    private = json['private'];
    slug = json['slug'];
    startDate = json['start_date'];
    duration = json['duration'];
    timezone = json['timezone'];
    thumbnail = json['thumbnail'];
    imageCover = json['image_cover'];
    videoDemo = json['video_demo'];
    videoDemoSource = json['video_demo_source'];
    capacity = json['capacity'];
    price = json['price'];
    organizationPrice = json['organization_price'];
    support = json['support'];
    certificate = json['certificate'];
    downloadable = json['downloadable'];
    partnerInstructor = json['partner_instructor'];
    subscribe = json['subscribe'];
    forum = json['forum'];
    accessDays = json['access_days'];
    points = json['points'];
    messageForReviewer = json['message_for_reviewer'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    webinarId = json['webinar_id'];
    locale = json['locale'];
    title = json['title'];
    seoDescription = json['seo_description'];
    description = json['description'];
    teacherUserId = json['teacher_user_id'];
    teacherName = json['teacher_name'];
    teacherImage = json['teacher_image'];
    rates = json['rates'];
    //  avgRates = json['avg_rates'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['teacher_id'] = this.teacherId;
    data['creator_id'] = this.creatorId;
    data['category_id'] = this.categoryId;
    data['type'] = this.type;
    data['private'] = this.private;
    data['slug'] = this.slug;
    data['start_date'] = this.startDate;
    data['duration'] = this.duration;
    data['timezone'] = this.timezone;
    data['thumbnail'] = this.thumbnail;
    data['image_cover'] = this.imageCover;
    data['video_demo'] = this.videoDemo;
    data['video_demo_source'] = this.videoDemoSource;
    data['capacity'] = this.capacity;
    data['price'] = this.price;
    data['organization_price'] = this.organizationPrice;
    data['support'] = this.support;
    data['certificate'] = this.certificate;
    data['downloadable'] = this.downloadable;
    data['partner_instructor'] = this.partnerInstructor;
    data['subscribe'] = this.subscribe;
    data['forum'] = this.forum;
    data['access_days'] = this.accessDays;
    data['points'] = this.points;
    data['message_for_reviewer'] = this.messageForReviewer;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['webinar_id'] = this.webinarId;
    data['locale'] = this.locale;
    data['title'] = this.title;
    data['seo_description'] = this.seoDescription;
    data['description'] = this.description;
    data['teacher_user_id'] = this.teacherUserId;
    data['teacher_name'] = this.teacherName;
    data['teacher_image'] = this.teacherImage;
    data['rates'] = this.rates;
    // data['avg_rates'] = this.avgRates;
    return data;
  }
}
