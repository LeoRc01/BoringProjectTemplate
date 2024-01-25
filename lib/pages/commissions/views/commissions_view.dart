import 'package:boring_template/pages/commissions/views/commissions_table.dart';
import 'package:flutter/widgets.dart';

class CommissionsView extends StatelessWidget {
  const CommissionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Expanded(child: CommissionsTable())],
    );
  }
}
