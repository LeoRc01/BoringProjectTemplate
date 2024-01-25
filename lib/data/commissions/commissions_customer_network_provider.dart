import 'dart:async';

import 'package:boring_template/data/commissions/commissions_network_provider.dart';
import 'package:boring_template/data/customers/customers_network_provider.dart';
import 'package:boring_template/template_widgets/cache_for_extension.dart';
import 'package:flutter_enterpriselayer/enterpriselayer/commissions/models/commission.dart';
import 'package:flutter_enterpriselayer/enterpriselayer/crm/parties/models/party.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../employees/employees_network_provider.dart';

class CommissionHybrid {
  Commission commission;
  Party? customer;

  CommissionHybrid({
    required this.commission,
    required this.customer,
  });
}

final commissionsCustomerNetworkProvider = AsyncNotifierProvider.autoDispose
    .family<CommissionsCustomerNetworkProvider, List<CommissionHybrid>,
        DataRange?>(CommissionsCustomerNetworkProvider.new);

class CommissionsCustomerNetworkProvider
    extends AutoDisposeFamilyAsyncNotifier<List<CommissionHybrid>, DataRange?> {
  @override
  FutureOr<List<CommissionHybrid>> build(DataRange? arg) async {
    ref.cacheFor(const Duration(minutes: 1));

    final commissions = await ref.watch(commissionNetworkProvider(null).future);

    final ids = commissions.map((e) => e.customer).toSet().toList();

    final customers = await ref.watch(customersNetworkProvider(ids).future);

    print(customers);

    return commissions
        .map((e) => CommissionHybrid(
            commission: e,
            customer: customers
                .firstWhereOrNull((element) => element.id == e.customer)))
        .toList();
  }
}

extension FirstWhereOrNull<T> on List<T> {
  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}
