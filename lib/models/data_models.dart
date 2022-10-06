

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
  // ignore: prefer_typing_uninitialized_variables
  var id;

  PodcastModel(
      {required this.imageUrl,
      required this.writer,
      required this.title,
      required this.id});
}
