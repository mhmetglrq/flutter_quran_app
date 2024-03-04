import 'package:flutter/material.dart';
import 'package:flutter_quran_app/features/home/views/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quran',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        
      ),
      home: const Home(),
    );
  }
}
