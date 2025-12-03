import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/cart_page.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:union_shop/main.dart';

void main() {
  setUp(() {
    // Clear cart before each test
    cartItems.clear();
  });

  testWidgets('CartPage displays empty cart message', (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      addTearDown(tester.view.resetPhysicalSize);

      tester.view.physicalSize = const Size(1200, 2000);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: const CartPage(),
          routes: {
            '/checkout': (context) => const Placeholder(),
          },
        ),
      );
      await tester.pumpAndSettle();

      // Check for empty cart message
      expect(find.text('Your cart is empty.'), findsOneWidget);
      expect(find.text('Your cart'), findsOneWidget);
      expect(find.text('Continue shopping'), findsOneWidget);
    });
  });

