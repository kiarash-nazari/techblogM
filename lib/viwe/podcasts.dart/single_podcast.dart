import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:tec_blog/components/my_component.dart';
import 'package:tec_blog/constant/my_colors.dart';
import 'package:tec_blog/constant/my_decoration.dart';
import 'package:tec_blog/controller/Podcast/podcast_single_controller.dart';
import 'package:tec_blog/models/data_models.dart';

import '../../constant/dimens.dart';
import '../../gen/assets.gen.dart';
import '../../models/podcasts_model.dart';

class SinglePodcast extends StatelessWidget {
  late PodcastSingleController podcastSingleController;

  late PodcastsModel podcastModel;

  SinglePodcast() {
    podcastModel = Get.arguments;
    podcastSingleController =
        Get.put(PodcastSingleController(id: podcastModel.id));
  }

  @override
  Widget build(BuildContext context) {
    print(podcastSingleController.id);
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CachedNetworkImage(
                            height: Get.height / 3,
                            width: double.infinity,
                            imageUrl: podcastModel.poster!,
                            imageBuilder: (context, imageProvider) => Image(
                              image: imageProvider,
                              fit: BoxFit.fill,
                            ),
                            placeholder: (context, url) => LoadingSpinKit(),
                            errorWidget: (context, url, error) => Image(
                              image: AssetImage(
                                  Assets.images.singlePlaceHolder.path),
                            ),
                          ),
                          Positioned(
                              top: 0,
                              right: 0,
                              left: 0,
                              child: Container(
                                child: Container(
                                  height: 60,
                                  decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: GradiantColors
                                              .singleAppBarCover)),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      GestureDetector(
                                        onTap: () => Get.back(),
                                        child: const Icon(
                                          Icons.arrow_back,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const Expanded(child: SizedBox()),
                                      const Icon(
                                        Icons.share,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      )
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            podcastModel.title!,
                            style: textTheme.titleLarge,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image(
                                height: 60,
                                image: Image.asset(
                                        Assets.images.profileAvatar.path)
                                    .image),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              podcastModel.publisher!,
                              style: textTheme.headline4,
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        itemCount:
                            podcastSingleController.podcastFileList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return index <
                                  podcastSingleController
                                          .podcastFileList.length -
                                      1
                              ? Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      ImageIcon(
                                        Image.asset(Assets.icons.microphon.path)
                                            .image,
                                        color: SolidColors.seeMore,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      SizedBox(
                                        width: Get.width / 1.5,
                                        child: Text(
                                          podcastSingleController
                                              .podcastFileList[index].title!,
                                          style: textTheme.headline4,
                                        ),
                                      ),
                                      const Expanded(child: SizedBox()),
                                      Text(
                                          "${podcastSingleController.podcastFileList[index].legnth!}:00")
                                    ],
                                  ),
                                )
                              : Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          ImageIcon(
                                            Image.asset(
                                                    Assets.icons.microphon.path)
                                                .image,
                                            color: SolidColors.seeMore,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          SizedBox(
                                            width: Get.width / 1.5,
                                            child: Text(
                                              podcastSingleController
                                                  .podcastFileList[index]
                                                  .title!,
                                              style: textTheme.headline4,
                                            ),
                                          ),
                                          const Expanded(child: SizedBox()),
                                          Text(
                                              "${podcastSingleController.podcastFileList[index].legnth!}:00")
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height / 1.4,
                                    )
                                  ],
                                );
                        },
                      ), 
                      ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: Dimens.bodyMargin,
                  right: Dimens.bodyMargin,
                  child: Container(
                    height: Get.height / 7,
                    decoration: MyDecoration.mainGradient,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            LinearPercentIndicator(
                              percent: 1.0,
                              backgroundColor: Colors.white,
                              progressColor: Colors.orange,
                              barRadius: const Radius.circular(40),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Icon(
                                  Icons.skip_next,
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.play_circle_fill,
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.skip_previous,
                                  color: Colors.white,
                                ),
                                SizedBox(),
                                SizedBox(),
                                Icon(
                                  Icons.repeat,
                                  color: Colors.white,
                                ),
                              ],
                            )
                          ]),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
