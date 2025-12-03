import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/cart_page.dart';
//import 'package:union_shop/cart_state.dart';
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

   testWidgets('CartPage displays empty cart message', (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
      addTearDown(tester.view.resetDevicePixelRatio);

      tester.binding.window.physicalSizeTestValue = const Size(1200, 2000);
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

  testWidgets('CartPage displays cart items with images', (WidgetTester tester) async {
    // Add items to cart
    cartItems.add({
      'title': 'Classic Hoodie',
      'price': '£25.00',
      'image': 'assets/images/clothing1.png',
      'details': 'Size: L',
    });
    cartItems.add({
      'title': 'Classic T-Shirt',
      'price': '£11.00',
      'image': 'assets/images/clothing3.png',
      'details': 'Size: M',
    });
await mockNetworkImagesFor(() async {
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
      addTearDown(tester.view.resetDevicePixelRatio);

      tester.binding.window.physicalSizeTestValue = const Size(1200, 2000);
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

          // Check for product titles
      expect(find.text('Classic Hoodie'), findsOneWidget);
      expect(find.text('Classic T-Shirt'), findsOneWidget);

      // Check for product prices
      expect(find.text('£25.00'), findsOneWidget);
      expect(find.text('£11.00'), findsOneWidget);

      // Check for product details
      expect(find.text('Size: L'), findsOneWidget);
      expect(find.text('Size: M'), findsOneWidget);

      // Check for remove buttons
      expect(find.text('REMOVE'), findsNWidgets(2));

      // Check for subtotal
      expect(find.text('Subtotal'), findsOneWidget);
      expect(find.text('£36.00'), findsOneWidget);
    });
  });

  testWidgets('CartPage removes item when REMOVE button is tapped', (WidgetTester tester) async {
    // Add items to cart
    cartItems.add({
      'title': 'Classic Hoodie',
      'price': '£25.00',
      'image': 'assets/images/clothing1.png',
      'details': 'Size: L',
    });
    cartItems.add({
      'title': 'Classic T-Shirt',
      'price': '£11.00',
      'image': 'assets/images/clothing3.png',
      'details': 'Size: M',
    });

    await mockNetworkImagesFor(() async {
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
      addTearDown(tester.view.resetDevicePixelRatio);

      tester.binding.window.physicalSizeTestValue = const Size(1200, 2000);
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

        expect(find.text('Classic Hoodie'), findsOneWidget);
      expect(find.text('Classic T-Shirt'), findsOneWidget);

      // Tap the first REMOVE button
      final removeButtons = find.text('REMOVE');
      await tester.tap(removeButtons.first);
      await tester.pumpAndSettle();

      // Check for SnackBar
      expect(find.text('Item removed from cart'), findsOneWidget);

      // Verify only one item remains
      expect(find.text('Classic Hoodie'), findsNothing);
      expect(find.text('Classic T-Shirt'), findsOneWidget);

      // Verify subtotal updated
      expect(find.text('£11.00'), findsOneWidget);
    });
  });


  testWidgets('CartPage displays checkout button and navigates', (WidgetTester tester) async {
    // Add item to cart
    cartItems.add({
      'title': 'Classic Hoodie',
      'price': '£25.00',
      'image': 'assets/images/clothing1.png',
      'details': 'Size: L',
    });

    await mockNetworkImagesFor(() async {
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
      addTearDown(tester.view.resetDevicePixelRatio);

      tester.binding.window.physicalSizeTestValue = const Size(1200, 2000);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: const CartPage(),
          routes: {
            '/checkout': (context) => const Scaffold(
              body: Center(child: Text('Checkout Page')),
            ),
          },
        ),
      );
      await tester.pumpAndSettle();

       expect(find.text('CHECKOUT'), findsOneWidget);

      // Verify button is enabled
      final checkoutButton = find.byType(ElevatedButton);
      expect(checkoutButton, findsOneWidget);

      // Tap checkout button
      await tester.tap(checkoutButton);
      await tester.pumpAndSettle();

      // Verify navigation occurred
      expect(find.text('Checkout Page'), findsOneWidget);
    });
  });

  testWidgets('CartPage checkout button is disabled when cart is empty', (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      addTearDown(tester.WidgetTester.binding.window.clearPhysicalSizeTestValue);
      addTearDown(tester.view.resetDevicePixelRatio);

      tester widgetTester.view.resetPhysicalSize(); = const Size(1200, 2000);
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

      // Check for checkout button
      final checkoutButton = find.byType(ElevatedButton);
      expect(checkoutButton, findsOneWidget);

      // Verify button is disabled by checking the style
      final buttonWidget = tester.widget<ElevatedButton>(checkoutButton);
      expect(buttonWidget.onPressed, isNull);
    });
  });

  testWidgets('CartPage calculates correct subtotal', (WidgetTester tester) async {
    // Add multiple items with different prices
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

    await mockNetworkImagesFor(() async {
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
      addTearDown(tester.view.resetDevicePixelRatio);

       await mockNetworkImagesFor(() async {
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
      addTearDown(tester.view.resetDevicePixelRatio);

      tester.binding.window.physicalSizeTestValue = const Size(1200, 2000);
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

      // Verify correct subtotal (10 + 15.50 + 24.50 = 50.00)
      expect(find.text('£50.00'), findsOneWidget);
    });
  });

  testWidgets('CartPage note field accepts user input', (WidgetTester tester) async {
    cartItems.add({
      'title': 'Classic Hoodie',
      'price': '£25.00',
      'image': 'assets/images/clothing1.png',
      'details': 'Size: L',
    });

    await mockNetworkImagesFor(() async {
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
      addTearDown(tester.view.resetDevicePixelRatio);

      tester.binding.window.physicalSizeTestValue = const Size(1200, 2000);
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

      expect(find.text('Add a note to your order'), findsOneWidget);

      // Find and tap the text field
      final noteField = find.byType(TextField);
      await tester.tap(noteField);
      await tester.pumpAndSettle();

      // Type a note
      await tester.typeText(noteField, 'Please gift wrap this item');
      await tester.pumpAndSettle();

      // Verify text was entered
      expect(find.text('Please gift wrap this item'), findsOneWidget);
    });
  });
}