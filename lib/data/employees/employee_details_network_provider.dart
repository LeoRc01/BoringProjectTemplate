import 'dart:async';

import 'package:boring_template/data/employees/employees_network_provider.dart';
import 'package:boring_template/template_widgets/cache_for_extension.dart';
import 'package:flutter_enterpriselayer/enterpriselayer/enterpriselayer.dart';
import 'package:flutter_enterpriselayer/enterpriselayer/human_research/employees/models/employee.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final employeeDetailsNetworkProvider = AsyncNotifierProvider.autoDispose
    .family<EmployeeDetailsNetworkProvider, Employee, int>(
        EmployeeDetailsNetworkProvider.new);

class EmployeeDetailsNetworkProvider
    extends AutoDisposeFamilyAsyncNotifier<Employee, int> {
  @override
  FutureOr<Employee> build(int arg) async {
    ref.cacheFor(const Duration(minutes: 1));

    await Future.delayed(const Duration(seconds: 2));

    return EnterpriseLayer.employeesApi.getEmployee(arg,
        includeMetaData: true, includeContacts: true, includeDocuments: true);
  }

  Future<void> updateEmployee(Employee updatedEmployee) async {
    final emp = await EnterpriseLayer.employeesApi
        .updateEmployee(updatedEmployee.id, updatedEmployee);

    state = AsyncData(emp);

    ref
        .read(employeeNetworkProvider(EmployeeNotifier.oldArg).notifier)
        .swapEmployee(updatedEmployee);
  }
}
