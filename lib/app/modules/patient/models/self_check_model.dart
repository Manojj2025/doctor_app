class SelfCheck {
  int? status;
  String? message;
  List<SelfImage>? image;
  String? imageUrl1;
  String? videourl2;

  SelfCheck(
      {this.status, this.message, this.image, this.imageUrl1, this.videourl2});

  SelfCheck.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['image'] != null) {
      image = <SelfImage>[];
      json['image'].forEach((v) {
        image?.add(SelfImage.fromJson(v));
      });
    }
    imageUrl1 = json['image_url1'];
    videourl2 = json['videourl2'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (image != null) {
      data['image'] = image?.map((v) => v.toJson()).toList();
    }
    data['image_url1'] = imageUrl1;
    data['videourl2'] = videourl2;
    return data;
  }
}

class SelfImage {
  int? id;
  String? title;
  String? image;
  String? description;
  String? videourl;
  String? date;
  String? time;

  SelfImage(
      {this.id, this.title, this.image, this.videourl, this.date, this.time});

  SelfImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
    videourl = json['videourl'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['description'] = description;
    data['videourl'] = videourl;
    data['date'] = date;
    data['time'] = time;
    return data;
  }
}
