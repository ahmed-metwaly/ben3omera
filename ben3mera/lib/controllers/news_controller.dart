import 'package:ben3mera/helpers/rest_api.dart';
import 'package:ben3mera/models/news_model.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {
  List<NewsModel> data = List<NewsModel>().obs;
  final _url = 'https://ben3mera.ws4it.net/api/news/';

  // NewsController() {
  //   _fetchNews();
  // }

  @override
  void onInit() {
    _fetchNews();
    super.onInit();
  }

  void _fetchNews() async {
    var newsJson = await RestApi.get(_url);

    if (newsJson != null) {
      data = newsModelFromJson(newsJson);
      update();
    } else {
      Get.snackbar('خطاْ', 'يرجي التأكد من الاتصال بالانترنت');
    }
  }
}
