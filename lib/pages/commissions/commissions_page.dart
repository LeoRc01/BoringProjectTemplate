import 'package:boring_template/pages/commissions/subpages/commission_details_page.dart';
import 'package:boring_template/pages/commissions/views/commissions_view.dart';
import 'package:boring_ui/boring_ui.dart';
import 'package:flutter/widgets.dart';

class CommissionsPage extends BoringPage {
  static const String label = 'Commesse';
  static const String path = '/commesse';
  static const Icon icon = BIcon(BIcons.cpu_setting);

  @override
  BoringNavigationEntry get navigationEntry =>
      BoringNavigationEntry(path, label: label, icon: icon);

  @override
  Widget builder(BuildContext context, GoRouterState state) =>
      CommissionsView();

  @override
  List<BoringPage> get subPages => [
        CommissionDetailsPage(),
      ];
}
