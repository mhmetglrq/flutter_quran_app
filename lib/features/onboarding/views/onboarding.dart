import 'package:flutter/material.dart';
import 'package:flutter_quran_app/config/extensions/context_extension.dart';
import 'package:flutter_quran_app/config/items/app_colors.dart';
import 'package:flutter_quran_app/config/utility/enum/svg_enum.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGreen,
      body: Padding(
        padding: context.paddingAllDefault,
        child: Column(
          children: [
            SizedBox(height: context.height * 0.1),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: AppColors.containerGreen,
              ),
              child: SvgPicture.asset(
                SvgConstants.quran.getSvg,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: context.paddingVerticalDefault,
              child: Text(
                "Hafiz",
                style: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.lightGreen,
                  fontSize: context.dynamicHeight(0.045),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: context.dynamicWidth(0.7),
              child: Text(
                "Learn Quran and Recite everyday",
                style: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.whiteColor,
                  fontSize: context.dynamicHeight(0.034),
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: context.paddingVerticalDefault,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, "/home"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.whiteColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: context.dynamicWidth(0.07),
                    vertical: context.dynamicHeight(0.01),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Get Started",
                      style: context.textTheme.titleMedium?.copyWith(
                        color: AppColors.blackColor,
                        fontSize: context.dynamicHeight(0.025),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: context.dynamicWidth(0.02),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.blackColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
