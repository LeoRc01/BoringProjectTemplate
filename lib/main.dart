import 'package:boring_ui/boring_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

void main() async {
  MainInitializer.initializeApp(
    projectEnterpriseLayerApiKey: '8e2a1ec4-e1f8-46a8-a62b-da029781cd59',
    //projectEnterpriseLayerApiKey: '6ce1ef60-ce03-4363-8e29-5c1c02bdf257',
    mainApp: const App(),
    firstColor: '41AB34',
    secondaryColor: '97db8f',
    setPathUrlStrategyFlag: false,

    appWrapper: (child) => ProviderScope(
      child: child,
    ),
  );
}
