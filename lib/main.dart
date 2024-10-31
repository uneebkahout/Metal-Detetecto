import 'package:flutter/material.dart';
import 'package:wheather_app/pages/homePage.dart';
import 'package:wheather_app/pages/loading.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        // '/': (context) => locationPage(),
        '/loading': (context) => loadingPage(),
        '/home': (context) => homePage()
      },
    );
  }
}
