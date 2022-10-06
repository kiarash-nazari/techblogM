import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tec_blog/components/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

import 'my_colors.dart';

class TechDivide extends StatelessWidget {
  const TechDivide({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: const Color.fromARGB(191, 57, 56, 56),
      thickness: 2,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}

myLaunchGitUrl(String url) async {
  var uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    log("URL can't luanch ${uri.toString()}");
  }
}

PreferredSize myAppBar(String title) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(80),
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Center(
              child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: appBarTextStyle,
            ),
          ))
        ],
        leading: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: SolidColors.primeryColor.withAlpha(175),
            ),
            child: const Icon(
              Icons.keyboard_arrow_right_rounded,
            ),
          ),
        ),
      ),
    ),
  );
}

// ignore: non_constant_identifier_names
SpinKitCircle LoadingSpinKit() {
  return const SpinKitCircle(
    color: SolidColors.primeryColor,
  );
}
