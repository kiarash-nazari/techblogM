import 'package:flutter/cupertino.dart';
import 'package:tec_blog/constant/my_colors.dart';

class MyDecoration {
  MyDecoration._();
  static Decoration mainGradient = const BoxDecoration(
      gradient: LinearGradient(colors: GradiantColors.bottonNav),
      borderRadius: BorderRadius.all(Radius.circular(18)));
}
