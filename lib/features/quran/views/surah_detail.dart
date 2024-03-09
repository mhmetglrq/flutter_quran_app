import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quran_app/config/extensions/context_extension.dart';
import 'package:flutter_quran_app/config/items/app_colors.dart';
import 'package:flutter_quran_app/config/utility/enum/svg_enum.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/quran.dart' as quran;

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
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: AspectRatio(
                  aspectRatio: 1.5,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.darkGreen,
                          AppColors.lightGreen,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: context.paddingAllDefault,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          quran.getSurahNameTurkish(widget.surahIndex),
                          style: context.textTheme.labelMedium?.copyWith(
                            fontSize: context.dynamicHeight(0.04),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          quran.getSurahNameEnglish(widget.surahIndex),
                          style: context.textTheme.labelMedium?.copyWith(
                            fontSize: context.dynamicHeight(0.032),
                          ),
                        ),
                        const Divider(
                          color: AppColors.whiteColor,
                          endIndent: 50,
                          indent: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${quran.getPlaceOfRevelation(widget.surahIndex)} ",
                              style: context.textTheme.labelMedium?.copyWith(
                                fontSize: context.dynamicHeight(0.02),
                              ),
                            ),
                            Text(
                              "◉ ${quran.getVerseCount(widget.surahIndex)} Verses",
                              style: context.textTheme.labelMedium?.copyWith(
                                fontSize: context.dynamicHeight(0.02),
                              ),
                            ),
                          ],
                        ),
                        SvgPicture.asset(SvgConstants.basmala.getSvg)
                      ],
                    ),
                  ),
                ),
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
