import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

import '../core/api/api_service.dart';
import '../core/constants/app_routes.dart';

class PdfController extends GetxController {
  final ApiService _apiService = ApiService();

  RxString fileName = 'No file selected'.obs;

  RxBool isLoading = false.obs;

  String? selectedFilePath;

  Future<void> pickPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      fileName.value = result.files.single.name;

      selectedFilePath = result.files.single.path;
    }
  }

  Future<void> analyzePdf() async {
    try {
      if (selectedFilePath == null) {
        Get.snackbar(
          'Error',
          'Please select a PDF file',
        );
        return;
      }

      isLoading.value = true;

      final response = await _apiService.analyzePdf(
        selectedFilePath!,
      );

      Get.toNamed(
        AppRoutes.result,
        arguments: response.answer,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
