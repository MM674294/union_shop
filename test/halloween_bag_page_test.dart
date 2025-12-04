import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/halloween_bags_page.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:union_shop/main.dart';

void main() {
  setUp(() {
    cartItems.clear();
  });

  testWidgets('HalloweenBagsPage displays title and price', (WidgetTester tester) async {
    addTearDown(tester.view.resetPhysicalSize);
    tester.view.physicalSize = const Size(1200, 2000);

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HalloweenBagsPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Halloween Tote Bags'), findsOneWidget);
      expect(find.text('£2.50'), findsOneWidget);
    });
  });


  testWidgets('HalloweenBagsPage displays all design thumbnails', (WidgetTester tester) async {
    addTearDown(tester.view.resetPhysicalSize);
    tester.view.physicalSize = const Size(1200, 2000);

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HalloweenBagsPage(),
        ),
      );
      await tester.pumpAndSettle();

      // Check for thumbnail images
      expect(find.byType(Image), findsWidgets);
    });
  });

  testWidgets('HalloweenBagsPage displays product description', (WidgetTester tester) async {
    addTearDown(tester.view.resetPhysicalSize);
    tester.view.physicalSize = const Size(1200, 2000);

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HalloweenBagsPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Quantity'), findsOneWidget);
      expect(find.textContaining('Trick or treat'), findsOneWidget);
      expect(find.textContaining('hand crafted'), findsOneWidget);
    });
  });

  testWidgets('HalloweenBagsPage adds correct design to cart', (WidgetTester tester) async {
    addTearDown(tester.view.resetPhysicalSize);
    tester.view.physicalSize = const Size(1200, 2000);

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HalloweenBagsPage(),
        ),
      );
      await tester.pumpAndSettle();

      // Select Bat design
      final dropdown = find.byType(DropdownButton<String>);
      await tester.tap(dropdown);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Bat').last);
      await tester.pumpAndSettle();

      // Add to cart
      final addToCartButton = find.text('ADD TO CART');
      await tester.tap(addToCartButton);
      await tester.pumpAndSettle();

      // Verify correct design in cart
      expect(cartItems[0]['title'], contains('Bat'));
      expect(cartItems[0]['details'], equals('Design: Bat'));
    });
  });

  testWidgets('HalloweenBagsPage is responsive on mobile', (WidgetTester tester) async {
    addTearDown(tester.view.resetPhysicalSize);
    tester.view.physicalSize = const Size(500, 1200); // Mobile size

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HalloweenBagsPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Halloween Tote Bags'), findsOneWidget);
      expect(find.text('£2.50'), findsOneWidget);
      expect(find.text('ADD TO CART'), findsOneWidget);
    });
  });
}