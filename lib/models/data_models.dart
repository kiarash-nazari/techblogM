import 'package:flutter/material.dart';
import 'package:tec_blog/models/fakeData.dart';
import 'package:tec_blog/components/my_colors.dart';

import '../gen/assets.gen.dart';

class HashTagModel {
  String title;

  HashTagModel({required this.title});
}

class BlogModel {
  int id;
  String imageUrl;
  String title;
  String writer;
  String writerImageUrl;
  String date;
  String content;
  String views;

  BlogModel({
    required this.id,
    required this.title,
    required this.views,
    required this.writer,
    required this.imageUrl,
    required this.date,
    required this.content,
    required this.writerImageUrl,
  });
}

class PodcastModel {
  String imageUrl;
  String writer;
  String title;
  var id;

  PodcastModel(
      {required this.imageUrl,
      required this.writer,
      required this.title,
      required this.id});
}
