import 'package:flutter/material.dart';
import 'package:projekt_hybrydowy/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'abc News',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black45),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

// https://www.youtube.com/watch?v=6IqoBiPgAMU&ab_channel=CodeWithSheriga