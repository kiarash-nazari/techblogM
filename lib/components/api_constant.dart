import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../controller/single_article_controller.dart';

SingleArticleController singleArticleController =
    Get.put(SingleArticleController());

class ApiConstant {
  static const hostDlUrl = "https://techblog.sasansafari.com";
  static const baseUrl = "https://techblog.sasansafari.com/Techblog/api/";
  static const getHomeItem = "${baseUrl}home/?command=index";
  static const getArticleLi = "${baseUrl}article/get.php?command=new&user_id=1";

}
