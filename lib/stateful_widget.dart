// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class StatefulWidgetScreen extends StatefulWidget {
  const StatefulWidgetScreen({super.key});

  @override
  State<StatefulWidgetScreen> createState() => _StatefulWidgetScreenState();
}

class _StatefulWidgetScreenState extends State<StatefulWidgetScreen> {
  int x = 10;

  @override
  Widget build(BuildContext context) {
    print("build"); // hot reload will rebuild the app from here
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stateful Widget"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(DateTime.now().toString(), style: const TextStyle(fontSize: 25),),
          Center(
            child: Text(x.toString(), style: const TextStyle(fontSize: 100)),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 80,
        height: 80,
        child: FloatingActionButton(
          onPressed: () {
            x++;
            print(x);
            setState(
                () {}); // it will refresh the entire screen, even including AppBar
          },
          backgroundColor: Colors.red,
          child: const Icon(
            Icons.add,
            size: 50,
          ),
        ),
      ),
    );
  }
}
