import 'package:flutter/material.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/models/fakeData.dart';
import 'package:tec_blog/my_colors.dart';
import 'package:tec_blog/my_strings.dart';

import '../models/data_models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
        child: Center(
          child: Column(
            children: [
              HomePagePoster(size: size, textTheme: textTheme),
              const SizedBox(
                height: 16,
              ),
              HomePageTagList(bodyMargin: bodyMargin, textTheme: textTheme),
              const SizedBox(
                height: 32,
              ),
              SeeMoreBlog(bodyMargin: bodyMargin, textTheme: textTheme),
              HomePageBlogList(
                  size: size, bodyMargin: bodyMargin, textTheme: textTheme),
              SeeMorePodcast(bodyMargin: bodyMargin, textTheme: textTheme),
              HomePagePodcastList(
                  size: size, bodyMargin: bodyMargin, textTheme: textTheme)
            ],
          ),
        ),
      ),
    );
  }
}

class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    Key? key,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width / 1.25,
          height: size.height / 4.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
                image: AssetImage(homePagePosterMap["imageAsset"]),
                fit: BoxFit.cover),
          ),
        ),
        Container(
          width: size.width / 1.25,
          height: size.height / 4.2,
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
}

class HomePageTagList extends StatelessWidget {
  const HomePageTagList({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemCount: tagList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
                index == tagList.length - 1 ? bodyMargin : 0,
                8,
                index == 0 ? bodyMargin : 15,
                8),
            child: MainTags(textTheme: textTheme, index: index,),
          );
        },
      ),
    );
  }
}



class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
      child: Row(
        children: [
          Image.asset(
            Assets.icons.bluePen.path,
            height: 16,
            width: 16,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            MyStrings.viewHotestBlog,
            style: textTheme.headline3,
          )
        ],
      ),
    );
  }
}

class HomePageBlogList extends StatelessWidget {
  const HomePageBlogList({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemCount: blogList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
                index == blogList.length - 1 ? bodyMargin : 10,
                8,
                index == 0 ? bodyMargin : 10,
                8),
            child: Column(
              children: [
                Stack(children: [
                  Container(
                    height: size.height / 5.3,
                    width: size.width / 2.4,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16),
                      ),
                      image: DecorationImage(
                          image: NetworkImage(blogList[index].imageUrl),
                          fit: BoxFit.cover),
                    ),
                    foregroundDecoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                        gradient: LinearGradient(
                            colors: GradiantColors.blogPost,
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter)),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 0,
                    left: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          blogList[index].writer,
                          style: textTheme.subtitle1,
                        ),
                        Row(
                          children: [
                            Text(
                              blogList[index].views,
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
                  )
                ]),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: size.width / 2.4,
                  child: Text(
                    blogList[index].title,
                    style: textTheme.bodyText1,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class SeeMorePodcast extends StatelessWidget {
  const SeeMorePodcast({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8, top: 16),
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

class HomePagePodcastList extends StatelessWidget {
  const HomePagePodcastList({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.1,
      child: ListView.builder(
        itemCount: podCastList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
                index == podCastList.length - 1 ? bodyMargin : 15,
                8,
                index == 0 ? bodyMargin : 15,
                8),
            child: Column(
              children: [
                Container(
                  width: size.width / 3,
                  height: size.height / 6,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    image: DecorationImage(
                        image: NetworkImage(podCastList[index].imageUrl),
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  podCastList[index].title,
                  style: textTheme.headline5,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
