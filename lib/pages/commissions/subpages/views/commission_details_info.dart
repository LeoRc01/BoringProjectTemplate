import 'package:boring_template/data/commissions/commission_details_network_provider.dart';
import 'package:boring_template/template_widgets/default_when.dart';
import 'package:boring_ui/boring_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/customers/customer_details_network_provider.dart';

class CommissionDetailsInfo extends ConsumerWidget {
  const CommissionDetailsInfo({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commissionAsyncValue =
        ref.watch(commissionDetailsNetworkProvider(id));

    return commissionAsyncValue.defaultWhen(
      data: (entry) {
        final customerAsyncValue =
            ref.watch(customerDetailsNetworkProvider(entry.customer));

        return Row(
          children: [
            Text(entry.id),
            Text(entry.name ?? 'aaa'),
            customerAsyncValue.defaultWhen(
              data: (entry) => Text(entry.completeName),
              error: (error, stackTrace) => Text('cliente non trovato'),
            )
          ],
        );
      },
    );
  }
}
