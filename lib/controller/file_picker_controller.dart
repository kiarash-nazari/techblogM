import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class FilePickerController extends GetxController {
  Rx<PlatformFile> file = PlatformFile(name: "nothingtecblog", size: 0).obs;
}
