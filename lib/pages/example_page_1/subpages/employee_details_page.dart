import 'package:boring_template/pages/example_page_1/subpages/views/employee_details_view.dart';
import 'package:boring_ui/boring_ui.dart';
import 'package:flutter/cupertino.dart';

class EmployeeDetailsPage extends BoringPage {
  static const String path = ':id';

  @override
  bool get hideFromNavigation => true;

  @override
  Widget builder(BuildContext context, GoRouterState state) {
    final id = int.tryParse(state.pathParameters['id'] as String);

    if (id == null) {
      return Text('ERRORREEE');
    }

    return EmployeeDetailsView(argument: id);
  }

  @override
  BoringNavigationEntry get navigationEntry => BoringNavigationEntry(path);
}
