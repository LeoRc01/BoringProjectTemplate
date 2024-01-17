import 'package:boring_ui/boring_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_enterpriselayer/enterpriselayer/enterpriselayer.dart';

class BottomDrawer extends StatelessWidget {
  const BottomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: UniListPageGenerator(future: (limit, offset) {
        return EnterpriseLayer.auth.currentUser();
      }, builder: (context, snapshot) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
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
                const SizedBox(width: 10),
                Text(snapshot.data!.username),
              ],
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
        );
      }),
    );
  }
}
