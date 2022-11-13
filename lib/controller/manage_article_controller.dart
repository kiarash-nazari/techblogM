import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tec_blog/constant/storage_const.dart';
import 'package:tec_blog/models/article_list_model.dart';
import 'package:tec_blog/models/article_sngle_model.dart';
import 'package:tec_blog/models/tags_model%20.dart';

import '../constant/api_constant.dart';
import '../services/dio_service.dart';

class ManageArticleController extends GetxController {
  RxList<ArticleListModel> articleList = RxList();
  Rx<ArticleSingleModel> articleSingleModle = ArticleSingleModel("اینجا چیزی تیتر بذار", "اینجا متن بذار", "").obs;
  RxList<TagsModel> tagsList = RxList();
  RxBool loading = RxBool(true);

  @override
  onInit() {
    super.onInit();
    getManageArticle();
  }

  getManageArticle() async {
    // var response = await DioService().getMethod(ApiConstant.getMyPublished+GetStorage().read(StorageKey.userIdForSaveInStorage));
    var response =
        await DioService().getMethod("${ApiConstant.getMyPublished}1");

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleListModel.fromJson(element));
      });
      loading.value = false;
    }
  }
}
