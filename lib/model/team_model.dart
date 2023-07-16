class TeamModel {
  List<Team>? team;

  TeamModel({this.team});

  TeamModel.fromJson(Map<String, dynamic> json) {
    if (json['team'] != null) {
      team = <Team>[];
      json['team'].forEach((v) {
        team!.add(new Team.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.team != null) {
      data['team'] = this.team!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Team {
  String? name;
  String? post;
  String? image;

  Team({this.name, this.post, this.image});

  Team.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    post = json['post'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['post'] = this.post;
    data['image'] = this.image;
    return data;
  }
}
