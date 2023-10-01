import 'package:flutter/material.dart';
import 'package:webtoonapp/models/webtoon.dart';
import 'package:webtoonapp/services/api.dart';

class Home extends StatelessWidget {
  Home({super.key});

  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

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
            return const Text("There is data");
          } else {
            return const Text("Loading...");
          }
        },
      ),
    );
  }
}
