import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tec_blog/constant/api_constant.dart';
import 'package:tec_blog/constant/storage_const.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/main.dart';
import 'package:tec_blog/services/dio_service.dart';
import 'package:tec_blog/viwe/main_Screen.dart';

import '../viwe/Regester/regester_intro.dart';

class RegesterController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController activeTextEditingController = TextEditingController();
  var email = "";
  var userId = "";

  regester() async {
    Map<String, dynamic> map = {
      "email": emailTextEditingController.text,
      "command": "register"
    };

    var response = await DioService().postMethod(map, ApiConstant.postRegester);
    email = emailTextEditingController.text;
    userId = response.data['user_id'];

    print(response);
  }

  activeCode() async {
    Map<String, dynamic> map = {
      "email": email,
      "user_id": userId,
      "code": activeTextEditingController.text,
      "command": "verify"
    };

    var response = await DioService().postMethod(map, ApiConstant.postRegester);

    var status = response.data["response"];
    print(response.data);

    switch (status) {
      case 'verified':
        final box = GetStorage();
        box.write(StorageKey.token, response.data["token"]);
        box.write(StorageKey.userIdForSaveInStorage, response.data["user_id"]);
        Get.offAll(MainScreen());
        break;
      case 'false':
        Get.snackbar("خطا", "کد وارد شده صحیح نمیباشد");
        break;
      case 'expired':
        Get.snackbar("خطا", "کد وارد شده منقضی شده است");
        break;
    }
  }

  toggleLogIn() {
    if (GetStorage().read(StorageKey.token) == null) {
      Get.to(RegesterIntro());
      bottomSheetForWritePodcastOrArticle();
    } else {
      bottomSheetForWritePodcastOrArticle();
    }
  }

  bottomSheetForWritePodcastOrArticle() {
    Get.bottomSheet(Container(
      height: Get.height / 3,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  Assets.images.tcBotSvg.path,
                  height: 40,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text("دانسته هایت را با بقیه به اشتراک بگذار ..."),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
                """ .فکر کن!!! اینجا بودنت به این معناست که یک گیگ تکنلوژی هستی... دانسته هایت را با بقیه گیگ تکنلوژی های ایران به اشتراک بگذار"""),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    print("clicked");
                    Get.toNamed(NamedRoute.routeManageArticle);
                  },
                  child: Container(
                    height: 60,
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Image.asset(
                          Assets.icons.writeArticle.path,
                          height: 32,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text("مدیریت مقاله ها")
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print("clicked");
                  },
                  child: Container(
                    height: 60,
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Image.asset(
                          Assets.icons.writePodcastIcon.path,
                          height: 32,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text("مدیریت پادکست ها")
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
