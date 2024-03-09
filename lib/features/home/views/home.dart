import 'package:flutter/material.dart';
import 'package:flutter_quran_app/config/constants/menu_constants.dart';
import 'package:flutter_quran_app/config/extensions/context_extension.dart';
import 'package:flutter_quran_app/config/items/app_colors.dart';
import 'package:flutter_quran_app/config/utility/enum/svg_enum.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../widgets/menu_item_card.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final Box savedAyahs = Hive.box("savedAyahs");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hafiz"),
      ),
      body: SafeArea(
        child: Padding(
          padding: context.paddingAllDefault,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: context.paddingVerticalLow,
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
                    borderRadius: BorderRadiusDirectional.circular(23),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: context.paddingLeftDefault,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: context.paddingVerticalLow,
                              child: Text(
                                "Last Read",
                                style: context.textTheme.labelMedium?.copyWith(
                                  color: AppColors.whiteColor,
                                  fontSize: context.dynamicHeight(0.022),
                                ),
                              ),
                            ),
                            ValueListenableBuilder(
                                valueListenable: savedAyahs.listenable(),
                                builder: (context, value, child) {
                                  final surahNameArabic =
                                      savedAyahs.get("surahNameArabic");
                                  final surahNameTurkish =
                                      savedAyahs.get("surahNameTurkish");
                                  final ayahNumber =
                                      savedAyahs.get("ayahNumber");
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "$surahNameArabic - $surahNameTurkish",
                                        style: context.textTheme.labelMedium
                                            ?.copyWith(
                                          color: AppColors.whiteColor,
                                          fontSize:
                                              context.dynamicHeight(0.025),
                                        ),
                                      ),
                                      Text(
                                        "Ayah no.$ayahNumber",
                                        style: context.textTheme.labelMedium
                                            ?.copyWith(
                                          color: AppColors.whiteColor,
                                          fontSize:
                                              context.dynamicHeight(0.022),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                            Padding(
                              padding: context.paddingVerticalLow,
                              child: MaterialButton(
                                onPressed: () {},
                                color: AppColors.whiteColor,
                                textColor: AppColors.blackColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: context.paddingAllLow,
                                child: Row(
                                  children: [
                                    Text(
                                      "Continue",
                                      style: context.textTheme.labelMedium
                                          ?.copyWith(
                                        color: AppColors.blackColor,
                                        fontSize: context.dynamicHeight(0.022),
                                      ),
                                    ),
                                    Padding(
                                      padding: context.paddingLeftLow,
                                      child: const Icon(
                                        Icons.arrow_forward,
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SvgPicture.asset(
                        SvgConstants.quran.getSvg,
                        height: context.dynamicHeight(
                          0.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: context.paddingVerticalDefault,
                child: Text(
                  "Popular",
                  style: context.textTheme.titleMedium?.copyWith(
                    fontSize: context.dynamicHeight(0.025),
                  ),
                ),
              ),
              Expanded(
                child: GridView.custom(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverWovenGridDelegate.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    tileBottomSpace: 10,
                    pattern: [
                      const WovenGridTile(
                        1,
                        // crossAxisRatio: 0.9,
                        alignment: AlignmentDirectional.center,
                      ),
                      const WovenGridTile(
                        0.9,
                        alignment: AlignmentDirectional.topCenter,
                      ),
                    ],
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                      childCount: menuItems.length, (context, index) {
                    final item = menuItems[index];
                    return MenuItemCard(item: item);
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
