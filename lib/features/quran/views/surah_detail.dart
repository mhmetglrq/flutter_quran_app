import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quran_app/config/extensions/context_extension.dart';
import 'package:flutter_quran_app/config/items/app_colors.dart';
import 'package:flutter_quran_app/config/utility/enum/svg_enum.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/quran.dart' as quran;

class SurahDetail extends StatefulWidget {
  const SurahDetail({super.key, required this.surahIndex});
  final int surahIndex;

  @override
  State<SurahDetail> createState() => _SurahDetailState();
}

class _SurahDetailState extends State<SurahDetail> {
  final player = AudioPlayer();
  bool _isPlaying = false;

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
              for (int i = 0; i < quran.getVerseCount(widget.surahIndex); i++)
                Column(
                  children: [
                    Padding(
                      padding: context.paddingVerticalLow,
                      child: Card(
                        elevation: 5,
                        surfaceTintColor: AppColors.whiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ListTile(
                          contentPadding: context.paddingHorizontalLow,
                          leading: CircleAvatar(
                            backgroundColor: AppColors.darkGreen,
                            child: Text(
                              (i + 1).toString(),
                              style: context.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.whiteColor,
                                fontSize: context.dynamicHeight(0.02),
                              ),
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon:
                                    SvgPicture.asset(SvgConstants.share.getSvg),
                              ),
                              _isPlaying
                                  ? IconButton(
                                      onPressed: () async {
                                        await player.pause();
                                        setState(() {
                                          _isPlaying = false;
                                        });
                                      },
                                      icon: SvgPicture.asset(
                                          SvgConstants.pause.getSvg),
                                    )
                                  : IconButton(
                                      onPressed: () async {
                                        await player.play(
                                          UrlSource(
                                            quran.getAudioURLByVerse(
                                              widget.surahIndex,
                                              i + 1,
                                            ),
                                          ),
                                          volume: 1.0,
                                        );
                                        setState(() {
                                          _isPlaying = true;
                                        });
                                      },
                                      icon: SvgPicture.asset(
                                          SvgConstants.play.getSvg),
                                    ),
                              IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                    SvgConstants.bookmark.getSvg),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: context.paddingBottomLow,
                      alignment: Alignment.centerRight,
                      child: Text(
                        quran.getVerse(widget.surahIndex, i + 1,
                            verseEndSymbol: true),
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontSize: context.dynamicHeight(0.025),
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        quran.getVerseTranslation(
                          widget.surahIndex,
                          i + 1,
                          translation: quran.Translation.trSaheeh,
                        ),
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontSize: context.dynamicHeight(0.025),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding: context.paddingVerticalLow,
                      child: const Divider(),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
