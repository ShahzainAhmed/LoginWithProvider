
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

// stateless widgets are immutable (cannot change their state)
class StatelessWidgetScreen extends StatelessWidget {
  StatelessWidgetScreen({super.key});

  int x = 86; // final means non-changeable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("State Management"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              x.toString(),
              style: const TextStyle(fontSize: 100),
            ),
          )
        ],
      ),
      floatingActionButton: SizedBox(
        height: 80,
        width: 70,
        child: FloatingActionButton(
          onPressed: () {
            x++;
            print(x);
          },
          backgroundColor: Colors.deepPurple,
          child: const Icon(Icons.add, size: 40),
        ),
      ),
    );
  }
}
