import 'package:flutter/material.dart';
import 'package:flutter_quran_app/config/routes/app_route_names.dart';
import 'package:flutter_quran_app/features/home/views/home.dart';
import 'package:flutter_quran_app/features/onboarding/views/onboarding.dart';

class AppRouter {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.home:
        return _materialRoute(const Home());

      case AppRouteNames.surahDetail:
        return _materialRoute(const Home());
      case AppRouteNames.onboarding:
        return _materialRoute(const Onboarding());

      default:
        return _materialRoute(const Home());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
