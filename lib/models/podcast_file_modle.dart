class PdcastFileModle {
  String? id;
  String? podcastId;
  String? file;
  String? title;
  String? legnth;

  PdcastFileModle();

  PdcastFileModle.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    podcastId = element["podcast_id"];
    file = element["file"];
    title = element["title"];
    legnth = element["length"];
  }
}
