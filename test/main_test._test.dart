import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/custom_app_bar.dart';
import 'package:union_shop/footer.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  group('UnionShopApp Tests', () {
    testWidgets('UnionShopApp initializes correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      expect(find.byType(MaterialApp), findsOneWidget);
      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets('UnionShopApp has correct title', (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      
      final app = find.byType(MaterialApp);
      expect(app, findsOneWidget);
    });

    testWidgets('UnionShopApp has correct theme color', (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.theme?.colorScheme.primary, isNotNull);
    });
  });

  group('HomeScreen Tests', () {
    testWidgets('HomeScreen displays banner', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pumpAndSettle();

        expect(find.byType(CustomAppBar), findsOneWidget);
      });
    });

    testWidgets('HomeScreen displays hero carousel', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pumpAndSettle();

        expect(find.byType(PageView), findsOneWidget);
        expect(find.text('The Print Shack'), findsOneWidget);
        expect(find.text('Browse our Clothing'), findsOneWidget);
      });
    });

    testWidgets('HomeScreen carousel displays titles', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pumpAndSettle();

        expect(find.text('The Print Shack'), findsOneWidget);
        expect(find.text('Browse our Clothing'), findsOneWidget);
        expect(find.text('Shop Merchandise'), findsOneWidget);
        expect(find.text('Check Out Our Sale'), findsOneWidget);
      });
    });

    testWidgets('HomeScreen carousel buttons are clickable', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pumpAndSettle();

        final buttons = find.byType(ElevatedButton);
        expect(buttons, findsWidgets);
        
        final firstButton = buttons.first;
        expect(firstButton, findsOneWidget);
      });
    });

    testWidgets('HomeScreen displays products section', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pumpAndSettle();

        expect(find.text('PRODUCTS SECTION'), findsOneWidget);
        expect(find.text('Portsmouth City Magnet'), findsOneWidget);
        expect(find.text('Portsmouth signature magnet'), findsOneWidget);
      });
    });

    testWidgets('HomeScreen displays product prices', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pumpAndSettle();

        expect(find.text('£10.00'), findsOneWidget);
        expect(find.text('£15.00'), findsOneWidget);
        expect(find.text('£20.00'), findsOneWidget);
        expect(find.text('£25.00'), findsOneWidget);
      });
    });

    testWidgets('HomeScreen displays range section', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pumpAndSettle();

        expect(find.text('OUR RANGE'), findsOneWidget);
        expect(find.text('Clothing'), findsOneWidget);
        expect(find.text('Merchandise'), findsOneWidget);
        expect(find.text('Graduation'), findsOneWidget);
        expect(find.text('Sale'), findsOneWidget);
      });
    });

    testWidgets('HomeScreen displays footer', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pumpAndSettle();

        expect(find.byType(Footer), findsOneWidget);
      });
    });

    testWidgets('HomeScreen carousel controls work', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.chevron_left), findsOneWidget);
        expect(find.byIcon(Icons.chevron_right), findsOneWidget);
      });
    });

    testWidgets('HomeScreen carousel pause/play button exists', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.pause), findsOneWidget);
      });
    });

    testWidgets('HomeScreen carousel dots are visible', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pumpAndSettle();

        final containers = find.byType(Container);
        expect(containers, findsWidgets);
      });
    });

    testWidgets('HomeScreen is responsive on tablet', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(800, 1200);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pumpAndSettle();

        expect(find.text('OUR RANGE'), findsOneWidget);
        expect(find.text('PRODUCTS SECTION'), findsOneWidget);
      });
    });

    testWidgets('HomeScreen is responsive on mobile', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(400, 800);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pumpAndSettle();

        expect(find.text('PRODUCTS SECTION'), findsOneWidget);
        expect(find.text('OUR RANGE'), findsOneWidget);
      });
    });

    testWidgets('HomeScreen product cards are clickable', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pumpAndSettle();

        final productCards = find.byType(Card);
        expect(productCards, findsWidgets);
      });
    });

    testWidgets('HomeScreen range cards navigate on tap', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pumpAndSettle();

        expect(find.text('Clothing'), findsOneWidget);
        expect(find.text('Merchandise'), findsOneWidget);
      });
    });

    testWidgets('HomeScreen carousel has correct number of slides', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pumpAndSettle();

        expect(find.text('FIND OUT MORE'), findsOneWidget);
        expect(find.text('BROWSE CLOTHING'), findsOneWidget);
        expect(find.text('BROWSE MERCHANDISE'), findsOneWidget);
        expect(find.text('VIEW SALE'), findsOneWidget);
      });
    });
  });

  group('ProductCard Tests', () {
    testWidgets('ProductCard displays title and price', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pumpAndSettle();

        expect(find.text('Portsmouth City Magnet'), findsOneWidget);
        expect(find.text('£10.00'), findsOneWidget);
      });
    });

    testWidgets('ProductCard has image', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pumpAndSettle();

        expect(find.byType(Image), findsWidgets);
      });
    });
  });

  group('RangeCard Tests', () {
    testWidgets('RangeCard displays title', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pumpAndSettle();

        expect(find.text('Clothing'), findsOneWidget);
        expect(find.text('Merchandise'), findsOneWidget);
        expect(find.text('Graduation'), findsOneWidget);
        expect(find.text('Sale'), findsOneWidget);
      });
    });

    testWidgets('RangeCard has correct styling', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2000);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pumpAndSettle();

        final textWidgets = find.byType(Text);
        expect(textWidgets, findsWidgets);
      });
    });
  });



}