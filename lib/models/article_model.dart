import 'package:tec_blog/components/api_constant.dart';

class ArticleModel {
  String? id;
  String? title;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;

  ArticleModel(
      {required this.id,
      required this.title,
      required this.image,
      required this.catId,
      required this.catName,
      required this.author,
      required this.view,
      required this.status,
      required this.createdAt});

  ArticleModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    image = ApiConstant.hostDlUrl + element["image"];
    catId = element["cat_id"];
    catName = element["cat_name"];
    author = element["author"];
    view = element["view"];
    status = element["status"];
    createdAt = element["created_at"];
  }
}



            // "id": "10",
            // "title": "داستان فیلم Gran Turismo بسیار هیجان‌انگیز خواهد بود!",
            // "image": "/Techblog/assets/upload/images/article/20220707215854.jpg",
            // "cat_id": "1",
            // "cat_name": "اخبار و مقالات",
            // "author": "نیما احمدی",
            // "view": "85",
            // "status": "1",
            // "created_at": "۱۴۰۱/۲/۳۱"