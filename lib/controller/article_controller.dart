import 'package:get/get.dart';
import 'package:tec_blog/components/api_constant.dart';
import 'package:tec_blog/models/article_model.dart';
import 'package:tec_blog/services/dio_service.dart';

class ArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  RxBool loading = true.obs;

  @override
  onInit() {
    super.onInit();
    getArticleList();
  }

  getArticleList() async {
    var response = await DioService().getMethod(ApiConstant.getArticleLi);

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));

        loading.value = false;
      });
    }
  }
}
