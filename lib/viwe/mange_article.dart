import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tec_blog/components/my_component.dart';
import 'package:tec_blog/controller/manage_article_controller.dart';
import 'package:tec_blog/controller/regester_controller.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/constant/my_strings.dart';
import 'package:tec_blog/main.dart';

// ignore: must_be_immutable
class ManageArticle extends StatelessWidget {
  ManageArticle({Key? key}) : super(key: key);

  var manageArticleController = Get.find<ManageArticleController>();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: myAppBar("مدیریت مقاله ها"),
        body: Obx(
          () => SizedBox(
            // ignore: unrelated_type_equality_checks
            child: manageArticleController.loading.value
                ? LoadingSpinKit()
                : manageArticleController.articleList.isNotEmpty
                    ? ListView.builder(
                        itemCount: manageArticleController.articleList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              //TODO route to single mange article
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CachedNetworkImage(
                                    width: Get.width / 3,
                                    height: Get.height / 6,
                                    imageUrl: manageArticleController
                                        .articleList[index].image!,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(16)),
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
                                      size: 50,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: Get.width / 2,
                                      child: Text(
                                        manageArticleController
                                            .articleList[index].title!,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          manageArticleController
                                              .articleList[index].author!,
                                          style: textTheme.caption,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "${manageArticleController.articleList[index].view!}بازدید",
                                          style: textTheme.caption,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    : articleEmptyState(textTheme),
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: Get.width / 1.5,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(NamedRoute.routeSingleManageArticle);
                },
                child: const Text("بریم برای نوشتن یک مقاله باحال"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget articleEmptyState(TextTheme textTheme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Spacer(
            flex: 1,
          ),
          Image.asset(
            Assets.images.emptyState.path,
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: MyStrings.emptyState, style: textTheme.headline4)),
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
