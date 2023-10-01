import 'package:flutter/material.dart';
import 'package:webtoonapp/screens/home.dart';
import 'package:webtoonapp/services/api.dart';

void main() {
  ApiService().getTodaysToons();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}
