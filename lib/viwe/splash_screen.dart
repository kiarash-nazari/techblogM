import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'main_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MainScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(Assets.images.logo.path),
            ),
            const SpinKitSpinningLines(
              color: Color.fromARGB(255, 179, 10, 201),
              size: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
