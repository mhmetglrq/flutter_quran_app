import 'package:flutter/material.dart';
import 'package:flutter_quran_app/config/extensions/context_extension.dart';
import 'package:flutter_quran_app/config/items/app_colors.dart';
import 'package:flutter_quran_app/config/utility/enum/svg_enum.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/quran.dart' as quran;

class SurahDetail extends StatelessWidget {
  const SurahDetail({super.key, required this.surahIndex});
  final int surahIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          quran.getSurahNameTurkish(surahIndex),
        ),
      ),
      body: Padding(
        padding: context.paddingAllDefault,
        child: Column(
          children: [
            AspectRatio(
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
                      quran.getSurahNameTurkish(surahIndex),
                      style: context.textTheme.labelMedium?.copyWith(
                        fontSize: context.dynamicHeight(0.04),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      quran.getSurahNameEnglish(surahIndex),
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
                          "${quran.getPlaceOfRevelation(surahIndex)} ",
                          style: context.textTheme.labelMedium?.copyWith(
                            fontSize: context.dynamicHeight(0.02),
                          ),
                        ),
                        Text(
                          "◉ ${quran.getVerseCount(surahIndex)} Verses",
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
            Padding(
              padding: context.paddingVerticalLow,
              child: Card(
                elevation: 5,
                surfaceTintColor: AppColors.whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: AppColors.darkGreen,
                    child: Text(
                      (surahIndex + 1).toString(),
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
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
                              SvgPicture.asset(SvgConstants.quranCard.getSvg)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
