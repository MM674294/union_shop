import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/halloween_bags_page.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('HalloweenBagsPage displays product, handles quantity and design selection', (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      // 1. Setup Test Environment (Modern API)
      tester.view.physicalSize = const Size(1200, 2000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        MaterialApp(
          home: const HalloweenBagsPage(),
          routes: {
            // Mocking the cart route for navigation
            '/cart': (context) => const Scaffold(body: Text('Cart')),
          },
        ),
      );
      await tester.pumpAndSettle();

       // 2. Verify basic content
      expect(find.text('Halloween Tote Bags'), findsOneWidget);
      expect(find.textContaining('Trick or treat yourself'), findsOneWidget);
      expect(find.text('£2.50'), findsOneWidget);

      // 3. Test Quantity Increase
      final increaseButton = find.byIcon(Icons.add);
      await tester.tap(increaseButton);
      await tester.pump();
      expect(find.text('2'), findsOneWidget); // Check if quantity updated to 2

      // 4. Test Design Selection (Dropdown)
      // Find the DropdownButton
      final designDropdown = find.byKey(const Key('designDropdown'));
      expect(designDropdown, findsOneWidget);

      // Tap to open the dropdown
      await tester.tap(designDropdown);
      await tester.pumpAndSettle();

      // Tap a new design option (e.g., 'Pumpkin')
      final pumpkinOption = find.text('Pumpkin').last; // Use .last as the selected value is also present
      await tester.tap(pumpkinOption);
      await tester.pumpAndSettle();

      // Verify the selected design changed (check the displayed text in the closed dropdown)
      expect(find.text('Pumpkin'), findsOneWidget);

      // 5. Test Add to Cart functionality
      await tester.tap(find.text('ADD TO CART'));
      await tester.pump(); // Start SnackBar animation
      expect(find.text('Added to cart!'), findsOneWidget);
    });
  });
}