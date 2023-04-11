import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homelander Sashulya',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'Homelander Sashulya🎉'),
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
  Color color = Color.fromRGBO(110, 255, 61, 1.0);
  Random colorRandom = Random();
  List<String> text = [];
  int counter = 0;
  late final Timer timer = Timer.periodic(Duration(seconds: 1), (Timer t) => printText());

  @override
  void initState() {
    super.initState();
    timer;
  }
  void printText() {
    if (counter < 100) {
      setState(() {
        counter++;
        colorGenerated();
        text.add("I'm Stronger. I'm Smarter. I'm Better. I Am Better!🎆🎉$counter");
      });
    } else {
      timer.cancel();
    }
  }

  void colorGenerated() {
    setState(() {
      int r = colorRandom.nextInt(255);
      int g = colorRandom.nextInt(255);
      int b = colorRandom.nextInt(255);
      Color newColor = Color.fromRGBO(r, g, b, 1.0);
      color = newColor;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            floating: true,
            snap: true,
            backgroundColor: color,
            title: Text(widget.title),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return ListTile(
                  title: Text(text[index]),
                );
              },
              childCount: text.length,
            ),
          ),
        ],
      ),
    );
  }
}
