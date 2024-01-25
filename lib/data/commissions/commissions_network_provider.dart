import 'dart:async';

import 'package:boring_template/template_widgets/cache_for_extension.dart';
import 'package:flutter_enterpriselayer/enterpriselayer/commissions/models/commission.dart';
import 'package:flutter_enterpriselayer/enterpriselayer/enterpriselayer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataFilters {
  int? limit;
  int? offset;
  String? relationshipKey;
  List<String>? relationshipValues;

  DataFilters({
    this.limit,
    this.offset,
    this.relationshipKey,
    this.relationshipValues,
  });
}

final commissionNetworkProvider = AsyncNotifierProvider.autoDispose
    .family<CommissionsNetworkProvider, List<Commission>, DataFilters?>(
        CommissionsNetworkProvider.new);

class CommissionsNetworkProvider
    extends AutoDisposeFamilyAsyncNotifier<List<Commission>, DataFilters?> {
  @override
  FutureOr<List<Commission>> build(DataFilters? arg) async {
    ref.cacheFor(const Duration(minutes: 4));

    return EnterpriseLayer.commissionsApi
        .getCommissions(limit: arg?.limit, offset: arg?.offset);
  }
}
