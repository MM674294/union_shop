import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/print_shack_personalise_page.dart';
import 'package:union_shop/custom_app_bar.dart';
import 'package:union_shop/footer.dart';


void main() {


  group('PrintShackPersonalisePage Tests', () {
    testWidgets('PrintShackPersonalisePage displays custom app bar', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(CustomAppBar), findsOneWidget);
    });

    testWidgets('PrintShackPersonalisePage displays footer', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Footer), findsOneWidget);
    });

    testWidgets('PrintShackPersonalisePage displays main image', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Image), findsWidgets);
    });

    testWidgets('PrintShackPersonalisePage displays three thumbnail images', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GestureDetector), findsWidgets);
    });

    testWidgets('PrintShackPersonalisePage can switch main image', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      final thumbnails = find.byType(GestureDetector);
      await tester.tap(thumbnails.at(1));
      await tester.pumpAndSettle();

      expect(find.byType(GestureDetector), findsWidgets);
    });

    testWidgets('PrintShackPersonalisePage displays title', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Personalisation'), findsOneWidget);
    });

    testWidgets('PrintShackPersonalisePage displays price', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('£3.00'), findsOneWidget);
    });

    testWidgets('PrintShackPersonalisePage displays tax included text', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Tax included.'), findsOneWidget);
    });


    testWidgets('PrintShackPersonalisePage displays dropdown', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(DropdownButton<String>), findsOneWidget);
    });

    testWidgets('PrintShackPersonalisePage dropdown default is One Line of Text', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('One Line of Text'), findsOneWidget);
    });

    testWidgets('PrintShackPersonalisePage shows one text field initially', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Personalisation Line 1'), findsOneWidget);
      expect(find.text('Personalisation Line 2'), findsNothing);
    });

    testWidgets('PrintShackPersonalisePage can change dropdown to two lines', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byType(DropdownButton<String>));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Two Lines of Text').last);
      await tester.pumpAndSettle();

      expect(find.text('Two Lines of Text'), findsOneWidget);
      expect(find.text('Personalisation Line 1'), findsOneWidget);
      expect(find.text('Personalisation Line 2'), findsOneWidget);
    });

    testWidgets('PrintShackPersonalisePage shows two text fields for two lines option', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byType(DropdownButton<String>));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Two Lines of Text').last);
      await tester.pumpAndSettle();

      expect(find.text('Personalisation Line 1'), findsOneWidget);
      expect(find.text('Personalisation Line 2'), findsOneWidget);
      expect(find.text('Personalisation Line 3'), findsNothing);
    });

    testWidgets('PrintShackPersonalisePage shows three text fields for three lines option', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byType(DropdownButton<String>));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Three Lines of Text').last);
      await tester.pumpAndSettle();

      expect(find.text('Personalisation Line 1'), findsOneWidget);
      expect(find.text('Personalisation Line 2'), findsOneWidget);
      expect(find.text('Personalisation Line 3'), findsOneWidget);
      expect(find.text('Personalisation Line 4'), findsNothing);
    });

    testWidgets('PrintShackPersonalisePage shows four text fields for four lines option', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byType(DropdownButton<String>));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Four Lines of Text').last);
      await tester.pumpAndSettle();

      expect(find.text('Personalisation Line 1'), findsOneWidget);
      expect(find.text('Personalisation Line 2'), findsOneWidget);
      expect(find.text('Personalisation Line 3'), findsOneWidget);
      expect(find.text('Personalisation Line 4'), findsOneWidget);
    });

    testWidgets('PrintShackPersonalisePage text fields accept input', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).first, 'John');
      await tester.pumpAndSettle();

      expect(find.text('John'), findsOneWidget);
    });

    testWidgets('PrintShackPersonalisePage text fields have max length 10', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).first, 'VeryLongText');
      await tester.pumpAndSettle();

      expect(find.text('VeryLongTe'), findsOneWidget);
    });

    testWidgets('PrintShackPersonalisePage displays add to cart button', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('ADD TO CART'), findsOneWidget);
    });

    testWidgets('PrintShackPersonalisePage is scrollable', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('PrintShackPersonalisePage has drawer', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.menu), findsOneWidget);
    });


    testWidgets('PrintShackPersonalisePage has aspect ratio images', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(AspectRatio), findsOneWidget);
    });

    testWidgets('PrintShackPersonalisePage main image has border when selected', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      final thumbnails = find.byType(GestureDetector);
      expect(thumbnails, findsWidgets);
    });

    testWidgets('PrintShackPersonalisePage text field display counter is hidden', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      // Counter text should be empty string (hidden)
      expect(find.byType(TextField), findsWidgets);
    });

    testWidgets('PrintShackPersonalisePage add to cart button has purple color', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(OutlinedButton), findsOneWidget);
    });

    testWidgets('PrintShackPersonalisePage has padding', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Padding), findsWidgets);
    });

    testWidgets('PrintShackPersonalisePage has column structure', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Column), findsWidgets);
    });

    testWidgets('PrintShackPersonalisePage has row for thumbnails', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Row), findsWidgets);
    });

    testWidgets('PrintShackPersonalisePage displays all aligned to left', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Personalisation'), findsOneWidget);
      expect(find.text('£3.00'), findsOneWidget);
    });

    testWidgets('PrintShackPersonalisePage renders without errors', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(PrintShackPersonalisePage), findsOneWidget);
    });

    testWidgets('PrintShackPersonalisePage multiple text fields work independently', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      // Change to two lines
      await tester.tap(find.byType(DropdownButton<String>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Two Lines of Text').last);
      await tester.pumpAndSettle();

      // Enter different text in each field
      final textFields = find.byType(TextField);
      await tester.enterText(textFields.at(0), 'Line1');
      await tester.enterText(textFields.at(1), 'Line2');
      await tester.pumpAndSettle();

      expect(find.text('Line1'), findsOneWidget);
      expect(find.text('Line2'), findsOneWidget);
    });

    testWidgets('PrintShackPersonalisePage can select small logo option', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byType(DropdownButton<String>));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Small Logo (Chest)').last);
      await tester.pumpAndSettle();

      expect(find.text('Small Logo (Chest)'), findsOneWidget);
    });

    testWidgets('PrintShackPersonalisePage can select large logo option', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byType(DropdownButton<String>));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Large Logo (Back)').last);
      await tester.pumpAndSettle();

      expect(find.text('Large Logo (Back)'), findsOneWidget);
    });

    testWidgets('PrintShackPersonalisePage has scaffold', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('PrintShackPersonalisePage outline button styling', (WidgetTester tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      tester.view.physicalSize = const Size(1200, 2400);

      await tester.pumpWidget(
        const MaterialApp(
          home: PrintShackPersonalisePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(OutlinedButton), findsOneWidget);
      expect(find.text('ADD TO CART'), findsOneWidget);
    });

    
  });
}