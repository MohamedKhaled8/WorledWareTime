import 'package:world_time/Home.dart';
import 'package:flutter/material.dart';
import 'package:world_time/loading.dart';
import 'package:world_time/Location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/loading',
      routes: {
        '/loading': (context) => const Loading(),
        '/home': (context) => const Home(),
        '/Locatoin': (context) => const Location(),
      },
    );
  }
}
