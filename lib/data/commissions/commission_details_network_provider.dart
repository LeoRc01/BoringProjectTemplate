import 'dart:async';

import 'package:boring_template/template_widgets/cache_for_extension.dart';
import 'package:flutter_enterpriselayer/enterpriselayer/commissions/models/commission.dart';
import 'package:flutter_enterpriselayer/enterpriselayer/enterpriselayer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final commissionDetailsNetworkProvider = AsyncNotifierProvider.autoDispose
    .family<CommissionDetailsNetworkProvider, Commission, String>(
        CommissionDetailsNetworkProvider.new);

class CommissionDetailsNetworkProvider
    extends AutoDisposeFamilyAsyncNotifier<Commission, String> {
  @override
  FutureOr<Commission> build(String arg) async {
    ref.cacheFor(const Duration(minutes: 4));

    return EnterpriseLayer.commissionsApi.getCommission(arg);
  }
}
