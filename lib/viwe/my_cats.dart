import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/models/fakeData.dart';
import 'package:tec_blog/components/my_colors.dart';
import 'package:tec_blog/components/my_strings.dart';

class MyCats extends StatefulWidget {
  const MyCats({Key? key}) : super(key: key);

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width / 10;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 32,
                ),
                SvgPicture.asset(
                  Assets.images.tcBotSvg.path,
                  height: 150,
                ),
                Text(MyStrings.successfulRegistration,
                    style: textTheme.headline4),
                TextField(
                  style: textTheme.headline4,
                  decoration: const InputDecoration(
                      hintText: "نام و نام خانوادگی",
                      hintStyle:
                          TextStyle(color: Color.fromARGB(159, 38, 36, 36))),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(MyStrings.chooseCats, style: textTheme.headline4),

                //Tags List
                Padding(
                  padding: const EdgeInsets.only(
                    top: 32,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 85,
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: tagList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 0.3,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                            onTap: () {
                              setState(() {
                                if (myCatsTags.contains(tagList[index])) {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            content: Text(
                                              "این تگ را از قبل داری ",
                                              style: textTheme.headline4,
                                            ),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text("حله"))
                                            ],
                                          ));
                                } else {
                                  myCatsTags.add(tagList[index]);
                                }
                              });
                            },
                            child:
                                MainTags(textTheme: textTheme, index: index));
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Image.asset(
                  Assets.icons.downCatArrow.path,
                  scale: 3,
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    top: 32,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 85,
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: myCatsTags.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 0.2,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: SolidColors.surFace),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(myCatsTags[index].title,
                                    style: textTheme.headline4),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      myCatsTags.remove(myCatsTags[index]);
                                    });
                                  },
                                  child: const Icon(
                                    CupertinoIcons.delete,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

MainTags({required TextTheme textTheme, required int index}) {}
