import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'package:testing_demo/main.dart';

void main() {
  testGoldens('Counter devices test', (WidgetTester tester) async {
    await loadAppFonts();
    final deviceBuilder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
        Device.iphone11,
        Device.tabletPortrait,
        Device.tabletLandscape,
      ])
      ..addScenario(widget: MyApp());
    await tester.pumpDeviceBuilder(deviceBuilder);
    await screenMatchesGolden(tester, 'my_app');
  });

  testGoldens('Counter multi screen', (WidgetTester tester) async {
    await tester.pumpWidgetBuilder(MyApp());
    await multiScreenGolden(tester, 'multi_screen');
  });
}
