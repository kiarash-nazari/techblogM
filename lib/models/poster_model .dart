// ignore: file_names
import 'package:tec_blog/constant/api_constant.dart';

class PosterModel {
  String? id;
  String? title;
  String? image;

  PosterModel({
    this.id,
     this.title,
     this.image,
  });

  PosterModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    image = ApiConstant.hostDlUrl + element["image"];
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