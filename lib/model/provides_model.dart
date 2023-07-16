import 'package:flutter_web/model/page_model.dart';

class ProvidesModel {
  List<Collections>? provids;

  ProvidesModel({this.provids});

  ProvidesModel.fromJson(Map<String, dynamic> json) {
    if (json['provids'] != null) {
      provids = <Collections>[];
      json['provids'].forEach((v) {
        provids!.add(new Collections.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.provids != null) {
      data['provids'] = this.provids!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
