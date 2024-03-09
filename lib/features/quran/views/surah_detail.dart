import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quran_app/config/extensions/context_extension.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quran/quran.dart' as quran;

import '../widgets/surah_info_item.dart';
import '../widgets/verse_item.dart';

class SurahDetail extends StatefulWidget {
  const SurahDetail({super.key, required this.surahIndex});
  final int surahIndex;

  @override
  State<SurahDetail> createState() => _SurahDetailState();
}

class _SurahDetailState extends State<SurahDetail> {
  final player = AudioPlayer();
  bool _isPlaying = false;
  int _currentVerse = 0;
  final savedAyahs = Hive.box("savedAyahs");
  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  //player oynatmayı bitirdiğin de çalışacak
  void onVerseComplete() {
    player.onPlayerComplete.listen((event) {
      setState(() {
        _isPlaying = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    onVerseComplete();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          quran.getSurahNameTurkish(widget.surahIndex),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: context.paddingAllDefault,
          child: Column(
            children: [
              SurahInfoItem(
                surahIndex: widget.surahIndex,
              ),
              ValueListenableBuilder(
                  valueListenable: savedAyahs.listenable(),
                  builder: (context, value, child) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: quran.getVerseCount(widget.surahIndex),
                      itemBuilder: (BuildContext context, int index) {
                        return VerseItem(
                          isPlaying: _isPlaying,
                          currentVerse: _currentVerse,
                          surahIndex: widget.surahIndex,
                          index: index,
                          playButtonOnPressed: () async {
                            if (_isPlaying) {
                              await player.pause();
                              setState(() {
                                _isPlaying = false;
                              });
                              return;
                            } else {
                              await player.play(
                                UrlSource(
                                  quran.getAudioURLByVerse(
                                    widget.surahIndex,
                                    index + 1,
                                  ),
                                ),
                                volume: 1.0,
                              );
                              setState(() {
                                _isPlaying = true;
                                _currentVerse = index + 1;
                              });
                            }
                          },
                          bookmarkButtonOnPressed: () {
                            savedAyahs.put("surahNameArabic",
                                quran.getSurahNameArabic(widget.surahIndex));
                            savedAyahs.put("ayahNumber", index + 1);
                            savedAyahs.put("surahNameTurkish",
                                quran.getSurahNameTurkish(widget.surahIndex));
                          },
                          isSaved: savedAyahs.get("surahNameArabic") ==
                                  quran.getSurahNameArabic(widget.surahIndex) &&
                              savedAyahs.get("ayahNumber") == index + 1,
                        );
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
