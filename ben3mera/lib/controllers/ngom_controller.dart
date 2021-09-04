import 'package:ben3mera/helpers/rest_api.dart';
import 'package:ben3mera/models/Ngom_model.dart';
import 'package:get/get.dart';

class NgomController extends GetxController {
  final isNow = 1.obs;
  final loading = true.obs;
  List<Datum> data;



  @override
  void onInit() {
    getNgom();
    super.onInit();
  }



  Future<void> getNgom() async {
    final response =
        await RestApi.get('https://ben3mera.ws4it.net/api/ngm-higri');

    if (response != null) {
      final ngomJson = ngomModelFromJson(response);

      isNow.value = ngomJson.isNow;
      data = ngomJson.data;

      loading.value = false;

      update();
    } else {
      Get.snackbar('خطاْ', 'يرجي التأكد من الاتصال بالانترنت');
    }
  }
}
