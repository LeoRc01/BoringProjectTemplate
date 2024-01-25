import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

extension CacheForExtension on AutoDisposeRef<Object?> {
  void cacheFor(Duration duration) {
    // Immediately prevent the state from getting destroyed.
    final link = keepAlive();
    // After duration has elapsed, we re-enable automatic disposal.
    final timer = Timer(duration, link.close);

    // Optional: when the provider is recomputed (such as with ref.watch),
    // we cancel the pending timer.
    onDispose(timer.cancel);
  }
}
