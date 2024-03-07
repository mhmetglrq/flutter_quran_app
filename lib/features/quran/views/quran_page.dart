import 'package:flutter/material.dart';
import 'package:flutter_quran_app/config/extensions/context_extension.dart';
import 'package:quran/quran.dart' as quran;

class QuranPage extends StatelessWidget {
  const QuranPage({super.key});

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
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
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
