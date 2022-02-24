class DiseasesSpcialistDetails {
  int? status;
  String? message;
  List<DSDImage>? image;
  String? doctorImageUrl;

  DiseasesSpcialistDetails(
      {this.status, this.message, this.image, this.doctorImageUrl});

  DiseasesSpcialistDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['image'] != null) {
      image = <DSDImage>[];
      json['image'].forEach((v) {
        image?.add(DSDImage.fromJson(v));
      });
    }
    doctorImageUrl = json['doctor_image_url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (image != null) {
      data['image'] = image?.map((v) => v.toJson()).toList();
    }
    data['doctor_image_url'] = doctorImageUrl;
    return data;
  }
}

class DSDImage {
  int? id;
  String? doctorImage;
  String? doctorName;
  String? description;
  String? experience;
  String? languages;
  int? realRate;
  int? offerRate;
  int? rating;
  String? date;
  String? time;

  DSDImage(
      {this.id,
      this.doctorImage,
      this.doctorName,
      this.description,
      this.experience,
      this.languages,
      this.realRate,
      this.offerRate,
      this.rating,
      this.date,
      this.time});

  DSDImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorImage = json['doctor_image'];
    doctorName = json['doctor_name'];
    description = json['description'];
    experience = json['experience'];
    languages = json['languages'];
    realRate = json['real_rate'];
    offerRate = json['offer_rate'];
    rating = json['rating'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['doctor_image'] = doctorImage;
    data['doctor_name'] = doctorName;
    data['description'] = description;
    data['experience'] = experience;
    data['languages'] = languages;
    data['real_rate'] = realRate;
    data['offer_rate'] = offerRate;
    data['rating'] = rating;
    data['date'] = date;
    data['time'] = time;
    return data;
  }
}
