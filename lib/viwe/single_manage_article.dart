import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tec_blog/constant/dimens.dart';
import 'package:tec_blog/constant/my_colors.dart';
import 'package:tec_blog/controller/file_picker_controller.dart';
import 'package:tec_blog/controller/home_screen_conroller.dart';
import 'package:tec_blog/controller/list_article_controller.dart';
import 'package:tec_blog/controller/manage_article_controller.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/services/file_picker.dart';
import 'package:tec_blog/viwe/html_editor_manager.dart';
import '../components/my_component.dart';
import '../controller/single_article_controller.dart';

// ignore: must_be_immutable
class SingelManageArticle extends StatelessWidget {
  SingelManageArticle({Key? key}) : super(key: key);

  var manageArticleController = Get.find<ManageArticleController>();
  FilePickerController filePickerController = Get.put(FilePickerController());

  void getTitle() {
    Get.defaultDialog(
        title: "انتخاب موضوع",
        titleStyle: const TextStyle(color: Colors.white),
        content: TextField(
          controller: manageArticleController.titleTextEditingController,
          keyboardType: TextInputType.text,
          style: const TextStyle(color: SolidColors.seeMore),
          decoration: const InputDecoration(
              hintText: "عنوان مقاله را بنویسید",
              filled: true,
              fillColor: Colors.white),
        ),
        backgroundColor: SolidColors.primeryColor,
        radius: 8,
        confirm: ElevatedButton(
            onPressed: () {
              manageArticleController.updateTitle();
              Get.back();
            },
            child: const Text("ثبت")));
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Obx(
            () => Column(children: [
              Stack(
                children: [
                  SizedBox(
                    width: Get.width,
                    height: Get.height / 2.5,
                    child:
                        filePickerController.file.value.name == "nothingtecblog"
                            ? CachedNetworkImage(
                                imageUrl: manageArticleController
                                    .articleSingleModle.value.image!,
                                imageBuilder: (context, imageProvider) =>
                                    Image(image: imageProvider),
                                placeholder: (context, url) => LoadingSpinKit(),
                                errorWidget: (context, url, error) => Image(
                                  image: AssetImage(
                                      Assets.images.singlePlaceHolder.path),
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Image.file(
                                File(filePickerController.file.value.path!),
                                fit: BoxFit.cover,
                              ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: 60,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: GradiantColors.singleAppBarCover)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(width: 16),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                          ]),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          //file picker
                          pickFile();
                        },
                        child: Container(
                          width: Get.width / 3,
                          height: 35,
                          decoration: const BoxDecoration(
                              color: SolidColors.primeryColor,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12),
                                  topLeft: Radius.circular(12))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "انتخاب تصویر",
                                style: textTheme.headline2,
                              ),
                              const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: Dimens.bodyMargin,
              ),
              GestureDetector(
                  onTap: () {
                    getTitle();
                  },
                  child: SeeMoreBlog(textTheme: textTheme, title: "موضوع")),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HtmlWidget(
                  manageArticleController.articleSingleModle.value.title!,
                  enableCaching: true,
                  onLoadingBuilder: ((context, element, loadingProgress) =>
                      LoadingSpinKit()),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                  onTap: () => Get.to(HtmlEditorManager()),
                  child: SeeMoreBlog(textTheme: textTheme, title: "متن")),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HtmlWidget(
                  manageArticleController.articleSingleModle.value.content!,
                  enableCaching: true,
                  onLoadingBuilder: ((context, element, loadingProgress) =>
                      LoadingSpinKit()),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                  onTap: () {
                    chooseCatsBottomSheet();
                  },
                  child: SeeMoreBlog(textTheme: textTheme, title: "تگ ها")),
            ]),
          ),
        ),
      ),
    );
  }

  SizedBox cats() {
    var homeScreenController = Get.find<HomeScreenController>();
    return SizedBox(
      width: double.infinity,
      height: Get.height / 1.7,
      child: GridView.builder(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        scrollDirection: Axis.vertical,
        itemCount: homeScreenController.tagList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Get.find<ListArticleController>()
                  .getArticleWithTagId(homeScreenController.tagList[index].id!);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                height: 20,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                    color: SolidColors.primeryColor),
                child: Center(
                  child: Text(
                    homeScreenController.tagList[index].title!,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 5),
      ),
    );
  }

  chooseCatsBottomSheet() {
    Get.bottomSheet(
        Container(
          height: Get.height / 1.5,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("انتخاب دسته بندی"),
                ),
                cats(),
              ],
            ),
          ),
        ),
        persistent: true);
  }
}
