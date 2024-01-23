import 'package:flutter/material.dart';

class BoringDrawerHeader extends StatelessWidget {
  const BoringDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Image.asset(
        'assets/images/logo.png',
      ),
    );
  }
}
