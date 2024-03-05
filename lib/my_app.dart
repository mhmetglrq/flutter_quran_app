import 'package:flutter/material.dart';
import 'package:flutter_quran_app/config/routes/app_route_names.dart';
import 'package:flutter_quran_app/config/routes/app_router.dart';
import 'package:flutter_quran_app/config/theme/app_theme.dart';
import 'package:flutter_quran_app/features/home/views/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quran',
      theme: AppTheme.lightTheme,
      home: const Home(),
      initialRoute: AppRouteNames.onboarding,
      onGenerateRoute: AppRouter.onGenerateRoutes,
    );
  }
}
