import 'package:flutter/material.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/my_colors.dart';
import 'package:tec_blog/my_component.dart';
import 'package:tec_blog/viwe/home_screen.dart';
import 'package:tec_blog/viwe/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width / 10;

    return SafeArea(
      child: Scaffold(
          key: _key,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: SolidColors.statusBarColor,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  splashColor: SolidColors.primeryColor,
                  onTap: () {
                    _key.currentState!.openDrawer();
                  },
                  child: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                ),
                Image(
                  image: AssetImage(Assets.images.logo.path),
                  height: size.height / 13.64,
                  width: size.width / 3.73,
                ),
                const Icon(
                  Icons.search,
                  color: Colors.black,
                )
              ],
            ),
          ),
          drawer: Drawer(
            backgroundColor: SolidColors.surFace,
            child: Padding(
              padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Image.asset(
                      Assets.images.logo.path,
                      scale: 3,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "پروفایل کاربری",
                      style: textTheme.headline4,
                    ),
                    onTap: () {},
                  ),
                  const Divider(
                    color: Color.fromARGB(191, 57, 56, 56),
                  ),
                  ListTile(
                    title: Text(
                      "درباره تک بلاگ",
                      style: textTheme.headline4,
                    ),
                    onTap: () {},
                  ),
                  const Divider(
                    color: Color.fromARGB(191, 57, 56, 56),
                  ),
                  ListTile(
                    title: Text(
                      "اشتراک گذاری تک بلاگ",
                      style: textTheme.headline4,
                    ),
                    onTap: () {},
                  ),
                  const Divider(
                    color: Color.fromARGB(191, 57, 56, 56),
                  ),
                  ListTile(
                    title: Text(
                      "تک بلاگ در گیت هاب ",
                      style: textTheme.headline4,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          body: Stack(
            children: [
              IndexedStack(
                index: selectedPageIndex,
                children: [
                  HomeScreen(
                      size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                  Positioned.fill(
                    child: ProfileScreen(
                        size: size,
                        textTheme: textTheme,
                        bodyMargin: bodyMargin),
                  )
                ],
              ),
              NavigationBtns(
                size: size,
                bodyMargin: bodyMargin,
                changeScreen: (int value) {
                  setState(() {
                    selectedPageIndex = value;
                  });
                },
              )
            ],
          )),
    );
  }
}

class NavigationBtns extends StatelessWidget {
  const NavigationBtns({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.changeScreen,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: size.height / 10,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: GradiantColors.bottomNavigationBackground,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(bodyMargin, 10, bodyMargin, 8),
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: GradiantColors.bottonNav),
                borderRadius: BorderRadius.all(Radius.circular(18))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: (() => changeScreen(0)),
                    icon: Image.asset(Assets.icons.home.path)),
                IconButton(
                    onPressed: (() {}),
                    icon: Image.asset(Assets.icons.write.path)),
                IconButton(
                    onPressed: (() {
                      changeScreen(1);
                    }),
                    icon: Image.asset(Assets.icons.user.path))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
