import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_formdata;

class DioService {
  Dio dio = Dio();
  Future<dynamic> getMethod(String url) async {
    dio.options.headers['Content-Type'] = 'application/json';
    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: 'GET'))
        .then((response) {
      return response;
    }).catchError((err) {
      if (err is DioError) {
        return err.response!;
      }
    });
  }

  Future<dynamic> postMethod(Map<String, dynamic> map, String url) async {
    dio.options.headers['Content-Type'] = 'application/json';
    return await dio
        .post(url,
            data: dio_formdata.FormData.fromMap(map),
            options: Options(responseType: ResponseType.json, method: 'Post'))
        .then((response) {
      return response;
    }).catchError((err) {
      if (err is DioError) {
        return err.response!;
      }
    });
  }
}
