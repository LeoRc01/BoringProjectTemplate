import 'package:boring_template/data/employees/employees_network_provider.dart';
import 'package:boring_template/pages/example_page_1/views/employees_table.dart';
import 'package:boring_ui/drawer/app_bar_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_enterpriselayer/enterpriselayer/human_research/employees/models/employee.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmployeesView extends ConsumerWidget {
  const EmployeesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    appBarNotifier.value.actions = [
      FilledButton(
        onPressed: () {
          final emp = Employee(
            name: 'LEO',
            surname: "DE SIMONE",
          );

          ref.read(employeeNetworkProvider(null).notifier).addEmployee(emp);
        },
        child: Text('Press me to create EMPLOYEE'),
      ),
    ];

    appBarNotifier.setNotificationPostFrame();

    return Column(
      children: [
        Expanded(
          child: EmployeesTable(),
        ),
      ],
    );
  }
}
