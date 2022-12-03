import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tec_blog/components/my_component.dart';

import '../../gen/assets.gen.dart';

class SinglePodcast extends StatelessWidget {
  const SinglePodcast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
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
                    image: AssetImage(Assets.images.singlePlaceHolder.path),
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
