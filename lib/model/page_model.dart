class CollectionModel {
  List<Collections>? collections;

  CollectionModel({this.collections});

  CollectionModel.fromJson(Map<String, dynamic> json) {
    if (json['collections'] != null) {
      collections = <Collections>[];
      json['collections'].forEach((v) {
        collections!.add(new Collections.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.collections != null) {
      data['collections'] = this.collections!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Collections {
  String? title;
  String? subTitle;
  String? image;

  Collections({this.title, this.subTitle, this.image});

  Collections.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subTitle = json['sub-title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['sub-title'] = this.subTitle;
    data['image'] = this.image;
    return data;
  }
}
