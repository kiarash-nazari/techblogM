import 'package:get/get.dart';
import 'package:tec_blog/constant/api_constant.dart';
import 'package:tec_blog/models/data_models.dart';
import 'package:tec_blog/models/podcast_file_modle.dart';
import 'package:tec_blog/services/dio_service.dart';

class PodcastSingleController extends GetxController {
  var id;

  PodcastSingleController({this.id});
  RxBool loading = false.obs;
  RxList<PdcastFileModle> podcastFileList = RxList();

  @override
  onInit() {
    super.onInit();
    getPodcastFile();
  }

  getPodcastFile() async {
    loading.value = true;

    var response =
        await DioService().getMethod(ApiUrlConstant.getPodcastFile + id);

    if (response.statusCode == 200) {
      for (var element in response.data["files"]) {
        podcastFileList.add(PdcastFileModle.fromJson(element));
        print(podcastFileList.first);
      }
      loading.value = false;
    }
  }
}
