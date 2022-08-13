import 'package:flutter/material.dart';

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
