import 'dart:async';

import 'package:boring_template/template_widgets/cache_for_extension.dart';
import 'package:flutter_enterpriselayer/enterpriselayer/crm/parties/models/party.dart';
import 'package:flutter_enterpriselayer/enterpriselayer/enterpriselayer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final customerDetailsNetworkProvider = AsyncNotifierProvider.autoDispose
    .family<CustomerDetailsNetworkProvider, Party, int>(
        CustomerDetailsNetworkProvider.new);

class CustomerDetailsNetworkProvider
    extends AutoDisposeFamilyAsyncNotifier<Party, int> {
  @override
  FutureOr<Party> build(int arg) {
    ref.cacheFor(const Duration(minutes: 1));
    return EnterpriseLayer.partiesEndpoints.getParty(arg);
  }
}
