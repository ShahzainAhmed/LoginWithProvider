import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/example_one_provider.dart';

class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({super.key});

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {
  // double value = 1.0;
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<ExampleOneProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example 1"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(builder: ((context, value, child) {
            return Slider(
              min: 0,
              max: 1,
              value: value.value,
              onChanged: (val) {
                // print(val);
                value.setValue(val);
              },
            );
          })),
          Consumer<ExampleOneProvider>(builder: ((context, value, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(value.value)),
                    child: const Center(
                      child: Text(
                        "Container 1",
                        style: TextStyle(fontSize: 35),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(value.value)),
                    child: const Center(
                      child: Text(
                        "Container 1",
                        style: TextStyle(fontSize: 35),
                      ),
                    ),
                  ),
                )
              ],
            );
          })),
        ],
      ),
    );
  }
}
