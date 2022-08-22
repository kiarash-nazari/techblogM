import 'package:flutter/material.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/components/my_colors.dart';
import 'package:tec_blog/components/my_component.dart';
import 'package:tec_blog/components/my_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
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
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Image.asset(
              Assets.images.profileAvatar.path,
              height: 100,
              width: 100,
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.icons.bluePen.path,
                  height: 18,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  MyStrings.imagePorofileEdit,
                  style: textTheme.headline3,
                )
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Text(
              "فاطمه امیری",
              style: textTheme.headline4,
            ),
            Text(
              "FatemehAmiri@gmail.com",
              style: textTheme.headline4,
            ),
            const SizedBox(
              height: 40,
            ),
            TechDivide(size: size),
            InkWell(
              splashColor: SolidColors.primeryColor,
              onTap: () {},
              child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    MyStrings.myFavBlog,
                    style: textTheme.headline4,
                  ),
                ),
              ),
            ),
            TechDivide(size: size),
            InkWell(
              splashColor: SolidColors.primeryColor,
              onTap: () {},
              child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    MyStrings.myFavPodcast,
                    style: textTheme.headline4,
                  ),
                ),
              ),
            ),
            TechDivide(size: size),
            InkWell(
              splashColor: SolidColors.primeryColor,
              onTap: () {},
              child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    MyStrings.logOut,
                    style: textTheme.headline4,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
