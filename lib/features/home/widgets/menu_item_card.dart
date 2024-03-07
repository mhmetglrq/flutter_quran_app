import 'package:flutter/material.dart';
import 'package:flutter_quran_app/config/extensions/context_extension.dart';
import 'package:flutter_quran_app/config/utility/enum/svg_enum.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuItemCard extends StatelessWidget {
  const MenuItemCard({
    super.key,
    required this.item,
  });

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.pushNamed(context, item["route"]);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: item["color"],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: SvgPicture.asset(
                SvgConstants.cardBottom.getSvg,
                width: context.dynamicWidth(1),
                alignment: AlignmentDirectional.bottomCenter,
                colorFilter: ColorFilter.mode(
                  item["bottomColor"],
                  BlendMode.srcIn,
                ),
              ),
            ),
            Padding(
              padding: context.paddingAllLow,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      item["title"],
                      style: context.textTheme.titleMedium?.copyWith(
                        fontSize: context.dynamicHeight(0.025),
                      ),
                    ),
                  ),
                  Container(
                    padding: context.paddingAllLow,
                    alignment: Alignment.bottomRight,
                    child: SvgPicture.asset(
                      item["svgPath"],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
