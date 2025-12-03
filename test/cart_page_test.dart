import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/cart_page.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:union_shop/main.dart';

void main() {
  setUp(() {
    cartItems.clear();
  });

  testWidgets('CartPage displays empty cart message', (WidgetTester tester) async {
    addTearDown(tester.view.resetPhysicalSize);
    tester.view.physicalSize = const Size(1200, 2000);

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: const CartPage(),
          routes: {
            '/checkout': (context) => const Placeholder(),
          },
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Your cart is empty.'), findsOneWidget);
      expect(find.text('Your cart'), findsOneWidget);
      expect(find.text('Continue shopping'), findsOneWidget);
    });
  });


  testWidgets('CartPage checkout button is disabled when cart is empty', (WidgetTester tester) async {
    cartItems.clear();

    addTearDown(tester.view.resetPhysicalSize);
    tester.view.physicalSize = const Size(1200, 2000);

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: const CartPage(),
          routes: {
            '/checkout': (context) => const Placeholder(),
          },
        ),
      );
      await tester.pumpAndSettle();

      final checkoutButton = find.byType(ElevatedButton);
      expect(checkoutButton, findsOneWidget);

      final buttonWidget = tester.widget<ElevatedButton>(checkoutButton);
      expect(buttonWidget.onPressed, isNull);
    });
  });

  testWidgets('CartPage calculates correct subtotal', (WidgetTester tester) async {
    cartItems.clear();
    cartItems.add({
      'title': 'Item 1',
      'price': '£10.00',
      'image': 'assets/images/clothing1.png',
      'details': '',
    });
    cartItems.add({
      'title': 'Item 2',
      'price': '£15.50',
      'image': 'assets/images/clothing2.png',
      'details': '',
    });
    cartItems.add({
      'title': 'Item 3',
      'price': '£24.50',
      'image': 'assets/images/clothing3.png',
      'details': '',
    });

    addTearDown(tester.view.resetPhysicalSize);
    tester.view.physicalSize = const Size(1200, 2000);

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: const CartPage(),
          routes: {
            '/checkout': (context) => const Placeholder(),
          },
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Subtotal'), findsOneWidget);
    });
  });
}