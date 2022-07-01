import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class StatefulColorfulTile extends StatefulWidget {
  const StatefulColorfulTile({Key? key}) : super(key: key);

  @override
  State<StatefulColorfulTile> createState() => _StatefulColorfulTileState();
}

class _StatefulColorfulTileState extends State<StatefulColorfulTile> {
  Color? myColor;

  @override
  void initState() {
    myColor = Color(
      (math.Random().nextDouble() * 0xFFFFFF).toInt(),
    ).withOpacity(
      1.0,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: myColor,
      child: const Padding(
        padding: EdgeInsets.all(70.0),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final containers = [
    const Padding(
      padding: EdgeInsets.all(10),
      child: StatefulColorfulTile(
        key: GlobalObjectKey(0), // CHANGES :)
      ),
    ),
    const Padding(
      // KEYS WERE NOT PRESENT SO WHENEVER THE WIDGET TREE CHANGES THE RELATIVE TREE THE CHANGES WERE NOT VISIBLE .
      padding: EdgeInsets.all(10),
      child: StatefulColorfulTile(
        key: GlobalObjectKey(1), // CHANGES :)
      ),
    )
  ];

  @override
  void initState() {
    super.initState();
  }

  void swapColour() {
    setState(() {
      containers.insert(1, containers.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: containers,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => swapColour(),
        child: const Icon(Icons.change_circle_outlined),
      ),
    );
  }
}
