import 'package:flutter/material.dart';
import 'package:webtoonapp/models/webtoon.dart';
import 'package:webtoonapp/services/api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<WebtoonModel> webtoons = [];
  bool isLoading = true;

  waitForWebToons() async {
    webtoons = await ApiService.getTodaysToons();
    isLoading = false;

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    waitForWebToons();
  }

  @override
  Widget build(BuildContext context) {
    print(webtoons);
    print(isLoading);

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
    );
  }
}
