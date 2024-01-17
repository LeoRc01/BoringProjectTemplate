import 'package:boring_template/views/example_view/example_table.dart';
import 'package:boring_ui/drawer/app_bar_notifier.dart';
import 'package:flutter/material.dart';

class ExampleList extends StatelessWidget {
  const ExampleList({super.key});

  @override
  Widget build(BuildContext context) {
    appBarNotifier.value.actions = [
      FilledButton(
          onPressed: () {
            print('ew don\'t touch me');
          },
          child: Text('Touch me'))
    ];

    appBarNotifier.setNotificationPostFrame();
    return const ExampleTable();
  }
}
