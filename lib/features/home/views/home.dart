import 'package:flutter/material.dart';
import 'package:flutter_quran_app/config/extensions/context_extension.dart';
import 'package:flutter_quran_app/config/items/app_colors.dart';
import 'package:flutter_quran_app/config/utility/enum/svg_enum.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ةحتافلا",
                                  style:
                                      context.textTheme.labelMedium?.copyWith(
                                    color: AppColors.whiteColor,
                                    fontSize: context.dynamicHeight(0.025),
                                  ),
                                ),
                                Text(
                                  "Ayah no. 1",
                                  style:
                                      context.textTheme.labelMedium?.copyWith(
                                    color: AppColors.whiteColor,
                                    fontSize: context.dynamicHeight(0.022),
                                  ),
                                ),
                              ],
                            ),
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
                  gridDelegate: SliverWovenGridDelegate.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    tileBottomSpace: 10,
                    pattern: [
                      const WovenGridTile(1),
                      const WovenGridTile(
                        1,
                        crossAxisRatio: 0.9,
                        alignment: AlignmentDirectional.centerEnd,
                      ),
                    ],
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                    childCount: 4,
                    (context, index) => Container(
                      color: AppColors.darkGreen,
                      child: Text(index.toString()),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
