import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EpisodeButtonWidget extends StatelessWidget {
  final String webtoonId, episodeTitle, episodeId;

  const EpisodeButtonWidget({
    required this.webtoonId,
    required this.episodeTitle,
    required this.episodeId,
    super.key,
  });

  void onButtonTapped() async {
    final Uri url = Uri.parse(
        "https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=$episodeId");
    await launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.only(
          left: 10,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.green.shade600,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.7),
              offset: const Offset(0, 0),
              spreadRadius: 0.01,
              blurRadius: 4,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              episodeTitle,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: onButtonTapped,
              color: Colors.white,
              iconSize: 20,
              icon: const Icon(
                Icons.keyboard_arrow_right_outlined,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 10,
      ),
    ]);
  }
}
