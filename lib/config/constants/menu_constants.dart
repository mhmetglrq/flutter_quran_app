import 'package:flutter_quran_app/config/items/app_colors.dart';
import 'package:flutter_quran_app/config/routes/app_route_names.dart';
import 'package:flutter_quran_app/config/utility/enum/svg_enum.dart';

List<Map<String, dynamic>> menuItems = [
  {
    "title": "Quran",
    "svgPath": SvgConstants.quranCard.getSvg,
    "color": AppColors.quranCardColor,
    "bottomColor": AppColors.quranCardBottomColor,
    "route": AppRouteNames.quranPage,
  },
  {
    "title": "Listening",
    "svgPath": SvgConstants.headset.getSvg,
    "color": AppColors.listeningCardColor,
    "bottomColor": AppColors.listeningCardBottomColor,
    "route": AppRouteNames.surahListening,
  },
  {
    "title": "Test",
    "svgPath": SvgConstants.test.getSvg,
    "color": AppColors.testCardColor,
    "bottomColor": AppColors.testCardBottomColor,
    "route": "/test",
  },
  {
    "title": "Recite",
    "svgPath": SvgConstants.tasbee.getSvg,
    "color": AppColors.reciteCardColor,
    "bottomColor": AppColors.reciteCardBottomColor,
    "route": "/tasbee",
  },
];
