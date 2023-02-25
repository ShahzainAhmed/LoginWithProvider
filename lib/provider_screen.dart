// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings

import 'dart:async';

import 'package:flutter/material.dart';

class ProviderScreen extends StatefulWidget {
  const ProviderScreen({super.key});

  @override
  State<ProviderScreen> createState() => _ProviderScreenState();
}

class _ProviderScreenState extends State<ProviderScreen> {
  int count = 0;

  @override
  // init method is called first than the widget
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 1), (timer) {
      count++;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build" + count.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Screen"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
                DateTime.now().hour.toString() +
                    ":" +
                    DateTime.now().minute.toString() +
                    ":" +
                    DateTime.now().second.toString(),
                style: const TextStyle(fontSize: 50)),
          ),
          Text(
            count.toString(),
            style: const TextStyle(fontSize: 40),
          )
        ],
      ),
    );
  }
}
