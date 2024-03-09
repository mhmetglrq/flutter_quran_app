import 'package:flutter/material.dart';
import 'package:flutter_quran_app/my_app.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("savedAyahs");

  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}
