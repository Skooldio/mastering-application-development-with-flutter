import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

//AIzaSyBy1L804apuPFT_tdvEVVitUaFg9SkpuGs


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  //13.736717, 100.523186.
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: LatLng(13.736717, 100.523186)),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
