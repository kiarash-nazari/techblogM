import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tec_blog/controller/list_article_controller.dart';
import 'package:tec_blog/controller/manage_article_controller.dart';
import 'package:tec_blog/controller/regester_controller.dart';
import 'package:tec_blog/controller/single_article_controller.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut(() => ListArticleController());
    Get.lazyPut(() => SingleArticleController());
  }
}

class RegesterBunding implements Bindings {
  @override
  void dependencies() {
    Get.put(RegesterController());
  }
}

class ManageArticleBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(ManageArticleController());
  }
}
