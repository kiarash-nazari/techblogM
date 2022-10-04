import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tec_blog/components/api_constant.dart';
import 'package:tec_blog/services/dio_service.dart';

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
    print(response);
  }
}
