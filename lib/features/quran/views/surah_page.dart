import 'package:flutter/material.dart';
import 'package:flutter_quran_app/config/extensions/context_extension.dart';
import 'package:quran/quran.dart' as quran;

import '../widgets/surah_item.dart';

class SurahPage extends StatelessWidget {
  const SurahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quran"),
      ),
      body: Padding(
        padding: context.paddingAllDefault,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: quran.totalSurahCount,
                itemBuilder: (BuildContext context, int index) {
                  return SurahItem(
                    surahIndex: index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
