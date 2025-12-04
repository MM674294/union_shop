
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/graduation_page.dart';


void main() {
  group('GraduationPage Tests', () {

  group('GraduationPage Static Products Tests', () {
    test('GraduationPage has graduation products list', () {
      expect(GraduationPage.graduationProducts, isNotEmpty);
    });

    test('GraduationPage has 3 graduation products', () {
      expect(GraduationPage.graduationProducts.length, equals(3));
    });

    test('GraduationPage first product has required fields', () {
      final firstProduct = GraduationPage.graduationProducts[0];
      expect(firstProduct.containsKey('title'), isTrue);
      expect(firstProduct.containsKey('price'), isTrue);
      expect(firstProduct.containsKey('imageUrl'), isTrue);
    });

    test('GraduationPage all products have required fields', () {
      for (final product in GraduationPage.graduationProducts) {
        expect(product.containsKey('title'), isTrue);
        expect(product.containsKey('price'), isTrue);
        expect(product.containsKey('imageUrl'), isTrue);
      }
    });

    test('GraduationPage all products have non-empty title', () {
      for (final product in GraduationPage.graduationProducts) {
        expect(product['title']!.isNotEmpty, isTrue);
      }
    });

    test('GraduationPage all products have non-empty price', () {
      for (final product in GraduationPage.graduationProducts) {
        expect(product['price']!.isNotEmpty, isTrue);
      }
    });

    test('GraduationPage all products have non-empty imageUrl', () {
      for (final product in GraduationPage.graduationProducts) {
        expect(product['imageUrl']!.isNotEmpty, isTrue);
      }
    });

    test('GraduationPage first product is Graduation Hoodies', () {
      expect(GraduationPage.graduationProducts[0]['title'], equals('Graduation Hoodies'));
    });

    test('GraduationPage second product is Graduation bears', () {
      expect(GraduationPage.graduationProducts[1]['title'], equals('Graduation bears'));
    });

    test('GraduationPage third product is Graduation 3/4 Zipped Sweatshirt', () {
      expect(GraduationPage.graduationProducts[2]['title'], equals('Graduation 3/4 Zipped Sweatshirt'));
    });

    test('GraduationPage first product price is £35.00', () {
      expect(GraduationPage.graduationProducts[0]['price'], equals('£35.00'));
    });

    test('GraduationPage second product price is Sold out', () {
      expect(GraduationPage.graduationProducts[1]['price'], equals('Sold out'));
    });

    test('GraduationPage third product price is £45.00', () {
      expect(GraduationPage.graduationProducts[2]['price'], equals('£45.00'));
    });
  });
  });
}