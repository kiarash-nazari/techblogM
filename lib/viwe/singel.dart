import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tec_blog/components/my_colors.dart';
import 'package:tec_blog/controller/list_article_controller.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/viwe/article_list-screen.dart';
import '../components/my_component.dart';
import '../controller/single_article_controller.dart';

class Singel extends StatelessWidget {
  Singel({Key? key}) : super(key: key);

  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Obx(
            () => singleArticleController.articleSingleModle.value.content ==
                    null
                ? SizedBox(height: Get.height, child: LoadingSpinKit())
                : Column(children: [
                    Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: singleArticleController
                              .articleSingleModle.value.image!,
                          imageBuilder: (context, imageProvider) =>
                              Image(image: imageProvider),
                          placeholder: (context, url) => LoadingSpinKit(),
                          errorWidget: (context, url, error) => Image(
                            image: AssetImage(
                                Assets.images.singlePlaceHolder.path),
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
                                children: const [
                                  SizedBox(width: 16),
                                  Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                  Expanded(child: SizedBox()),
                                  Icon(
                                    Icons.bookmark_border_rounded,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.share,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 16,
                                  )
                                ]),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        singleArticleController.articleSingleModle.value.title!,
                        style: textTheme.titleLarge,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Image(
                              height: 60,
                              image:
                                  Image.asset(Assets.images.profileAvatar.path)
                                      .image),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            singleArticleController
                                .articleSingleModle.value.author!,
                            style: textTheme.headline4,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            singleArticleController
                                .articleSingleModle.value.createdAt!,
                            style: textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: HtmlWidget(
                        singleArticleController
                            .articleSingleModle.value.content!,
                        enableCaching: true,
                        onLoadingBuilder:
                            ((context, element, loadingProgress) =>
                                LoadingSpinKit()),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: singleArticleController.tagsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () async {
                              var TgaId =
                                  singleArticleController.tagsList[index].id!;
                              await Get.find<ListArticleController>()
                                  .getArticleWithTagId(TgaId);
                              Get.to(ArticleListScreen());
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
                                    color: Colors.black54),
                                child: Center(
                                  child: Text(
                                    singleArticleController
                                        .tagsList[index].title!,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: size.height / 4.3,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemCount: singleArticleController.relatedList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: (() {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        backgroundColor: Colors.transparent,
                                        elevation: 0,
                                        content: LoadingSpinKit(),
                                      ));
                              singleArticleController.getSingleArticle(
                                  singleArticleController
                                      .relatedList[index].id);
                              if (singleArticleController.loading.value ==
                                  false) {
                                Navigator.pop(context);
                                singleArticleController.loading.value = true;
                              }
                            }),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 110,
                                  width: size.width / 2.8,
                                  child: CachedNetworkImage(
                                    imageUrl: singleArticleController
                                        .relatedList[index].image!,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(16),
                                        ),
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    placeholder: (context, url) =>
                                        LoadingSpinKit(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(
                                      Icons.image_not_supported_outlined,
                                      size: 90,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                      width: size.width / 2.3,
                                      child: Text(
                                        singleArticleController
                                            .relatedList[index].title!,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      )),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ]),
          ),
        ),
      ),
    );
  }
}
