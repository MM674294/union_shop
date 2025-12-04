import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/sale_page.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('SalePage displays and interacts correctly', (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        const MaterialApp(
          home: SalePage(),
        ),
      );
      await tester.pumpAndSettle();

      // Check for SALE title
      expect(find.text('SALE'), findsOneWidget);

      // Check for filter and sort labels
      expect(find.text('FILTER BY'), findsOneWidget);
      expect(find.text('SORT BY'), findsOneWidget);

      // Check for filter and sort dropdowns
      expect(find.byType(DropdownButton<String>), findsNWidgets(2));

      // Check for at least one product count text (e.g. "3 products")
      expect(find.textContaining('products'), findsWidgets);

      // Check for at least one Card (sale item)
      expect(find.byType(Card), findsWidgets);

      // Check for pagination controls
      expect(find.text('Previous'), findsOneWidget);
      expect(find.text('Next'), findsOneWidget);
      expect(find.textContaining('Page'), findsOneWidget);
    });
  });
}