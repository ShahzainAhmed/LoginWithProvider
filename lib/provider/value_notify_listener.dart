import 'package:flutter/material.dart';

class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({super.key});

  // ValueNotifier extends ChangeNotifier
  ValueNotifier<int> _counter = ValueNotifier(0); // initial value 0
  ValueNotifier<bool> toggle = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stateless as Stateful Widget"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ValueListenableBuilder(
            // we use this to only build specific parts of the widget and make the stateless to stateful widget

            valueListenable: toggle,
            builder: ((context, value, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  obscureText: toggle.value, // to hide the password
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: InkWell(
                      onTap: () {
                        toggle.value = !toggle.value;
                      },
                      child: Icon(
                          toggle.value
                              ? Icons.visibility_off_outlined // if value = true
                              : Icons.visibility, // if value == false
                          color: Colors.deepPurple),
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ValueListenableBuilder(
              valueListenable: _counter,
              builder: ((context, value, child) {
                return Text(
                  _counter.value.toString(),
                  style: const TextStyle(fontSize: 50),
                );
              }),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          _counter.value++; // initial value set to 0 in valuenotifier
          print(_counter.value.toString());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
