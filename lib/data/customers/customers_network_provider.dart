import 'dart:async';

import 'package:boring_template/template_widgets/cache_for_extension.dart';
import 'package:flutter_enterpriselayer/enterpriselayer/crm/parties/models/party.dart';
import 'package:flutter_enterpriselayer/enterpriselayer/crm/parties/models/party_type.dart';
import 'package:flutter_enterpriselayer/enterpriselayer/enterpriselayer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final customersNetworkProvider = AsyncNotifierProvider.autoDispose
    .family<CustomersNetworkProvider, List<Party>, List<int>>(
        CustomersNetworkProvider.new);

class CustomersNetworkProvider
    extends AutoDisposeFamilyAsyncNotifier<List<Party>, List<int>> {
  @override
  FutureOr<List<Party>> build(List<int> arg) {
    ref.cacheFor(const Duration(minutes: 1));
    return EnterpriseLayer.partiesEndpoints
        .getParties(partyType: PartyType.customer, ids: arg);
  }
}
