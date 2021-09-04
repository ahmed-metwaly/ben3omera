import 'package:http/http.dart' as http;

class RestApi {
  static var _client = http.Client();

  static Future get(String url) async {
    http.Response response = await _client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  static Future post(String url, Map data) async {
    final response = await _client.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: data,
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}
