import 'package:boring_ui/boring_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_enterpriselayer/enterpriselayer/enterpriselayer.dart';
import 'package:flutter_enterpriselayer/enterpriselayer/human_research/employees/models/employee.dart';

class ExampleView extends StatelessWidget {
  const ExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BoringTable<Employee>.paginated(
            boringTableStyle: const BoringTableStyle(tableElevation: 0),
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
                displayValue: (value) => Text(value == null
                    ? '-'
                    : DateFormat('dd/MM/yyyy').format(value)),
                span: TableSpan(extent: FractionalTableSpanExtent(0.33)),
              ),
            ],
            fetchTableData: (({int limit, int offset}) range,
                String? lastPageKey, bool didRefresh) async {
              final emp = await EnterpriseLayer.employeesApi
                  .getEmployees(limit: range.limit, offset: range.offset);
              return FetchTableDataResult(emp);
            },
            itemsPerPage: 50,
          ),
        ),
      ],
    );
  }
}
