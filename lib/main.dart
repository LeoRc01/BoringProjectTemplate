import 'package:boring_ui/boring_ui.dart';

import 'app.dart';

void main() async {
  MainInitializer.initializeApp(
      projectEnterpriseLayerApiKey: '6ce1ef60-ce03-4363-8e29-5c1c02bdf257',
      mainApp: const App(),
      firstColor: '41AB34',
      secondaryColor: '97db8f',
      setPathUrlStrategyFlag: false);
}
