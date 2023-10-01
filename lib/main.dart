import 'package:flutter/material.dart';
import 'package:webtoonapp/widgets/button.dart';
import 'package:webtoonapp/widgets/currency_card.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;

  void onClicked() {
    setState(() {
      counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Click Count",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Text(
                  "$counter",
                  style: const TextStyle(fontSize: 30),
                ),
                IconButton(
                  onPressed: onClicked,
                  icon: const Icon(Icons.add),
                  iconSize: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
