import 'dart:async';

import 'package:boring_template/template_widgets/cache_for_extension.dart';
import 'package:flutter_enterpriselayer/enterpriselayer/commissions/commissions_endpoints.dart';
import 'package:flutter_enterpriselayer/enterpriselayer/enterpriselayer.dart';
import 'package:flutter_enterpriselayer/enterpriselayer/human_research/employees/models/employee.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef DataRange = ({int limit, int offset});

final employeeNetworkProvider = AsyncNotifierProvider.autoDispose
    .family<EmployeeNotifier, List<Employee>, DataRange?>(EmployeeNotifier.new);

class EmployeeNotifier
    extends AutoDisposeFamilyAsyncNotifier<List<Employee>, DataRange?> {
  static DataRange? oldArg;

  @override
  FutureOr<List<Employee>> build(DataRange? arg) {
    EmployeeNotifier.oldArg = arg;

    ref.cacheFor(const Duration(minutes: 2));

    return EnterpriseLayer.employeesApi.getEmployees(
        limit: oldArg?.limit, offset: oldArg?.offset, order: Order.desc);
  }

  Future<Employee> addEmployee(Employee employee) async {
    final createdEmp =
        await EnterpriseLayer.employeesApi.postEmployee(employee);
    final previousState = await future;

    state = AsyncData([createdEmp, ...previousState]);
    ref.notifyListeners();
    return createdEmp;
  }

  void swapEmployee(Employee employee) {
    if ((state.value == null || state.value!.isEmpty)) {
      return;
    }

    final indexOfEmp =
        (state.value ?? []).indexWhere((element) => element.id == employee.id);

    if (indexOfEmp != -1) {
      state.value![indexOfEmp] = employee;
    }
    ref.notifyListeners();
  }
}
