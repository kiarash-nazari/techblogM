import 'package:tec_blog/constant/api_constant.dart';

class PodcastsModel {
  String? id;
  String? title;
  String? poster;
  String? publisher;
  String? viwe;
  String? createdAt;

  PodcastsModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.publisher,
    required this.viwe,
    required this.createdAt,
  });

  PodcastsModel.fromJson(Map<String, dynamic> elementP) {
    id = elementP["id"];
    title = elementP["title"];
    poster = ApiUrlConstant.hostDlUrl + elementP["poster"];
    publisher = elementP["publisher"];
    viwe = elementP["view"];
    createdAt = elementP["created_at"];
  }
}
