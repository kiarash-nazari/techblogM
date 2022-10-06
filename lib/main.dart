import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec_blog/components/my_colors.dart';
import 'package:tec_blog/viwe/splash_screen.dart';
import 'package:get_storage/get_storage.dart';

import 'my_http_overrides.dart';

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
      title: 'Flutter Demo',
      locale: const Locale('fa'),
      theme: ThemeData(
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
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
