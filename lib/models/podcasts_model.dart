import 'package:tec_blog/constant/api_constant.dart';

class PodcastsModel {
  String? id;
  String? title;
  String? poster;
  String? publisher;
  String? viwe;
  String? createdAt;

  PodcastsModel();

  PodcastsModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    poster = ApiUrlConstant.hostDlUrl + element["poster"];
    publisher = element["author"];
    viwe = element["view"];
    createdAt = element["created_at"];
  }
}
