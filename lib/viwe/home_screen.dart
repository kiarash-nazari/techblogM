import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tec_blog/controller/home_screen_conroller.dart';
import 'package:tec_blog/controller/list_article_controller.dart';
import 'package:tec_blog/controller/single_article_controller.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/main.dart';
import 'package:tec_blog/models/fakeData.dart';
import 'package:tec_blog/constant/my_colors.dart';
import 'package:tec_blog/constant/my_strings.dart';
import 'package:tec_blog/viwe/article_list-screen.dart';

import '../components/my_component.dart';
import '../constant/dimens.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
    required this.textTheme,
  }) : super(key: key);
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());

  ListArticleController listArticleController =
      Get.put(ListArticleController());

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    HomeScreenController().getHomeItems();
    return SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Obx(
        (() => Padding(
              padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
              child: Center(
                child: homeScreenController.loading.value == false
                    ? Column(
                        children: [
                          poster(),
                          const SizedBox(
                            height: 16,
                          ),
                          tags(),
                          const SizedBox(
                            height: 32,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(ArticleListScreen());
                            },
                            child: SeeMoreBlog(
                              textTheme: textTheme,
                              title: 'مشاهده داغترین نوشته ها',
                            ),
                          ),
                          topVisited(),
                          SeeMorePodcast(textTheme: textTheme),
                          topPodcasts(),
                          const SizedBox(
                            height: 60,
                          )
                        ],
                      )
                    : const Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 400, top: 150),
                          child: SpinKitCircle(
                            color: SolidColors.primeryColor,
                            size: 250,
                          ),
                        ),
                      ),
              ),
            )),
      ),
    );
  }

  Widget poster() {
    return Stack(
      children: [
        Container(
          width: Get.width / 1.25,
          height: Get.height / 4.2,
          child: CachedNetworkImage(
            imageUrl: homeScreenController.poster.value.image!,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
              foregroundDecoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: GradiantColors.blogPost)),
            ),
            placeholder: (context, url) => LoadingSpinKit(),
          ),
        ),
        Container(
          width: Get.width / 1.25,
          height: Get.height / 4.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
                colors: GradiantColors.homePosterCoverGradiant,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    homePagePosterMap["writer"] +
                        " - " +
                        homePagePosterMap["date"],
                    style: textTheme.subtitle1,
                  ),
                  Row(
                    children: [
                      Text(
                        homePagePosterMap["viwe"],
                        style: textTheme.subtitle1,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Icon(
                        Icons.remove_red_eye_sharp,
                        color: Colors.white,
                        size: 16,
                      )
                    ],
                  )
                ],
              ),
              Text(
                "دوازده قدم برنامه نویسی یک دوره ی...",
                style: textTheme.headline1,
              )
            ],
          ),
        )
      ],
    );
  }

  Widget topVisited() {
    return SizedBox(
      height: Get.height / 3.5,
      child: Obx(
        () => ListView.builder(
            itemCount: homeScreenController.topVisitedList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              //blog item
              return GestureDetector(
                onTap: () {
                  singleArticleController.getSingleArticle(
                      homeScreenController.topPodcastList[index].id);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      right: index == 0 ? Dimens.bodyMargin : 15),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: Get.height / 5.3,
                          width: Get.width / 2.4,
                          child: Stack(
                            children: [
                              CachedNetworkImage(
                                imageUrl: homeScreenController
                                    .topVisitedList[index].image!,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16)),
                                    image: DecorationImage(
                                        image: NetworkImage(homeScreenController
                                            .topVisitedList[index].image!),
                                        fit: BoxFit.cover),
                                  ),
                                  foregroundDecoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: GradiantColors.blogPost)),
                                ),
                                placeholder: (context, url) => LoadingSpinKit(),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.image_not_supported_outlined,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                              ),
                              Positioned(
                                bottom: 8,
                                left: 0,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      homeScreenController
                                          .topVisitedList[index].author!,
                                      style: textTheme.subtitle1,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          homeScreenController
                                              .topVisitedList[index].view!,
                                          style: textTheme.subtitle1,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        const Icon(
                                          Icons.remove_red_eye_sharp,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                          width: Get.width / 2.4,
                          child: Text(
                            homeScreenController.topVisitedList[index].title!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ))
                    ],
                  ),
                ),
              );
            })),
      ),
    );
  }

  Widget tags() {
    return Obx(() => SizedBox(
          height: 60,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            itemCount: homeScreenController.tagList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: EdgeInsets.fromLTRB(
                      index == tagList.length - 1 ? Dimens.bodyMargin : 0,
                      8,
                      index == 0 ? Dimens.bodyMargin : 15,
                      8),
                  child: GestureDetector(
                    onTap: () {
                      listArticleController.getArticleWithTagId(
                          homeScreenController.tagList[index].id!);
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: const LinearGradient(
                              colors: GradiantColors.tags,
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                        child: Row(
                          children: [
                            Image.asset(
                              Assets.icons.hashtagicon.keyName,
                              height: 16,
                              width: 16,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(homeScreenController.tagList[index].title!,
                                style: textTheme.headline2)
                          ],
                        ),
                      ),
                    ),
                  ));
            },
          ),
        ));
  }

  Widget topPodcasts() {
    return SizedBox(
      height: Get.height / 3.1,
      child: Obx(
        () => ListView.builder(
          itemCount: homeScreenController.topPodcastList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    index == podCastList.length - 1 ? Dimens.bodyMargin : 15,
                    8,
                    index == 0 ? Dimens.bodyMargin : 15,
                    8),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          width: Get.width / 2.4,
                          height: Get.height / 5.3,
                          child: CachedNetworkImage(
                            imageUrl: homeScreenController
                                .topPodcastList[index].poster!,
                            imageBuilder: ((context, imageProvider) =>
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(16)),
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover)),
                                )),
                            placeholder: ((context, url) => const SpinKitCircle(
                                  color: SolidColors.primeryColor,
                                )),
                            errorWidget: ((context, url, error) => const Icon(
                                  Icons.image_not_supported_outlined,
                                  size: 50,
                                  color: Colors.grey,
                                )),
                          )),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: Get.width / 2.4,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 17),
                        child: Text(
                          homeScreenController.topPodcastList[index].title!,
                          style: textTheme.headline5,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SeeMorePodcast extends StatelessWidget {
  const SeeMorePodcast({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: Dimens.bodyMargin, bottom: 8, top: 16),
      child: Row(
        children: [
          Image.asset(
            Assets.icons.microphon.path,
            height: 16,
            width: 16,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            "مشاهده داغ ترین پادکست ها",
            style: textTheme.headline3,
          )
        ],
      ),
    );
  }
}
