import 'package:ben3mera/helpers/rest_api.dart';
import 'package:ben3mera/models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<Datum> data = List<Datum>();
  final initialPage = 1.obs;
  final ngmDescription = ''.obs;
  final ngmName = ''.obs;
  var loading = true.obs;

  @override
  onInit() {
    getHomeData();

    super.onInit();
  }

  Future<void> getHomeData() async {
    final response =
        await RestApi.get('https://ben3mera.ws4it.net/api/get-calendar-days');

    if (response != null) {
      final homeJson = homeModelFromJson(response);
      initialPage.value = homeJson.initialPage;

      data = homeJson.data;

      ngmName.value = homeJson.data[homeJson.initialPage].ngmName;

      ngmDescription.value = homeJson.data[homeJson.initialPage].ngmDescription;

      loading.value = false;

      update();
    } else {
      Get.snackbar('خطاْ', 'يرجي التأكد من الاتصال بالانترنت');
    }
  }

  void setDataOnPageChanged(String name, String text) {
    ngmName.value = name;
    ngmDescription.value = text;
    update();
  }
}
