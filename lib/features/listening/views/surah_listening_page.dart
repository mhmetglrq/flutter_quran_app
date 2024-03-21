import 'package:flutter/material.dart';
import 'package:flutter_quran_app/config/extensions/context_extension.dart';
import 'package:flutter_quran_app/config/routes/app_route_names.dart';
import 'package:quran/quran.dart' as quran;

import '../../../config/widgets/surah/surah_item.dart';

class SurahListeningPage extends StatelessWidget {
  const SurahListeningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listening"),
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
                    route: AppRouteNames.listening,
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
