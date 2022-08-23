import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:tec_blog/components/my_colors.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import '../components/my_component.dart';

class Singel extends StatelessWidget {
  const Singel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
        child: Scaffold(
      body: Column(children: [
        Stack(
          children: [
            CachedNetworkImage(
              imageUrl: "",
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              placeholder: (context, url) => LoadingSpinKit(),
              errorWidget: (context, url, error) => Image(
                image: AssetImage(Assets.images.singlePlaceHolder.path),
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
            "چه دانم های بسیار است ولیکن من نمیدانم که خوردم من از دهان بندی در این دریا کفی افیون",
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
                  image: Image.asset(Assets.images.profileAvatar.path).image),
              const SizedBox(
                width: 10,
              ),
              Text(
                "فاطمه امیری",
                style: textTheme.headline4,
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                "تاریخ",
                style: textTheme.caption,
              ),
            ],
          ),
        ),
        HtmlWidget(
          """
<h1>sasansafari</h1>

""",
          textStyle: textTheme.caption,
          enableCaching: true,
          onLoadingBuilder: (context, element, loadingProgress) =>
              LoadingSpinKit(),
        ),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 100,
                  height: 20,
                  color: Colors.amber,
                ),
              );
            },
          ),
        ),
      ]),
    ));
  }
}
