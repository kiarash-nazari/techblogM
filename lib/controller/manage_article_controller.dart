import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tec_blog/constant/command_constant.dart';
import 'package:tec_blog/constant/storage_const.dart';
import 'package:tec_blog/controller/file_picker_controller.dart';
import 'package:tec_blog/models/article_list_model.dart';
import 'package:tec_blog/models/article_sngle_model.dart';
import 'package:tec_blog/models/tags_model%20.dart';

import '../constant/api_constant.dart';
import '../services/dio_service.dart';

class ManageArticleController extends GetxController {
  RxList<ArticleListModel> articleList = RxList();
  Rx<ArticleSingleModel> articleSingleModle =
      ArticleSingleModel("اینجا چیزی تیتر بذار", "اینجا متن بذار", "").obs;
  RxList<TagsModel> tagsList = RxList();
  TextEditingController titleTextEditingController = TextEditingController();
  RxBool loading = RxBool(true);

  @override
  onInit() {
    super.onInit();
    getManageArticle();
  }

  getManageArticle() async {
    // var response = await DioService().getMethod(ApiConstant.getMyPublished+GetStorage().read(StorageKey.userIdForSaveInStorage));
    var response =
        await DioService().getMethod("${ApiUrlConstant.getMyPublished}1");

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleListModel.fromJson(element));
      });
      loading.value = false;
    }
  }

  updateTitle() {
    articleSingleModle.update((val) {
      val!.title = titleTextEditingController.text;
    });
  }

  sendNewArticle() async {
    loading.value = false;
    var fileController = Get.find<FilePickerController>();
    Map<String, dynamic> map = {
      ApiArticleKeyConstanst.title: articleSingleModle.value.title,
      ApiArticleKeyConstanst.image:
          dio.MultipartFile.fromFile(fileController.file.value.path!),
      ApiArticleKeyConstanst.content: articleSingleModle.value.content,
      ApiArticleKeyConstanst.catId: articleSingleModle.value.catId,
      ApiArticleKeyConstanst.tagList: "[]",
      ApiArticleKeyConstanst.userId:
          GetStorage().read(StorageKey.userIdForSaveInStorage),
      ApiArticleKeyConstanst.command: CommandConstant.store
    };

    await DioService().postMethod(map, ApiUrlConstant.articlePost);
    print(map['image']);

    loading.value = true;
  }
}
