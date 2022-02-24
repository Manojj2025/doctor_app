class DiseasesSpacialist {
  int? status;
  String? message;
  List<DSImage>? image;
  String? imageUrl;

  DiseasesSpacialist({this.status, this.message, this.image, this.imageUrl});

  DiseasesSpacialist.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['image'] != null) {
      image = <DSImage>[];
      json['image'].forEach((v) {
        image?.add(DSImage.fromJson(v));
      });
    }
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (image != null) {
      data['image'] = image?.map((v) => v.toJson()).toList();
    }
    data['image_url'] = imageUrl;
    return data;
  }
}

class DSImage {
  int? id;
  String? title;
  String? image;

  DSImage({this.id, this.title, this.image});

  DSImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    return data;
  }
}
