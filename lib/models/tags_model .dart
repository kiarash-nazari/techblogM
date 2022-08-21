import 'package:flutter/cupertino.dart';


class TagsModel {
  String? id;
  String? title;

  TagsModel({
    required this.id,
    required this.title,
  });

  TagsModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
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