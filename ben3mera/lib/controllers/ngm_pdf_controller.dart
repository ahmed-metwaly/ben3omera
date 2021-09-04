import 'package:ben3mera/helpers/rest_api.dart';
import 'package:ben3mera/models/ngm_pdf_model.dart';
import 'package:get/get.dart';

class NgmPdfController extends GetxController {
  final loading = true.obs;
  List<NgmPdfModel> data;

  @override

  void onInit() {
    getPdf();
    super.onInit();
  }



  Future<void> getPdf() async {
    final response =
    await RestApi.get('https://ben3mera.ws4it.net/api/pdf');

    if (response != null) {
      final ngomJson = ngmPdfModelFromJson(response);

      data = ngomJson;

      loading.value = false;

      update();
    } else {
      Get.snackbar('خطاْ', 'يرجي التأكد من الاتصال بالانترنت');
    }
  }

}