import 'package:flutter/material.dart';
import  'package:learnig_project1/MyHomePage.dart';
import 'package:learnig_project1/themeSelectionPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Game RPS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const MyHomePage(title: 'Home Page'),
      home: ThemeSelectionPage(),
    );
  }
}

