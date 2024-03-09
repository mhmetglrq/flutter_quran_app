import 'package:flutter/material.dart';
import 'package:flutter_quran_app/config/extensions/context_extension.dart';
import 'package:flutter_quran_app/config/items/app_colors.dart';
import 'package:flutter_quran_app/config/utility/enum/svg_enum.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran/quran.dart' as quran;

class VerseItem extends StatelessWidget {
  const VerseItem({
    super.key,
    required bool isPlaying,
    required int currentVerse,
    required this.surahIndex,
    required this.index,
    this.onPressed,
  })  : _isPlaying = isPlaying,
        _currentVerse = currentVerse;

  final bool _isPlaying;
  final int _currentVerse;
  final int surahIndex;
  final int index;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  (index + 1).toString(),
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
                    icon: SvgPicture.asset(SvgConstants.share.getSvg),
                  ),
                  IconButton(
                    onPressed: onPressed,
                    icon: SvgPicture.asset(
                        _isPlaying && _currentVerse == index + 1
                            ? SvgConstants.pause.getSvg
                            : SvgConstants.play.getSvg),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(SvgConstants.bookmark.getSvg),
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
            quran.getVerse(surahIndex, index + 1, verseEndSymbol: true),
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
              surahIndex,
              index + 1,
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
    );
  }
}
