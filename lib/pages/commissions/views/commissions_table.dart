import 'package:boring_template/data/commissions/commissions_customer_network_provider.dart';
import 'package:boring_template/pages/commissions/commissions_page.dart';
import 'package:boring_ui/boring_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommissionsTable extends ConsumerWidget {
  const CommissionsTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BoringTable<CommissionHybrid>.paginated(
      onTap: (entry, context) {
        context.go('${CommissionsPage.path}/${entry.commission.id}');
      },
      columns: [
        BoringColumn<CommissionHybrid, String>(
          key: 'id',
          getValue: (entry) => entry.commission.id,
          span: const TableSpan(extent: FractionalTableSpanExtent(.5)),
        ),
        BoringColumn<CommissionHybrid, String>(
          key: 'customer',
          getValue: (entry) => entry.customer?.completeName ?? 'EEEE',
          span: const TableSpan(extent: FractionalTableSpanExtent(.5)),
        ),
      ],
      fetchTableData: (range, lastPageKey, didRefresh) async {
        final res = didRefresh
            ? await ref
                .refresh(commissionsCustomerNetworkProvider(range).future)
            : await ref.watch(commissionsCustomerNetworkProvider(range).future);

        return FetchTableDataResult(res);
      },
      itemsPerPage: 50,
    );
  }
}
