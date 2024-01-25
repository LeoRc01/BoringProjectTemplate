import 'package:boring_template/data/commissions/commissions_network_provider.dart';
import 'package:boring_template/data/employees/employee_details_network_provider.dart';
import 'package:boring_template/template_widgets/default_when.dart';
import 'package:boring_ui/boring_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as r;

class EmployeeDetailsView extends StatelessWidget {
  EmployeeDetailsView({required this.argument});

  final int argument;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: EmployeeDetailsInfo(
            employeeId: argument,
          ),
        ),
        Expanded(
          child: EmployeeDetailsCommissions(),
        ),
      ],
    );
  }
}

class EmployeeDetailsInfo extends r.ConsumerWidget {
  const EmployeeDetailsInfo({super.key, required this.employeeId});

  final int employeeId;

  @override
  Widget build(BuildContext context, r.WidgetRef ref) {
    return ref.watch(employeeDetailsNetworkProvider(employeeId)).defaultWhen(
        data: (data) {
      appBarNotifier.value.breadcrumbs = [data.nameAndSurname];

      appBarNotifier.setNotificationPostFrame();

      return Text(data.nameAndSurname);
    });
  }
}

class EmployeeDetailsCommissions extends r.ConsumerWidget {
  const EmployeeDetailsCommissions({super.key});

  @override
  Widget build(BuildContext context, r.WidgetRef ref) {
    return ref.watch(commissionNetworkProvider(null)).defaultWhen(
          data: (data) => ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Text(data[index].id);
            },
            itemCount: data.length,
          ),
        );
  }
}
