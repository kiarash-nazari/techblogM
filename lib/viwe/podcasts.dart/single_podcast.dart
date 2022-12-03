import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec_blog/components/my_component.dart';
import 'package:tec_blog/constant/my_colors.dart';
import 'package:tec_blog/constant/my_decoration.dart';

import '../../constant/dimens.dart';
import '../../gen/assets.gen.dart';

class SinglePodcast extends StatelessWidget {
  const SinglePodcast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Stack(
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
                          imageUrl:
                              "https://techblog.sasansafari.com/Techblog/assets/upload/images/article/20220707215854.jpg",
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
                              child: Container(
                                height: 60,
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors:
                                            GradiantColors.singleAppBarCover)),
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
                          "عنوان پادکست",
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
                              image:
                                  Image.asset(Assets.images.profileAvatar.path)
                                      .image),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'ساسان صفری',
                            style: textTheme.headline4,
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              ImageIcon(
                                Image.asset(Assets.icons.microphon.path).image,
                                color: SolidColors.seeMore,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                "بخش چهارم : فریلسر دیوانه",
                                style: textTheme.headline4,
                              ),
                              const Expanded(child: SizedBox()),
                              const Text("22:00")
                            ],
                          ),
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
                ))
          ],
        ),
      ),
    );
  }
}
