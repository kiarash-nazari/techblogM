
import 'package:get/get.dart';
import 'package:tec_blog/components/api_constant.dart';
import 'package:tec_blog/models/article_model.dart';

import 'package:tec_blog/models/podcasts_model.dart';
import 'package:tec_blog/models/poster_model%20.dart';
import 'package:tec_blog/services/dio_service.dart';
import 'package:tec_blog/models/tags_model%20.dart';

class HomeScreenController extends GetxController {
  late Rx<PosterModel> poster = PosterModel().obs;
  RxList<TagsModel> tagList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastsModel> topPodcastList = RxList();
  RxBool loading = true.obs;

  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {

    var response = await DioService().getMethod(ApiConstant.getHomeItem);

    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topVisitedList.add(ArticleModel.fromJson(element));
      });

      response.data['tags'].forEach((element) {
        tagList.add(TagsModel.fromJson(element));
      });

      response.data['top_podcasts'].forEach((elementP) {
        topPodcastList.add(PodcastsModel.fromJson(elementP));
      });

      poster.value = PosterModel.fromJson(response.data['poster']);

      loading.value = false;
    }
  }
}
