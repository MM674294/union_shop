import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/product_page.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('ProductPage displays basic elements', (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ProductPage(),
        ),
      );
      await tester.pumpAndSettle();

      // Check for product name (adjust this to your actual product name)
      expect(find.text('Portsmouth City Magnet'), findsOneWidget);

      // Check for product price
      expect(find.text('£10.00'), findsOneWidget);

      // Check for Add to Cart button
      expect(find.text('Add to Cart'), findsOneWidget);

      // Check for banner text (adjust if you use ResponsiveBanner)
      expect(
        find.text('BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!'),
        findsOneWidget,
      );

      // Check for product description (partial match)
      expect(find.textContaining('Portsmouth City magnet'), findsOneWidget);
    });
  });
}