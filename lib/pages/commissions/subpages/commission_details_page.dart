import 'package:boring_template/pages/commissions/subpages/views/commission_details_info.dart';
import 'package:boring_ui/boring_ui.dart';
import 'package:flutter/cupertino.dart';

class CommissionDetailsPage extends BoringPage {
  final String path = ':id';

  @override
  Widget builder(BuildContext context, GoRouterState state) {
    return Column(
      children: [
        CommissionDetailsInfo(
          id: state.pathParameters['id'] as String,
        ),
      ],
    );
  }

  @override
  BoringNavigationEntry get navigationEntry => BoringNavigationEntry(path);
}
