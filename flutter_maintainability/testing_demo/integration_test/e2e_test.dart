import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:testing_demo/main.dart';

void main() {
  testWidgets('tap on counter app', (tester) async {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(const MyApp());

    // wait for data to load
    await tester.pumpAndSettle();

    // find the item by text
    final item = find.byIcon(Icons.add);

    // assert item is found
    expect(item, findsOneWidget);

    expect(find.text('0'), findsOneWidget);

    // Emulate a tap on the tile item.
    await tester.tap(item);
    await tester.pumpAndSettle();

    // Species name should be displayed
    expect(find.text('1'), findsOneWidget);

    // 'please select' text should not be displayed
    expect(find.text('0'), findsNothing);
  });
}
