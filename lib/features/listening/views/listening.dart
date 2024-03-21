import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quran_app/config/extensions/context_extension.dart';
import 'package:flutter_quran_app/config/items/app_colors.dart';
import 'package:flutter_quran_app/config/utility/enum/svg_enum.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/quran.dart' as quran;

class Listening extends StatefulWidget {
  const Listening({super.key, required this.surahIndex});
  final int surahIndex;
  @override
  State<Listening> createState() => _ListeningState();
}

class _ListeningState extends State<Listening> {
  bool _isPlaying = false;
  final player = AudioPlayer();

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: CircleAvatar(
            backgroundColor: AppColors.blackColor.withOpacity(0.2),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: context.dynamicHeight(0.02),
              color: AppColors.blackColor,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Now Playing',
          style: context.textTheme.titleLarge?.copyWith(),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: AppColors.blackColor.withOpacity(0.2),
              child: SvgPicture.asset(
                SvgConstants.settings.getSvg,
                colorFilter: const ColorFilter.mode(
                  AppColors.blackColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: context.paddingAllDefault,
          child: Column(
            children: [
              Padding(
                padding: context.paddingAllDefault,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.darkGreen,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              Text(
                'Surah Al-Fatiha',
                style: context.textTheme.titleLarge,
              ),
              Text(
                'Mishary Rashid Alafasy',
                style: context.textTheme.titleSmall,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: CircleAvatar(
                      backgroundColor: AppColors.blackColor.withOpacity(0.2),
                      child: SvgPicture.asset(
                        SvgConstants.musicSign.getSvg,
                        colorFilter: const ColorFilter.mode(
                          AppColors.blackColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: CircleAvatar(
                      backgroundColor: AppColors.blackColor.withOpacity(0.2),
                      child: SvgPicture.asset(
                        SvgConstants.heart.getSvg,
                        colorFilter: const ColorFilter.mode(
                          AppColors.blackColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: context.paddingVerticalHigh,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: CircleAvatar(
                        radius: context.dynamicHeight(0.035),
                        backgroundColor: AppColors.blackColor.withOpacity(0.2),
                        child: SvgPicture.asset(
                          SvgConstants.skipBack.getSvg,
                          colorFilter: const ColorFilter.mode(
                            AppColors.blackColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: _isPlaying
                          ? () {
                              setState(() {
                                _isPlaying = !_isPlaying;
                              });
                            }
                          : () async {
                              await player.play(
                                UrlSource(
                                  quran.getAudioURLBySurah(widget.surahIndex),
                                ),
                                volume: 1.0,
                              );
                              setState(() {
                                _isPlaying = !_isPlaying;
                              });
                            },
                      icon: CircleAvatar(
                        radius: context.dynamicHeight(0.06),
                        backgroundColor: AppColors.blackColor,
                        child: SvgPicture.asset(
                          _isPlaying
                              ? SvgConstants.pause.getSvg
                              : SvgConstants.play.getSvg,
                          colorFilter: const ColorFilter.mode(
                            AppColors.whiteColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: CircleAvatar(
                        radius: context.dynamicHeight(0.035),
                        backgroundColor: AppColors.blackColor.withOpacity(0.2),
                        child: SvgPicture.asset(
                          SvgConstants.skipFwd.getSvg,
                          colorFilter: const ColorFilter.mode(
                            AppColors.blackColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
