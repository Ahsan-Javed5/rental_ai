import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

import '../core/constants/app_routes.dart';
import '../core/constants/app_strings.dart';

class PdfController extends GetxController {
  RxString fileName = 'No file selected'.obs;

  Future<void> pickPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      fileName.value = result.files.single.name;
    }
  }

  void analyzePdf() {
    Get.toNamed(
      AppRoutes.result,
      arguments: AppStrings.dummyResponse,
    );
  }
}
