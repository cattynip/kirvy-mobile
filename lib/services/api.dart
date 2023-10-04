import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoonapp/models/webtoon_detail_model.dart';
import 'package:webtoonapp/models/webtoon_model.dart';
import 'package:webtoonapp/models/webtooon_episodes_model.dart';

class ApiService {
  static const String baseUrl =
      'https://webtoon-crawler.nomadcoders.workers.dev';
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final Uri url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);

    final bool isHttpRequestSuccessful = response.statusCode == 200;
    if (isHttpRequestSuccessful) {
      final List<dynamic> webtoons = jsonDecode(response.body);

      for (var webtoon in webtoons) {
        final toon = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(toon);
      }

      return webtoonInstances;
    }

    throw Error();
  }

  static Future<WebtoonDetailModel> getToonsById(String webtoonId) async {
    final Uri url = Uri.parse('$baseUrl/$webtoonId');
    final response = await http.get(url);

    final bool isHttpRequestSuccessful = response.statusCode == 200;
    if (isHttpRequestSuccessful) {
      final Map<String, dynamic> decodedWebtoonDetails =
          jsonDecode(response.body);
      final WebtoonDetailModel webtoonDetails =
          WebtoonDetailModel.fromJson(decodedWebtoonDetails);

      return webtoonDetails;
    }

    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getToonsEpisodesById(
      String webtoonId) async {
    final Uri url = Uri.parse('$baseUrl/$webtoonId/episodes');
    final response = await http.get(url);

    final bool isHttpRequestSuccessful = response.statusCode == 200;
    if (isHttpRequestSuccessful) {
      final List<Map<String, dynamic>> decodedWebtoonEpisodes =
          jsonDecode(response.body);
      final List<WebtoonEpisodeModel> webtoonEpisodesInstances = [];

      for (Map<String, dynamic> webtoonEpisode in decodedWebtoonEpisodes) {
        final WebtoonEpisodeModel webtoonEpisodeData =
            WebtoonEpisodeModel.fromJson(webtoonEpisode);
        webtoonEpisodesInstances.add(webtoonEpisodeData);
      }

      return webtoonEpisodesInstances;
    }

    throw Error();
  }
}
