import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec_blog/controller/article_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';


import '../components/my_component.dart';

class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({Key? key}) : super(key: key);

  ArticleController articleController = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: myAppBar("لیست مقالات"),
        body: Obx(
          () => SizedBox(
            child: ListView.builder(
              itemCount: articleController.articleList.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CachedNetworkImage(
                        width: Get.width / 3,
                        height: Get.height / 6,
                        imageUrl: articleController.articleList[index].image!,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                          ),
                        ),
                        placeholder: (context, url) => LoadingSpinKit(),
                        errorWidget: (context, url, error) => const Icon(
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
                            articleController.articleList[index].title!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              articleController.articleList[index].author!,
                              style: textTheme.caption,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "${articleController.articleList[index].view!}بازدید",
                              style: textTheme.caption,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
