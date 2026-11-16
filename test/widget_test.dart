import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:senja_app/main.dart';

void main() {
  testWidgets('Bottom navigation smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: BottomNavPage()));
    await tester.pumpAndSettle();

    // Home tab is shown first.
    expect(find.textContaining('Transaksi Hari ini', findRichText: true),
        findsOneWidget);

    // Switch to the "Profile" tab, which shows the "Lainnya" screen.
    await tester.tap(find.text('Profile'));
    await tester.pumpAndSettle();
    expect(find.text('Lainnya'), findsOneWidget);
  });
}
