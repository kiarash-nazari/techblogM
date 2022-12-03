import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_formdata;
import 'package:get_storage/get_storage.dart';
import 'package:tec_blog/constant/storage_const.dart';

class DioService {
  Dio dio = Dio();
  Future<dynamic> getMethod(String url) async {
    dio.options.headers['Content-Type'] = 'application/json';
    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: 'GET'))
        .then((response) {
      log(response.toString());

      return response;
    }).catchError((err) {
      if (err is DioError) {
        return err.response!;
      }
    });
  }

  Future<dynamic> postMethod(Map<String, dynamic> map, String url) async {
    dio.options.headers['Content-Type'] = 'application/json';

    var token = GetStorage().read(StorageKey.token);
    if (token != null) {
      dio.options.headers['Authorization'] = token;
    }
    return await dio
        .post(url,
            data: dio_formdata.FormData.fromMap(map),
            options: Options(responseType: ResponseType.json, method: 'Post'))
        .then((response) {
      log(response.headers.toString());
      log(response.data.toString());
      log(response.statusCode.toString());
      return response;
    }).catchError((err) {
      if (err is DioError) {
        return err.response!;
      }
    });
  }
}
