import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          itemCount: 604,
          itemBuilder: (context, index) {
            return index == 0
                ? const Center(child: Text("Bismillahirrahmanirrahim"))
                : Padding(
                    padding: const EdgeInsets.all(15),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "${quran.getSurahNameTurkish(index)} Suresi || $index",
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            for (var i = 0; i < quran.getVerseCount(index); i++)
                              Text(
                                "${i + 1}.Ayet: ${quran.getVerseTranslation(index, i + 1, translation: quran.Translation.trSaheeh)}\n",
                                style: const TextStyle(fontSize: 20),
                                textAlign: TextAlign.justify,
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
