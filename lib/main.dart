import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec_blog/binding.dart';
import 'package:tec_blog/constant/my_colors.dart';
import 'package:tec_blog/viwe/article_list-screen.dart';
import 'package:tec_blog/viwe/main_Screen.dart';
import 'package:tec_blog/viwe/podcasts.dart/single_podcast.dart';
import 'package:tec_blog/viwe/single_manage_article.dart';
import 'package:tec_blog/viwe/splash_screen.dart';
import 'package:get_storage/get_storage.dart';

import 'my_http_overrides.dart';
import 'viwe/mange_article.dart';
import 'viwe/singel.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return GetMaterialApp(
      getPages: [
        GetPage(
            name: NamedRoute.routeMainScreen,
            page: () => MainScreen(),
            binding: RegesterBunding(),
            transition: Transition.fadeIn),
        GetPage(
            name: NamedRoute.routeSingleArticle,
            page: () => Singel(),
            binding: ArticleBinding(),
            transition: Transition.downToUp),
        GetPage(
            name: NamedRoute.routeManageArticle,
            page: () => ManageArticle(),
            binding: ManageArticleBinding(),
            transition: Transition.zoom),
        GetPage(
            name: NamedRoute.routeSingleManageArticle,
            page: () => SingelManageArticle(),
            binding: ManageArticleBinding(),
            transition: Transition.leftToRight),
      ],
      title: 'Flutter Demo',
      locale: const Locale('fa'),
      theme: LightTheme(textTheme),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }

  // ignore: non_constant_identifier_names
  ThemeData LightTheme(TextTheme textTheme) {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(width: 2),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        textStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return textTheme.subtitle1;
          }
          return textTheme.subtitle1;
        }),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return SolidColors.seeMore;
          }
          return SolidColors.primeryColor;
        }),
      )),
      fontFamily: 'dana',
      brightness: Brightness.light,
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontFamily: 'dana',
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: SolidColors.podterTitle,
        ),
        subtitle1: TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: SolidColors.podterSubTitle,
        ),
        bodyText1: TextStyle(
          fontFamily: 'dana',
          fontSize: 13,
          fontWeight: FontWeight.w300,
        ),
        headline2: TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: Colors.white,
        ),
        headline3: TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: SolidColors.seeMore,
        ),
        headline4: TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Color.fromARGB(255, 70, 70, 70),
        ),
        headline5: TextStyle(
          fontFamily: 'dana',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }
}

class NamedRoute {
  static String routeMainScreen = "/MainScreen";
  static String routeSingleArticle = "/Singel";
  static String routeManageArticle = "/ManageArticle";
  static String routeSingleManageArticle = "/SingleManageArticle";
}
