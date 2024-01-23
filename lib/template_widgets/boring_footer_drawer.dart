import 'package:boring_ui/boring_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_enterpriselayer/enterpriselayer/enterpriselayer.dart';

class BoringDrawerFooter extends StatelessWidget {
  BoringDrawerFooter({super.key});

  final grey = Colors.grey.shade200;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                UniChip(
                  primaryColor: green,
                  child: const BIcon(
                    BIcons.user,
                  ),
                  onPressed: () async {
                    context.go('/profile');
                  },
                ),
                UniChip(
                  primaryColor: blue,
                  child: const BIcon(
                    BIcons.logout,
                  ),
                  onPressed: () async {
                    CustomAlertDialog(
                      dialogTitle: '_warning',
                      dialogContentText: '_logoutWarning',
                      confirmTitleButton: '_logout',
                      unConfirmTitleButton: '_annulla',
                      haveConfirmButton: true,
                      haveUnConfirmButton: true,
                      popAfterPress: true,
                      onPressedConfirmButton: () {
                        EnterpriseLayer.auth.logout();
                      },
                    ).showCustomDialog(context);
                  },
                ),
              ],
            ),
            Divider(color: grey),
            const _AppVersion(),
          ],
        ));
  }
}

class _AppVersion extends StatelessWidget {
  const _AppVersion({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'BoringStuff © - ${'_appVersion'.tr()}',
      style: TextStyle(color: Colors.grey.shade500),
    );

    /*
    return FutureBuilder(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        return Text(
          'BoringStuff © - ${snapshot.hasData ? snapshot.data!.version : ''}',
          //'BoringStuff © - $appVersion',
          style: TextStyle(color: Colors.grey.shade500),
        );
      },
    );
    */
  }
}
