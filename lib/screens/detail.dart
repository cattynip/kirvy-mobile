import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webtoonapp/models/webtoon_detail_model.dart';
import 'package:webtoonapp/models/webtooon_episodes_model.dart';
import 'package:webtoonapp/services/api.dart';
import 'package:webtoonapp/widgets/episode_button_widget.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late final Future<WebtoonDetailModel> webtoon;
  late final Future<List<WebtoonEpisodeModel>> webtoonEpisodes;
  late final SharedPreferences prefs;
  bool isLiked = false;

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final likedWebtoons = prefs.getStringList("likedWebtoons");

    if (likedWebtoons != null) {
      if (likedWebtoons.contains(widget.id) == true) {
        setState(() {
          isLiked = true;
        });
      }
    } else {
      await prefs.setStringList("likedWebtoons", []);
    }
  }

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonsById(widget.id);
    webtoonEpisodes = ApiService.getToonsEpisodesById(widget.id);
    initPrefs();
  }

  void toggleFavourite() async {
    final List<String>? defaultValue = prefs.getStringList("likedWebtoons");

    final bool isDefaultValueChangable = defaultValue != null;
    if (isDefaultValueChangable) {
      final List<String> changedValue = defaultValue;
      if (isLiked) {
        changedValue.remove(widget.id);
      } else {
        changedValue.add(widget.id);
      }
      setState(() {
        isLiked = !isLiked;
      });

      prefs.setStringList("likedWebtoons", changedValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 23,
          ),
        ),
        actions: [
          IconButton(
            onPressed: toggleFavourite,
            icon: Icon(
              isLiked == true
                  ? Icons.favorite_sharp
                  : Icons.favorite_outline_sharp,
            ),
          )
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: widget.id,
                    child: Container(
                      width: 250,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            offset: const Offset(0, 0),
                            color: Colors.black.withOpacity(0.6),
                          )
                        ],
                      ),
                      child: Image.network(
                        widget.thumb,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: webtoon,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              "About",
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              snapshot.data!.about,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${snapshot.data!.genre} / ${snapshot.data!.age}",
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          width: double.infinity,
                          height: 0.3,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              "Episodes",
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            FutureBuilder(
                              future: webtoonEpisodes,
                              builder: (context, episodesSnapshot) {
                                if (episodesSnapshot.hasData) {
                                  return Column(
                                    children: [
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      for (var episode
                                          in episodesSnapshot.data!)
                                        EpisodeButtonWidget(
                                          episodeId: episode.id,
                                          episodeTitle: episode.title,
                                          webtoonId: widget.id,
                                        ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  );
                                }

                                return Container();
                              },
                            )
                          ],
                        )
                      ],
                    );
                  }

                  return const CircularProgressIndicator();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
