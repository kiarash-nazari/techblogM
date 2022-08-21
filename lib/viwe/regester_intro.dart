import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/components/my_colors.dart';
import 'package:tec_blog/components/my_strings.dart';
import 'package:tec_blog/viwe/my_cats.dart';

class RegesterIntro extends StatelessWidget {
  const RegesterIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.images.tcBotSvg.path,
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: MyStrings.welcom, style: textTheme.headline4)),
              ),
              ElevatedButton(
                onPressed: () =>
                    {_ShowEmailBottomSheet(context, size, textTheme)},
                child: const Text("بزن بریم"),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Future<dynamic> _ShowEmailBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 2,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.insertYourEmail,
                    style: textTheme.headline4,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextField(
                      style: textTheme.headline5,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: "example : nazari@gmail.com",
                        hintStyle:
                            TextStyle(color: Color.fromARGB(128, 72, 68, 68)),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _ActiveCodeBottomSheet(context, size, textTheme);
                      },
                      child: const Text("ادامه"))
                ],
              ),
            ),
          );
        });
  }

  Future<dynamic> _ActiveCodeBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 2,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.activateCode,
                    style: textTheme.headline4,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextField(
                      style: textTheme.headline5,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: "******",
                        hintStyle:
                            TextStyle(color: Color.fromARGB(128, 72, 68, 68)),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => MyCats(),
                        ));
                      },
                      child: const Text("ادامه"))
                ],
              ),
            ),
          );
        });
  }
}
