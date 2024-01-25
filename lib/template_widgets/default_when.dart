import 'package:boring_ui/dialog/custom_alert_dialog.dart';
import 'package:boring_ui/style/theme_color.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension DefaultWhen<T> on AsyncValue<T> {
  Widget defaultWhen(
      {required Widget Function(T entry) data,
      Widget Function(Object error, StackTrace stackTrace)? error}) {
    return when(
      data: data,
      error: error ?? (error, stackTrace) => Text(error.toString()),
      loading: () => Center(
        child: CustomLoader(
          color: mainColor,
        ),
      ),
    );
  }
}
