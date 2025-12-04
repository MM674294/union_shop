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