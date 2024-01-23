import 'package:boring_template/pages/example_page_1/views/example_view.dart';
import 'package:boring_ui/boring_ui.dart';
import 'package:flutter/cupertino.dart';

class ExamplePage extends BoringPage {
  static const String label = 'Example';
  static const String path = '/example';
  static const Icon icon = BIcon(BIcons.cake);

  @override
  Widget builder(BuildContext context, GoRouterState state) =>
      const ExampleView();

  @override
  BoringNavigationEntry get navigationEntry =>
      BoringNavigationEntry(path, label: label, icon: icon);
}
