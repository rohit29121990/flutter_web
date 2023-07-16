import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_web/model/page_model.dart';
import 'package:flutter_web/model/team_model.dart';

import '../model/provides_model.dart';

class Services {
  Future<CollectionModel> loadData() async {
    String jsonData = await rootBundle.loadString('assets/json/data.json');
    Map<String, dynamic> jsonList = jsonDecode(jsonData);

    CollectionModel pageModels = CollectionModel.fromJson(jsonList);

    return pageModels;
  }

  Future<TeamModel> loadTeamData() async {
    String jsonData = await rootBundle.loadString('assets/json/data.json');
    Map<String, dynamic> jsonList = jsonDecode(jsonData);

    TeamModel teamModel = TeamModel.fromJson(jsonList);

    return teamModel;
  }

  Future<ProvidesModel> loadProvidesData() async {
    String jsonData = await rootBundle.loadString('assets/json/data.json');
    Map<String, dynamic> jsonList = jsonDecode(jsonData);

    ProvidesModel pageModels = ProvidesModel.fromJson(jsonList);

    return pageModels;
  }
}
