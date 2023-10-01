import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  static const int defaultInitialSeconds = 1500;
  int totalSeconds = defaultInitialSeconds;
  int totalPomodoros = 0;
  bool isRunning = false;
  late Timer timer;

  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);

    setState(() {
      isRunning = true;
    });
  }

  void onStopPressed() {
    timer.cancel();

    setState(() {
      isRunning = false;
    });
  }

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalSeconds = defaultInitialSeconds;
        totalPomodoros += 1;
      });

      onStopPressed();
    } else {
      setState(() {
        totalSeconds -= 1;
      });
    }
  }

  String formatTime() {
    return Duration(seconds: totalSeconds)
        .toString()
        .split(".")
        .first
        .substring(2);
  }

  @override
  Widget build(BuildContext context) {
    // print(im);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                formatTime(),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 90,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: IconButton(
                onPressed: isRunning ? onStopPressed : onStartPressed,
                icon: Icon(
                  isRunning
                      ? Icons.stop_circle_outlined
                      : Icons.play_circle_outline,
                ),
                iconSize: 120,
                color: Theme.of(context).cardColor,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pomodoros",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                        Text(
                          "$totalPomodoros",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
