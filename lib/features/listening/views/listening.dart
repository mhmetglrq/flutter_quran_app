import 'package:flutter/material.dart';
import 'package:flutter_quran_app/config/extensions/context_extension.dart';
import 'package:flutter_quran_app/config/items/app_colors.dart';
import 'package:flutter_quran_app/config/utility/enum/svg_enum.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Listening extends StatelessWidget {
  const Listening({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: CircleAvatar(
            backgroundColor: AppColors.whiteColor.withOpacity(0.2),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.whiteColor,
              size: context.dynamicHeight(0.02),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Now Playing',
          style: context.textTheme.titleLarge?.copyWith(
            color: AppColors.whiteColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              SvgConstants.settings.getSvg,
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
                style: context.textTheme.titleLarge?.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
              Text(
                'Mishary Rashid Alafasy',
                style: context.textTheme.titleSmall?.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: CircleAvatar(
                      backgroundColor: AppColors.whiteColor.withOpacity(0.2),
                      child: SvgPicture.asset(
                        SvgConstants.musicSign.getSvg,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: CircleAvatar(
                      backgroundColor: AppColors.whiteColor.withOpacity(0.2),
                      child: SvgPicture.asset(
                        SvgConstants.heart.getSvg,
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
                        backgroundColor: AppColors.whiteColor.withOpacity(0.2),
                        child: SvgPicture.asset(
                          SvgConstants.skipBack.getSvg,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: CircleAvatar(
                        radius: context.dynamicHeight(0.06),
                        backgroundColor: AppColors.whiteColor,
                        child: SvgPicture.asset(SvgConstants.pause.getSvg,
                            colorFilter: const ColorFilter.mode(
                              AppColors.blackColor,
                              BlendMode.srcIn,
                            )),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: CircleAvatar(
                        radius: context.dynamicHeight(0.035),
                        backgroundColor: AppColors.whiteColor.withOpacity(0.2),
                        child: SvgPicture.asset(
                          SvgConstants.skipFwd.getSvg,
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
