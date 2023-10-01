import 'package:flutter/material.dart';
import 'package:webtoonapp/models/webtoon.dart';
import 'package:webtoonapp/services/api.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 23,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        elevation: 1,
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 20,
                );
              },
              itemBuilder: (context, index) {
                final webtoon = snapshot.data![index];
                return Text(webtoon.title);
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
