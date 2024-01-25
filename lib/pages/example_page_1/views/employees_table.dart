import 'package:boring_template/data/employees/employees_network_provider.dart';
import 'package:boring_template/pages/example_page_1/employees_page.dart';
import 'package:boring_ui/boring_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_enterpriselayer/enterpriselayer/human_research/employees/models/employee.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmployeesTable extends ConsumerWidget {
  const EmployeesTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BoringTable<Employee>.paginated(
      boringTableStyle: const BoringTableStyle(tableElevation: 0),
      onTap: (entry, context) {
        context.go('${EmployeesPage.path}/${entry.id}');
      },
      columns: [
        BoringColumn<Employee, String>(
          key: 'name',
          title: 'Nome',
          getValue: (entry) => entry.name,
          span: TableSpan(extent: FractionalTableSpanExtent(0.33)),
        ),
        BoringColumn<Employee, String>(
          key: 'surname',
          title: 'Cognome',
          getValue: (entry) => entry.surname,
          span: TableSpan(extent: FractionalTableSpanExtent(0.33)),
        ),
        BoringColumn<Employee, DateTime>(
          key: 'birthdate',
          title: 'Data di nascita',
          getValue: (entry) => entry.birthdate ?? DateTime.now(),
          displayValue: (value) => Text(
              value == null ? '-' : DateFormat('dd/MM/yyyy').format(value)),
          span: TableSpan(extent: FractionalTableSpanExtent(0.33)),
        ),
      ],
      fetchTableData: (({int limit, int offset}) range, String? lastPageKey,
          bool didRefresh) async {
        final emp = didRefresh
            ? await ref.refresh(employeeNetworkProvider(range).future)
            : await ref.watch(employeeNetworkProvider(range).future);

        return FetchTableDataResult(emp);
      },
      itemsPerPage: 20,
    );
  }
}
