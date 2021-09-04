import 'package:ben3mera/helpers/rest_api.dart';
import 'package:ben3mera/models/azkar_model.dart';
import 'package:get/get.dart';

class AzkarController extends GetxController {
  List<AzkarModel> data;

  final loading = true.obs;

  @override
  void onInit() {
    _getAzkar();
    super.onInit();
  }

  Future<void> _getAzkar() async {
    final responseJson =
        await RestApi.get('https://ben3mera.ws4it.net/api/eslamy');

    if (responseJson != null) {
      data = azkarModelFromJson(responseJson);
      update();
      loading(false);
    } else {
      Get.snackbar('خطاْ', 'يرجي التأكد من الاتصال بالانترنت');
    }
  }
}
