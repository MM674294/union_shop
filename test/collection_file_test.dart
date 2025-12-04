import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/collections_page.dart';
import 'package:union_shop/custom_app_bar.dart';
import 'package:union_shop/footer.dart';
import 'package:union_shop/main.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  setUp(() {
    cartItems.clear();
  });

  group('CollectionsPage Tests', () {
    testWidgets('CollectionsPage displays title', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          const MaterialApp(
            home: CollectionsPage(),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Collections'), findsOneWidget);
      });
    });

    testWidgets('CollectionsPage displays all collections', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          const MaterialApp(
            home: CollectionsPage(),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Autumn Favourites'), findsOneWidget);
        expect(find.text('Black Friday'), findsOneWidget);
        expect(find.text('Clothing'), findsOneWidget);
        expect(find.text('Graduation'), findsOneWidget);
        expect(find.text('Merchandise'), findsOneWidget);
      });
    });

    testWidgets('CollectionsPage displays footer', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          const MaterialApp(
            home: CollectionsPage(),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.byType(Footer), findsOneWidget);
      });
    });

    testWidgets('CollectionsPage displays banner', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          const MaterialApp(
            home: CollectionsPage(),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.byType(CustomAppBar), findsOneWidget);
      });
    });

    testWidgets('CollectionsPage displays collection cards', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          const MaterialApp(
            home: CollectionsPage(),
          ),
        );
        await tester.pumpAndSettle();

        final cards = find.byType(Card);
        expect(cards, findsWidgets);
      });
    });

    testWidgets('CollectionsPage is responsive on tablet', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(800, 1200);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          const MaterialApp(
            home: CollectionsPage(),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Collections'), findsOneWidget);
        expect(find.text('Autumn Favourites'), findsOneWidget);
      });
    });

    testWidgets('CollectionsPage is responsive on mobile', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(400, 800);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          const MaterialApp(
            home: CollectionsPage(),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Collections'), findsOneWidget);
        expect(find.text('Autumn Favourites'), findsOneWidget);
      });
    });

    testWidgets('CollectionsPage displays images', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          const MaterialApp(
            home: CollectionsPage(),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.byType(Image), findsWidgets);
      });
    });
  });

  group('CollectionDetailPage Tests', () {
    testWidgets('CollectionDetailPage displays collection title', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      final testProducts = [
        {'name': 'Test Product 1', 'price': '£10.00', 'image': 'assets/images/clothing1.png'},
        {'name': 'Test Product 2', 'price': '£15.00', 'image': 'assets/images/clothing2.png'},
      ];

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: CollectionDetailPage(
              collectionTitle: 'Test Collection',
              products: testProducts,
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Test Collection'), findsOneWidget);
      });
    });

    testWidgets('CollectionDetailPage displays all products', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      final testProducts = [
        {'name': 'Test Product 1', 'price': '£10.00', 'image': 'assets/images/clothing1.png'},
        {'name': 'Test Product 2', 'price': '£15.00', 'image': 'assets/images/clothing2.png'},
        {'name': 'Test Product 3', 'price': '£20.00', 'image': 'assets/images/clothing3.png'},
      ];

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: CollectionDetailPage(
              collectionTitle: 'Test Collection',
              products: testProducts,
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Test Product 1'), findsOneWidget);
        expect(find.text('Test Product 2'), findsOneWidget);
        expect(find.text('Test Product 3'), findsOneWidget);
      });
    });

    testWidgets('CollectionDetailPage displays product prices', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      final testProducts = [
        {'name': 'Test Product 1', 'price': '£10.00', 'image': 'assets/images/clothing1.png'},
        {'name': 'Test Product 2', 'price': '£15.00', 'image': 'assets/images/clothing2.png'},
      ];

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: CollectionDetailPage(
              collectionTitle: 'Test Collection',
              products: testProducts,
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('£10.00'), findsOneWidget);
        expect(find.text('£15.00'), findsOneWidget);
      });
    });

    testWidgets('CollectionDetailPage displays footer', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      final testProducts = [
        {'name': 'Test Product', 'price': '£10.00', 'image': 'assets/images/clothing1.png'},
      ];

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: CollectionDetailPage(
              collectionTitle: 'Test Collection',
              products: testProducts,
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.byType(Footer), findsOneWidget);
      });
    });
  });

  group('ProductDetailPage Tests', () {
    testWidgets('ProductDetailPage displays product details', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      final testProduct = {
        'name': 'Test Hoodie',
        'price': '£25.00',
        'image': 'assets/images/clothing1.png',
      };

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: ProductDetailPage(product: testProduct),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Test Hoodie'), findsOneWidget);
        expect(find.text('£25.00'), findsOneWidget);
      });
    });

    testWidgets('ProductDetailPage displays size selector', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      final testProduct = {
        'name': 'Test Hoodie',
        'price': '£25.00',
        'image': 'assets/images/clothing1.png',
      };

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: ProductDetailPage(product: testProduct),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.byType(DropdownButton<String>), findsWidgets);
      });
    });

    testWidgets('ProductDetailPage quantity controls display', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      final testProduct = {
        'name': 'Test Hoodie',
        'price': '£25.00',
        'image': 'assets/images/clothing1.png',
      };

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: ProductDetailPage(product: testProduct),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.add), findsWidgets);
        expect(find.byIcon(Icons.remove), findsWidgets);
      });
    });

    testWidgets('ProductDetailPage displays add to cart button', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      final testProduct = {
        'name': 'Test Hoodie',
        'price': '£25.00',
        'image': 'assets/images/clothing1.png',
      };

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: ProductDetailPage(product: testProduct),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Add to Cart'), findsOneWidget);
      });
    });

    testWidgets('ProductDetailPage displays footer', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      final testProduct = {
        'name': 'Test Hoodie',
        'price': '£25.00',
        'image': 'assets/images/clothing1.png',
      };

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: ProductDetailPage(product: testProduct),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.byType(Footer), findsOneWidget);
      });
    });

    testWidgets('ProductDetailPage is responsive on mobile', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(400, 800);

      final testProduct = {
        'name': 'Test Hoodie',
        'price': '£25.00',
        'image': 'assets/images/clothing1.png',
      };

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: ProductDetailPage(product: testProduct),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Test Hoodie'), findsOneWidget);
      });
    });
  });
}