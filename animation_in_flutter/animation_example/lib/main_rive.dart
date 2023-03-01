import 'package:animation_example/animated_logo.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rive/rive.dart';

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
        primarySwatch: Colors.blue,
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
  late RiveAnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = SimpleAnimation("idle");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First page"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 300,
                child: RiveAnimation.asset("assets/rive.riv",
                    fit: BoxFit.fitWidth,
                    controllers: [controller],
                    onInit: (_) => setState(() {})),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            controller.isActive = !controller.isActive;
          });
        },
        child:
            !controller.isActive ? const Icon(Icons.play_arrow) : const Icon(Icons.pause),
      ),
    );
  }
}
