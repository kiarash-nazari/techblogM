class ApiUrlConstant {
  static const hostDlUrl = "https://techblog.sasansafari.com";
  static const baseUrl = "https://techblog.sasansafari.com/Techblog/api/";
  static const getHomeItem = "${baseUrl}home/?command=index";
  static const getArticleLi = "${baseUrl}article/get.php?command=new&user_id=1";
  static const postRegester = "${baseUrl}register/action.php";
  static const getMyPublished =
      "${baseUrl}article/get.php?command=published_by_me&user_id=";
  static const articlePost = "${baseUrl}article/post.php";
}

class ApiArticleKeyConstanst {
  static const String title = "title";
  static const String content = "content";
  static const String catId = "cat_id";
  static const String tagList = "tag_list";
  static const String userId = "user_id";
  static const String image = "image";
  static const String command = "command";
}
