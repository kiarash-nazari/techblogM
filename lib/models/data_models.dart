import 'package:flutter/material.dart';
import 'package:tec_blog/models/fakeData.dart';
import 'package:tec_blog/my_colors.dart';

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

class MainTags extends StatelessWidget {
  MainTags({
    Key? key,
    required this.textTheme,
    required this.index,
  }) : super(key: key);

  final TextTheme textTheme;

  var index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(
              colors: GradiantColors.tags,
              begin: Alignment.centerRight,
              end: Alignment.centerLeft)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Row(
          children: [
            Image.asset(
              Assets.icons.hashtagicon.keyName,
              height: 16,
              width: 16,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(tagList[index].title, style: textTheme.headline2)
          ],
        ),
      ),
    );
  }
}
