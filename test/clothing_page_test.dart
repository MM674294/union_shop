import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/clothing_page.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('ClothingPage displays and interacts correctly', (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      // Optionally increase the test window size for scrolling
       addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

      tester.binding.window.physicalSizeTestValue = const Size(1200, 2000);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      addTearDown(tester.binding.window.clearDevicePixelRatioTestValue);

      await tester.pumpWidget(
        const MaterialApp(
          home: ClothingPage(),
        ),
      );
      await tester.pumpAndSettle();

      // Check for page title
      expect(find.text('Clothing'), findsOneWidget);

      // Check for filter and sort labels (with colon)
      expect(find.text('Filter by:'), findsOneWidget);
      expect(find.text('Sort by:'), findsOneWidget);

      // Check for filter and sort dropdowns
      expect(find.byType(DropdownButton<String>), findsNWidgets(2));

      // Check for product count text
      expect(find.textContaining('products'), findsOneWidget);

      // Check for at least one product card and Add to Cart button
      expect(find.byType(Card), findsWidgets);
      expect(find.text('Add to Cart'), findsWidgets);

      // Scroll to and tap the first Add to Cart button and check for SnackBar
      final addToCartButton = find.text('Add to Cart').first;
      await tester.ensureVisible(addToCartButton);
      await tester.tap(addToCartButton);
      await tester.pump(); // Start SnackBar animation
      expect(find.text('Added to cart!'), findsOneWidget);

      // Check for pagination controls
      expect(find.text('Previous'), findsOneWidget);
      expect(find.text('Next'), findsOneWidget);
      expect(find.textContaining('Page'), findsOneWidget);
    });
  });
}