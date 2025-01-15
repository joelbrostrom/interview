import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ResponsiveWidget(size: Size.small),
          ],
        ),
      ),
    );
  }
}

enum Size {
  small(950),
  medium(1920),
  large(3840),
  extraLarge(4096);

  const Size(this.widthBreakpoint);
  final int widthBreakpoint;
}

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Text('I am a ${size.name}-sized responsive widget');
  }
}
