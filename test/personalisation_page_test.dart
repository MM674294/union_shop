import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/personalisation_page.dart';
import 'package:union_shop/custom_app_bar.dart';
import 'package:union_shop/footer.dart';


void main() {
  setUp(() {
    cartItems.clear();
  });

  tearDown(() {
    cartItems.clear();
  });

  group('PersonalisationPage Tests', () {
    testWidgets('PersonalisationPage displays title', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PersonalisationPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Personalisation Service'), findsOneWidget);
    });

    testWidgets('PersonalisationPage displays description', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PersonalisationPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(
        find.text(
          'Customise your products with our exclusive personalisation service! Add your name, message, or logo to make it truly yours.',
        ),
        findsOneWidget,
      );
    });

    testWidgets('PersonalisationPage displays custom app bar', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PersonalisationPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(CustomAppBar), findsOneWidget);
    });

    testWidgets('PersonalisationPage displays footer', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PersonalisationPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Footer), findsOneWidget);
    });

    testWidgets('PersonalisationPage displays main product image', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PersonalisationPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Image), findsWidgets);
    });

    testWidgets('PersonalisationPage displays thumbnail images', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PersonalisationPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Image), findsWidgets);
    });

    testWidgets('PersonalisationPage can switch main image', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PersonalisationPage(),
        ),
      );
      await tester.pumpAndSettle();

      final thumbnails = find.byType(GestureDetector);
      await tester.tap(thumbnails.at(1));
      await tester.pumpAndSettle();

      expect(find.byType(GestureDetector), findsWidgets);
    });

    testWidgets('PersonalisationPage displays personalisation title', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PersonalisationPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Personalisation'), findsOneWidget);
    });

    testWidgets('PersonalisationPage displays price', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PersonalisationPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('£3.00'), findsOneWidget);
    });

    testWidgets('PersonalisationPage displays tax included text', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PersonalisationPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Tax included.'), findsOneWidget);
    });


    testWidgets('PersonalisationPage displays dropdown', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PersonalisationPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(DropdownButton<String>), findsOneWidget);
    });

    testWidgets('PersonalisationPage dropdown has default value', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PersonalisationPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('One Line of Text'), findsOneWidget);
    });



    testWidgets('PersonalisationPage shows one text field for one line option', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PersonalisationPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Personalisation Line 1'), findsOneWidget);
      expect(find.text('Personalisation Line 2'), findsNothing);
    });



    testWidgets('PersonalisationPage text fields accept input', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PersonalisationPage(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).first, 'John');
      await tester.pumpAndSettle();

      expect(find.text('John'), findsOneWidget);
    });

    testWidgets('PersonalisationPage text fields have max length 10', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PersonalisationPage(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).first, 'VeryLongText');
      await tester.pumpAndSettle();

      expect(find.text('VeryLongTe'), findsOneWidget);
    });

    testWidgets('PersonalisationPage displays add to cart button', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PersonalisationPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Add to Cart'), findsOneWidget);
    });
    testWidgets('PersonalisationPage has drawer', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PersonalisationPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets('PersonalisationPage is scrollable', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PersonalisationPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });
  }); 
}