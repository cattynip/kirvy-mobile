import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://webtoon-crawler.nomadcoders.workers.dev';
  final String today = "today";

  void getTodaysToons() async {
    final Uri url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);

    final bool isHttpRequestSuccessful = response.statusCode == 200;
    if (isHttpRequestSuccessful) {
      print(response.body);
      return;
    }

    throw Error();
  }
}
