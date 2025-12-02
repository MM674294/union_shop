import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/clothing_page.dart';

void main() {
  testWidgets('ClothingPage displays title, filter, sort, and products', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ClothingPage(),
      ),
    );

    // Check for page title
    expect(find.text('Clothing'), findsOneWidget);

    // Check for filter and sort labels
    expect(find.text('Filter by:'), findsOneWidget);
    expect(find.text('Sort by:'), findsOneWidget);

    // Check for at least one product card
    expect(find.byType(Card), findsWidgets);

    // Check for Add to Cart button
    expect(find.text('Add to Cart'), findsWidgets);

    // Check for pagination controls
    expect(find.text('Previous'), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);
  });
}