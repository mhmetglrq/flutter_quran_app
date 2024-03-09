import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quran_app/config/extensions/context_extension.dart';
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

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: quran.getVerseCount(widget.surahIndex),
                itemBuilder: (BuildContext context, int index) {
                  return VerseItem(
                    isPlaying: _isPlaying,
                    currentVerse: _currentVerse,
                    surahIndex: widget.surahIndex,
                    index: index,
                    onPressed: () async {
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
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
