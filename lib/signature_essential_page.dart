import 'package:flutter/material.dart';
import 'package:union_shop/custom_app_bar.dart';
import 'package:union_shop/item_detail_page.dart';
import 'package:union_shop/footer.dart';

// --- Cart Items (shared cart state) ---
List<Map<String, dynamic>> cartItems = [];

// --- Signature & Essential Products Only ---
final List<Map<String, String>> signatureEssentialProducts = [
  {
    'title': 'Signature T-Shirt',
    'price': '£14.99',
    'imageUrl': 'assets/images/signature_tshirt.png',
  },
  {
    'title': 'Signature Hoodie',
    'price': '£32.99',
    'imageUrl': 'assets/images/signature_hoodie.png',
  },
  {
    'title': 'Limited Edition Essential Zip Hoodies',
    'price': '£20.00 £14.99',
    'imageUrl': 'assets/images/essential_zip_hoodie.png',
  },
  {
    'title': 'Essential T-Shirt',
    'price': '£10.99 £6.99',
    'imageUrl': 'assets/images/essential_tshirt.png',
  },
];

class SignatureEssentialPage extends StatefulWidget {
  const SignatureEssentialPage({super.key});

  @override
  State<SignatureEssentialPage> createState() => _SignatureEssentialPageState();
}

class _SignatureEssentialPageState extends State<SignatureEssentialPage> {
  String _selectedFilter = 'All Products';
  String _selectedSort = 'Featured';

  List<Map<String, String>> get _filteredProducts {
    List<Map<String, String>> filtered = signatureEssentialProducts;

    if (_selectedFilter == 'Clothing') {
      filtered = filtered.where((item) =>
        item['title']!.toLowerCase().contains('hoodie') ||
        item['title']!.toLowerCase().contains('t-shirt') ||
        item['title']!.toLowerCase().contains('zip')
      ).toList();
    }
    return filtered;
  }

  List<Map<String, String>> get _sortedProducts {
    List<Map<String, String>> products = List.from(_filteredProducts);

    switch (_selectedSort) {
      case 'A-Z':
      case 'Alphabetically, A-Z':
        products.sort((a, b) => a['title']!.compareTo(b['title']!));
        break;
      case 'Z-A':
      case 'Alphabetically, Z-A':
        products.sort((a, b) => b['title']!.compareTo(a['title']!));
        break;
      case 'Price Low to High':
        products.sort((a, b) => _extractPrice(a['price']).compareTo(_extractPrice(b['price'])));
        break;
      case 'Price High to Low':
        products.sort((a, b) => _extractPrice(b['price']).compareTo(_extractPrice(a['price'])));
        break;
      default:
        break;
    }
    return products;
  }

  double _extractPrice(String? priceStr) {
    if (priceStr == null) return double.infinity;
    final matches = RegExp(r'(\d+\.?\d*)').allMatches(priceStr);
    if (matches.isEmpty) return double.infinity;
    return double.tryParse(matches.last.group(0)!) ?? double.infinity;
  }

  @override
  Widget build(BuildContext context) {
    final products = _sortedProducts;
     return Column(
      children: [
        // Banner at the top
        CustomAppBar.getBanner(),
        // Scaffold with navigation bar and body
        Expanded(
          child: Scaffold(
            appBar: CustomAppBar(parentContext: context),
            drawer: const AppDrawer(),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 24),
                  const Text(
                    'Signature & Essential Range',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4d2963),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Discover effortless style and comfort with our latest drop - the Signature & Essential range. The Signature line features premium embroidered hoodies in limited colours, plus the new Signature T-Shirt, combining classic design with elevated details. The Essential line offers versatile, must-have t-shirts with a fresh chest logo design, adding a clean, modern touch to your daily rotation.\n\nPlus, grab the limited edition zip hoodie while stocks last - a standout piece designed for those who move differently.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  // Filter and Sort Bar (responsive)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const Text(
                          'Filter by:',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 8),
                        DropdownButton<String>(
                          value: _selectedFilter,
                          items: const [
                            DropdownMenuItem(value: 'All Products', child: Text('All Products')),
                            DropdownMenuItem(value: 'Clothing', child: Text('Clothing')),
                          ],
                          onChanged: (val) {
                            setState(() {
                              _selectedFilter = val!;
                            });
                          },
                        ),
                        const SizedBox(width: 24),
                        const Text(
                          'Sort by:',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 8),
                        DropdownButton<String>(
                          value: _selectedSort,
                          items: const [
                            DropdownMenuItem(value: 'Featured', child: Text('Featured')),
                            DropdownMenuItem(value: 'Best Selling', child: Text('Best Selling')),
                            DropdownMenuItem(value: 'Alphabetically, A-Z', child: Text('Alphabetically, A-Z')),
                            DropdownMenuItem(value: 'Alphabetically, Z-A', child: Text('Alphabetically, Z-A')),
                            DropdownMenuItem(value: 'Price High to Low', child: Text('Price High to Low')),
                            DropdownMenuItem(value: 'Price Low to High', child: Text('Price Low to High')),
                            DropdownMenuItem(value: 'Date Old to New', child: Text('Date Old to New')),
                            DropdownMenuItem(value: 'Date New to Old', child: Text('Date New to Old')),
                          ],
                          onChanged: (val) {
                            setState(() {
                              _selectedSort = val!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  // Product count below filter/sort bar
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${products.length} products',
                        style: const TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ),
                  ),
                  // Products Grid (responsive)
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: products.length,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 220,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 32,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ItemDetailPage(item: product),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image.asset(
                                product['imageUrl']!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey[300],
                                    child: const Center(
                                      child: Icon(Icons.image_not_supported, color: Colors.grey),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              product['title']!,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              product['price']!,
                              style: const TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
            // Responsive full-width footer
            Container(
              width: double.infinity,
              color: Colors.transparent,
              child: Footer(
                onEmailSubmitted: (email) {
                  debugPrint('User subscribed with email: $email');
                },
              ),
            ),
          ],
        ),
      ),
    ),
        ),
      ],
      );
  }
}