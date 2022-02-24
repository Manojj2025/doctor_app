class Banner {
  int? status;
  String? message;
  List<BannerImage>? image;
  String? imageUrl1;
  String? imageUrl2;

  Banner(
      {this.status, this.message, this.image, this.imageUrl1, this.imageUrl2});

  Banner.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['image'] != null) {
      image = <BannerImage>[];
      json['image'].forEach((v) {
        image?.add(BannerImage.fromJson(v));
      });
    }
    imageUrl1 = json['image_url1'];
    imageUrl2 = json['image_url2'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (image != null) {
      data['image'] = image?.map((v) => v.toJson()).toList();
    }
    data['image_url1'] = imageUrl1;
    data['image_url2'] = imageUrl2;
    return data;
  }
}

class BannerImage {
  int? bannerId;
  String? bannerImage1;
  String? bannerImage2;
  String? date;
  String? time;

  BannerImage(
      {this.bannerId,
      this.bannerImage1,
      this.bannerImage2,
      this.date,
      this.time});

  BannerImage.fromJson(Map<String, dynamic> json) {
    bannerId = json['banner_id'];
    bannerImage1 = json['banner_image1'];
    bannerImage2 = json['banner_image2'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['banner_id'] = bannerId;
    data['banner_image1'] = bannerImage1;
    data['banner_image2'] = bannerImage2;
    data['date'] = date;
    data['time'] = time;
    return data;
  }
}
