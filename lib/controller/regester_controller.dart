import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tec_blog/components/api_constant.dart';
import 'package:tec_blog/components/storage_const.dart';
import 'package:tec_blog/services/dio_service.dart';
import 'package:tec_blog/viwe/main_Screen.dart';

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
        box.write(token, response.data["token"]);
        box.write(userIdForSaveInStorage, response.data["user_id"]);
        Get.to(MainScreen());
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
    if (GetStorage().read(token) == null) {
      Get.to(regester());
    } else {
      print("post screen");
    }
  }
}
