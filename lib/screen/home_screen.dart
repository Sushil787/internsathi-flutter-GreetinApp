import 'dart:async';

import 'package:approvider/provider/theme_provider.dart';
import 'package:approvider/provider/time_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 1), (timer) {
      Provider.of<TimeProvider>(context, listen: false).updateTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("App Greeter"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<TimeProvider>(builder: ((context, value, child) {
            return Text(
              'time ${value.getCurrentTime}',
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            );
          })),
          Center(
            child: Consumer<ThemeNotifier>(
              builder: ((context, value, child) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${value.getMessage.toString()} user",
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          child: Image.asset(value.getImage))
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

// getDateTime() {
//   print();
// }
