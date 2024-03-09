import 'package:flutter/material.dart';
import 'package:flutter_quran_app/config/extensions/context_extension.dart';
import 'package:flutter_quran_app/config/items/app_colors.dart';
import 'package:flutter_quran_app/config/routes/app_route_names.dart';
import 'package:flutter_quran_app/config/utility/enum/svg_enum.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran/quran.dart' as quran;


class SurahItem extends StatelessWidget {
  const SurahItem({
    super.key,
    required this.surahIndex,
  });
  final int surahIndex;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      surfaceTintColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
        leading: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(SvgConstants.surahIndex.getSvg),
            Text(
              (surahIndex + 1).toString(),
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: context.dynamicHeight(0.02),
              ),
            ),
          ],
        ),
        title: Text(
          quran.getSurahNameTurkish(surahIndex + 1),
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: context.dynamicHeight(0.025),
          ),
        ),
        subtitle: Text(
          quran.getSurahNameEnglish(surahIndex + 1),
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: context.dynamicHeight(0.02),
          ),
        ),
        trailing: Text(
          quran.getSurahNameArabic(surahIndex + 1),
          textDirection: TextDirection.rtl,
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: context.dynamicHeight(0.03),
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, AppRouteNames.surahDetail,
              arguments: {'surahIndex': surahIndex + 1});
        },
      ),
    );
  }
}
