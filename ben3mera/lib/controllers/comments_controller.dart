import 'package:ben3mera/helpers/rest_api.dart';
import 'package:ben3mera/models/comments_model.dart';
import 'package:get/get.dart';

class CommentsController extends GetxController {
  List<CommentsModel> comments;

  final loading = true.obs;

  // add comment data
  final username = ''.obs;
  final email = ''.obs;
  final comment = ''.obs;
  final newsId = 1.obs;

  Future<void> getComments(int id) async {
    var commentsJson = await RestApi.get(
        'https://ben3mera.ws4it.net/api/news-get-comments/$id');

    if (commentsJson != null) {
      comments = commentsModelFromJson(commentsJson);
      update();
      loading(false);
    } else {
      Get.snackbar('خطاْ', 'يرجي التأكد من الاتصال بالانترنت');
    }
  }

  Future<void> addComment() async {
    final addComment = RestApi.get(
        'https://ben3mera.ws4it.net/api/news-add-comment/${newsId.value}?user_name=${username.value}&user_email=${email.value}&comment=${comment.value}');
    if (addComment != null) {
      Get.snackbar('تم بنجاح', 'شكرا لتعليقك ٫٫ سيتم النشر قريبا');
    } else {
      Get.snackbar('خطاْ', 'يرجي التأكد من الاتصال بالانترنت');
    }
  }
}
