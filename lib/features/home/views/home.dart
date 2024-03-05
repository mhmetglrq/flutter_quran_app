import 'package:flutter/material.dart';
import 'package:flutter_quran_app/config/extensions/context_extension.dart';
import 'package:flutter_quran_app/config/items/app_colors.dart';
import 'package:flutter_quran_app/config/utility/enum/svg_enum.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            children: [
              Container(
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
                            child: const Text("Last Read"),
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("ةحتافلا"),
                              Text("Ayah no. 1"),
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
                              child: const Row(
                                children: [
                                  Text("Continue Reading"),
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
                        0.25,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: context.paddingVerticalLow,
                child: Text(
                  "Popular",
                  style: context.textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
