
import 'package:get/get.dart';
import 'package:tec_blog/components/api_constant.dart';
import 'package:tec_blog/models/article_list_model.dart';
import 'package:tec_blog/models/tags_model%20.dart';
import 'package:tec_blog/services/dio_service.dart';
import 'package:tec_blog/viwe/singel.dart';

import '../models/article_sngle_model.dart';

class SingleArticleController extends GetxController {
  RxBool loading = true.obs;
  Rx<ArticleSingleModel> articleSingleModle = ArticleSingleModel().obs;
  RxList<TagsModel> tagsList = RxList();
  RxList<ArticleListModel> relatedList = RxList();


  getSingleArticle(var id) async {
    var userId = "";
    articleSingleModle = ArticleSingleModel().obs;

    var response = await DioService().getMethod(
        "${ApiConstant.baseUrl}article/get.php?command=info&id=$id&user_id=$userId");

    if (response.statusCode == 200) {
      articleSingleModle.value = ArticleSingleModel.fromJson(response.data);

      tagsList.clear();
      response.data['tags'].forEach((element) {
        tagsList.add(TagsModel.fromJson(element));
      });

      relatedList.clear();
      response.data['related'].forEach((element) {
        relatedList.add(ArticleListModel.fromJson(element));
        loading.value = false;
      });

      Get.to(Singel());
    }
  }
}
