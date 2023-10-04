class WebtoonEpisodeModel {
  final String title, rating, thumb, date, id;

  WebtoonEpisodeModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        rating = json['rating'],
        thumb = json['thumb'],
        date = json['date'],
        id = json['id'];
}
