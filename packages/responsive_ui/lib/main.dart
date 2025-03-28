import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_ui/size_provider.dart';

void main() {
  runApp(const MyApp());
}

enum ResponsiveSize {
  small(950),
  medium(1920),
  large(3840),
  extraLarge(4096);

  const ResponsiveSize(this.widthBreakpoint);
  final int widthBreakpoint;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SizeProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ResponsiveWidget()],
        ),
      ),
    );
  }
}

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final currentSize = context.watch<SizeProvider>().currentSize;
    return Text('I am a ${currentSize.name}-sized responsive widget');
  }
}
