import 'package:boring_template/views/example_view/example_list.dart';
import 'package:boring_ui/boring_ui.dart';
import 'package:flutter/cupertino.dart';

class ExampleViewPage extends BoringPage {
  static const String label = 'Example';
  static const String path = '/example';
  static const Icon icon = BIcon(BIcons.cake);

  @override
  Widget builder(BuildContext context, GoRouterState state) => ExampleList();

  @override
  BoringNavigationEntry get navigationEntry =>
      BoringNavigationEntry(path, label: label, icon: icon);
}
