import 'package:get/get.dart';
import 'package:tec_blog/constant/api_constant.dart';
import 'package:tec_blog/models/article_list_model.dart';
import 'package:tec_blog/services/dio_service.dart';

import '../viwe/article_list-screen.dart';

class ListArticleController extends GetxController {
  RxList<ArticleListModel> articleList = RxList();
  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getArticleList();
  }

  getArticleList() async {
    var response = await DioService().getMethod(ApiConstant.getArticleLi);

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleListModel.fromJson(element));

        loading.value = false;
      });
    }
  }

  // ignore: non_constant_identifier_names
  getArticleWithTagId(String Id) async {
    articleList.clear();
    var response = await DioService().getMethod(
        "${ApiConstant.baseUrl}/article/get.php?command=get_articles_with_tag_id&tag_id=$Id&user_id=");

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleListModel.fromJson(element));

        Get.to(ArticleListScreen());

        loading.value = false;
      });
    }
  }
}
