import 'package:boring_ui/boring_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_enterpriselayer/enterpriselayer/enterpriselayer.dart';
import 'package:flutter_enterpriselayer/enterpriselayer/human_research/employees/models/employee.dart';

class ExampleTable extends StatelessWidget {
  const ExampleTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BoringTable<Employee>.infiniteScroll(
      columns: [
        BoringColumn<Employee, String>(
          key: 'name',
          getValue: (entry) => entry.name,
          span: const TableSpan(extent: FractionalTableSpanExtent(.33)),
        ),
        BoringColumn<Employee, String>(
          key: 'surname',
          getValue: (entry) => entry.surname,
          span: const TableSpan(extent: FractionalTableSpanExtent(.33)),
        ),
        BoringColumn<Employee, String>(
          key: 'birthdate',
          getValue: (entry) => entry.birthdate != null
              ? DateFormat('dd/MM/yyyy').format(entry.birthdate!)
              : '-',
          span: const TableSpan(extent: RemainingTableSpanExtent()),
        ),
      ],
      fetchTableData: (range, lastPageKey, didRefresh) async {
        final employees = await EnterpriseLayer.employeesApi
            .getEmployees(limit: range.limit, offset: range.offset);

        return FetchTableDataResult(employees);
      },
      boringTableStyle: BoringTableStyle(
          tableElevation: 0,
          tableSurfaceColor: Colors.white,
          tableTitle: 'This is the example table!',
          filterChipThemeData: Theme.of(context)
              .chipTheme
              .copyWith(side: BorderSide(color: mainColor)),
          tableTitleStyle: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.w600)),
      //boringTableStyle: BoringTableStyle(),
      itemsPerPage: 100,
    );
  }
}
