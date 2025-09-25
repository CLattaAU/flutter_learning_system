import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

/// Controls which screen is currently shown
enum ScreenType { hello, counter }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ScreenType screen = ScreenType.hello;
  int count = 0;

  void incrementCount() {
    setState(() {
      count++;
    });
  }

  void toggleScreen() {
    setState(() {
      screen = screen == ScreenType.hello
          ? ScreenType.counter
          : ScreenType.hello;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          screen == ScreenType.hello
              ? 'HelloStateless'
              : 'CounterStateful',
        ),
        actions: [
          IconButton(
            onPressed: toggleScreen,
            icon: const Icon(Icons.swap_horiz),
          ),
        ],
      ),
      body: Center(
        child: screen == ScreenType.hello
            ? const HelloStateless()
            : CounterStateful(count: count),
      ),
      floatingActionButton: screen == ScreenType.counter
          ? FloatingActionButton(
              onPressed: incrementCount,
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}

/// A simple stateless widget — no state, just fixed UI
class HelloStateless extends StatelessWidget {
  const HelloStateless({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Hello from Stateless");
  }
}

/// A stateful widget that depends on external state (passed via constructor)
class CounterStateful extends StatelessWidget {
  final int count;
  const CounterStateful({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Text("Count: $count");
  }
}
