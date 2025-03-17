import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => const MaterialApp(title: 'Flutter Demo', home: CounterManager());
}

class CounterManager extends StatefulWidget {
  const CounterManager({super.key});

  @override
  State<CounterManager> createState() => _CounterManagerState();
}

class _CounterManagerState extends State<CounterManager> {
  int _counter = 0;
  final _previousValues = <int>[];

  void _incrementCounter(int amount) => setState(() => _counter += amount);
  void _reset() => setState(() => _counter = 0);

  @override
  Widget build(BuildContext context) =>
      CounterPage(value: _counter, previousValues: _previousValues, increment: _incrementCounter, reset: _reset);
}

class CounterPage extends StatelessWidget {
  const CounterPage({
    super.key,
    required this.value,
    required this.increment,
    required this.reset,
    required this.previousValues,
  });

  final int value;
  final List<int> previousValues;
  final ValueChanged<int> increment;
  final VoidCallback reset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text('$value', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 16),
            Text('Previous: ${previousValues.join(', ')}', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () => increment(1), child: const Text('+1')),
                const SizedBox(width: 16),
                ElevatedButton(onPressed: () => increment(5), child: const Text('+5')),
                const SizedBox(width: 16),
                ElevatedButton(onPressed: () => increment(10), child: const Text('+10')),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: reset, child: const Text('Reset')),
          ],
        ),
      ),
    );
  }
}
