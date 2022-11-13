import 'package:tec_blog/constant/api_constant.dart';

class ArticleSingleModel {
  String? id;
  String? title;
  String? image;
  String? catId;
  String? catName;
  String? content;
  String? author;
  String? view;
  String? status;
  String? createdAt;
  bool? isFavorite;
  //TODO اصلاحات
  ArticleSingleModel(this.title, this.content, this.image);

  ArticleSingleModel.fromJson(Map<String, dynamic> element) {
    id = element['info']['id'];
    title = element['info']['title'];
    image = ApiConstant.hostDlUrl + element['info']['image'];
    catId = element['info']['cat_id'];
    catName = element['info']['cat_name'];
    content = element['info']['content'];
    author = element['info']['author'];
    view = element['info']['view'];
    status = element['info']['status'];
    createdAt = element['info']['created_at'];
    isFavorite = element['isFavorite'];
  }
}
