import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:webtoonapp/models/webtoon_detail_model.dart';
import 'package:webtoonapp/models/webtooon_episodes_model.dart';
import 'package:webtoonapp/services/api.dart';

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
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> webtoonEpisodes;

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonsById(widget.id);
    webtoonEpisodes = ApiService.getToonsEpisodesById(widget.id);
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
                              height: 5,
                            ),
                            FutureBuilder(
                              future: webtoonEpisodes,
                              builder: (context, episodesSnapshot) {
                                if (episodesSnapshot.hasData) {
                                  return Column(
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          height: 200,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                episodesSnapshot.data!.length,
                                            itemBuilder: (context, index) {
                                              return const Text("safjklafj");
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }

                                return const CircularProgressIndicator();
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