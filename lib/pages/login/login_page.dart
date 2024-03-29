import 'package:boring_ui/boring_ui.dart';
import 'package:flutter/material.dart';

class LoginPage extends BoringPage {
  static const String label = 'Login';
  static const String path = '/login';
  static const Icon icon = BIcon(BIcons.cake);

  @override
  bool get preventNavigationDisplay => true;

  @override
  bool get hideFromNavigation => true;

  @override
  Widget builder(BuildContext context, GoRouterState state) => LoginView(
        image: Image.asset(
          'assets/images/logo.png',
        ),
      );

  @override
  BoringNavigationEntry get navigationEntry =>
      BoringNavigationEntry(path, label: label, icon: icon);
}
