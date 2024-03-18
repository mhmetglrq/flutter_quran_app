import 'package:flutter/material.dart';
import 'package:flutter_quran_app/config/extensions/context_extension.dart';

class Listening extends StatelessWidget {
  const Listening({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: context.paddingAllDefault,
          child: const Text('Listening'),
        ),
      ),
    );
  }
}
