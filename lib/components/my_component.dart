import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tec_blog/components/my_strings.dart';
import 'package:url_launcher/url_launcher.dart';

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
