import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/merchandise_page.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('MerchandisePage displays and interacts correctly', (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MerchandisePage(),
        ),
      );
      await tester.pumpAndSettle();

      // Check for filter and sort labels
      expect(find.text('Filter by:'), findsOneWidget);
      expect(find.text('Sort by:'), findsOneWidget);

      // Check for filter and sort dropdowns
      expect(find.byType(DropdownButton<String>), findsNWidgets(2));

      // Check for product count text (e.g. "28 products")
      expect(find.textContaining('products'), findsWidgets);

      // Check for at least one Card (merchandise item)
      expect(find.byType(Card), findsWidgets);

      // Check for pagination controls
      expect(find.text('Previous'), findsOneWidget);
      expect(find.text('Next'), findsOneWidget);
      expect(find.textContaining('Page'), findsOneWidget);

      // Tap the first merchandise card and check navigation (if implemented)
      // await tester.tap(find.byType(Card).first);
      // await tester.pumpAndSettle();
      // expect(find.byType(BackButton), findsOneWidget);

      // Check for footer subscribe button (partial match)
      expect(find.textContaining('Subscribe'), findsOneWidget);
    });
  });
}