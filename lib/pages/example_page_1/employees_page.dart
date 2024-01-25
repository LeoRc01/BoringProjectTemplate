import 'package:boring_template/pages/example_page_1/subpages/employee_details_page.dart';
import 'package:boring_template/pages/example_page_1/views/employees_view.dart';
import 'package:boring_ui/boring_ui.dart';
import 'package:flutter/cupertino.dart';

class EmployeesPage extends BoringPage {
  static const String label = 'Dipendenti';
  static const String path = '/dipendenti';
  static const Icon icon = BIcon(BIcons.personalcard);

  @override
  List<BoringPage> get subPages => [EmployeeDetailsPage()];

  @override
  Widget builder(BuildContext context, GoRouterState state) =>
      const EmployeesView();

  @override
  BoringNavigationEntry get navigationEntry =>
      BoringNavigationEntry(path, label: label, icon: icon);
}
