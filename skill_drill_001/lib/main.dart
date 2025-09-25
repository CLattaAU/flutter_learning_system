import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String screen = "HelloStateless";
  int count = 0;

  void incrementCount() {
    setState(() {
      count++;
    });
  }

  void toggleScreen() {
    setState(() {
      screen = screen == "HelloStateless"
          ? "CounterStateful"
          : "HelloStateless";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Visibility(
            visible: screen == "CounterStateful",
            child: FloatingActionButton(
              onPressed: incrementCount,
              child: const Icon(Icons.add),
            ),
          ), 
          SizedBox(width: 5.0,),         
          FloatingActionButton(
            onPressed: toggleScreen,
            child: const Text("Toggle"),
          ),
        ],
      ),
      body: screen == "HelloStateless"
          ? const HelloStateless()
          : CounterStateful(
              count: count,
            ),
    );
  }
}

class HelloStateless extends StatelessWidget {
  const HelloStateless({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Hello from Stateless'),
    );
  }
}

class CounterStateful extends StatefulWidget {
  const CounterStateful({
    super.key,
    // required this.incrementCounter,
    required this.count,
  });

  // final VoidCallback incrementCounter;
  final int count;

  @override
  State<CounterStateful> createState() => _CounterStatefulState();
}

class _CounterStatefulState extends State<CounterStateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Count: ${widget.count}"),
      ),
    );
  }
}
