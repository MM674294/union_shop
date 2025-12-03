import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/about_page.dart';

void main() {
  testWidgets('AboutPage displays expected content', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AboutPage(),
      ),
    );

    // Check for header (case-insensitive, partial match)
    expect(find.textContaining('About', findRichText: true), findsWidgets);

    // Check for welcome text (partial match)
    expect(find.textContaining('Welcome to the Union Shop', findRichText: true), findsWidgets);

    // Check for personalisation service (partial match)
    expect(find.textContaining('personalisation service', findRichText: true), findsWidgets);

    // Check for delivery/collection info (partial match)
    expect(find.textContaining('delivery', findRichText: true), findsWidgets);

    // Check for footer subscribe button (partial match)
    expect(find.textContaining('Subscribe', findRichText: true), findsWidgets);
  });
}