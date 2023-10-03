import 'package:flutter/material.dart';
import 'package:webtoonapp/screens/detail.dart';

class WebtoonWidget extends StatelessWidget {
  final String webtoonTitle, webtoonThumb, webtoonId;

  const WebtoonWidget({
    super.key,
    required this.webtoonTitle,
    required this.webtoonThumb,
    required this.webtoonId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              title: webtoonTitle,
              thumb: webtoonThumb,
              id: webtoonId,
            ),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
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
                webtoonThumb,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            webtoonTitle,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
