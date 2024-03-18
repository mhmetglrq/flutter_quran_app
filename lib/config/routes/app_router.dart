import 'package:flutter/material.dart';
import 'package:flutter_quran_app/config/routes/app_route_names.dart';
import 'package:flutter_quran_app/features/home/views/home.dart';
import 'package:flutter_quran_app/features/onboarding/views/onboarding.dart';
import 'package:flutter_quran_app/features/quran/views/surah_detail.dart';
import 'package:flutter_quran_app/features/quran/views/surah_page.dart';

import '../../features/listening/views/listening.dart';

class AppRouter {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.home:
        return _materialRoute(Home());

      case AppRouteNames.surahDetail:
        final args = settings.arguments as Map<String, dynamic>;
        final surahIndex = args['surahIndex'] as int;
        return _materialRoute(
          SurahDetail(surahIndex: surahIndex),
        );
      case AppRouteNames.onboarding:
        return _materialRoute(const Onboarding());
      case AppRouteNames.quranPage:
        return _materialRoute(const SurahPage());

      case AppRouteNames.listening:
        return _materialDialogRoute(const Listening());

      default:
        return _materialRoute(Home());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }

  static Route<dynamic> _materialBottomSheetRoute(Widget view) {
    return MaterialPageRoute(
      builder: (_) => view,
      fullscreenDialog: true,
    );
  }

  static Route<dynamic> _materialDialogRoute(Widget view) {
    return MaterialPageRoute(
      
      builder: (_) => view,
      fullscreenDialog: true,
    );
  }
}
