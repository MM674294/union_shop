import 'package:flutter/material.dart';
import 'package:union_shop/custom_app_bar.dart';
import 'package:union_shop/item_detail_page.dart';
import 'package:union_shop/footer.dart';

class ClothingPage extends StatefulWidget {
  const ClothingPage({super.key});

  @override
  State<ClothingPage> createState() => _ClothingPageState();
}

class _ClothingPageState extends State<ClothingPage> {
  String _selectedFilter = 'All Products';
  String _selectedSort = 'Featured';
  int _currentPage = 1;
  final String _searchQuery = '';

  // List of clothing items
  final List<Map<String, String>> _clothingItems = [
    {
      'title': 'Classic Hoodies',
      'price': '£25.00',
      'imageUrl': 'assets/images/clothing1.png',
      'date': DateTime(2024, 1, 1).toIso8601String(),
    },
    {
      'title': 'Classic sweatshirts',
      'price': '£23.00',
      'imageUrl': 'assets/images/clothing2.png',
      'date': DateTime(2024, 1, 2).toIso8601String(),
    },
    {
      'title': 'Classic T-Shirts',
      'price': '£11.00',
      'imageUrl': 'assets/images/clothing3.png',
      'date': DateTime(2024, 1, 3).toIso8601String(),
    },
    {
      'title': 'Classic Sweatshirts - neutral',
      'price': '£ 1̶7̶.̶0̶0̶  £10.99',
      'imageUrl': 'assets/images/clothing4.png',
      'date': DateTime(2024, 1, 3).toIso8601String(),
    },
    {
      'title': 'Graduation Hoodies',
      'price': '£35.00',
      'imageUrl': 'assets/images/clothing5.png',
      'date': DateTime(2024, 1, 20).toIso8601String(),
    },
    {
      'title': 'Graduation 3/4 Zipped Sweatshirt',
      'price': '£45.00',
      'imageUrl': 'assets/images/clothing6.png',
      'date': DateTime(2024, 2, 20).toIso8601String(),
    },
    {
      'title': 'Classic Cap',
      'price': '£12.00',
      'imageUrl': 'assets/images/clothing7.png',
      'date': DateTime(2024, 3, 20).toIso8601String(),
    },
    {
      'title': 'Classic limited edition Hoodie',
      'price': '£3̶0̶.̶0̶0̶  £12.99',
      'imageUrl': 'assets/images/clothing8.png',
      'date': DateTime(2024, 1, 14).toIso8601String(),
    },
    {
      'title': 'Heavyweight Shorts',
      'price': '£3̶0̶.̶0̶0̶  £12.99',
      'imageUrl': 'assets/images/clothing9.png',
      'date': DateTime(2024, 5, 17).toIso8601String(),
    },
    {
      'title': 'Signiture Hoodie',
      'price': '£3̶0̶.̶0̶0̶  £12.99',
      'imageUrl': 'assets/images/clothing10.png',
      'date': DateTime(2024, 2, 2).toIso8601String(),
    },
    {
      'title': 'Ladies athletic Leggings',
      'price': '£ ̶2̶6̶.̶0̶0̶  £12.99',
      'imageUrl': 'assets/images/clothing11.png',
      'date': DateTime(2024, 7, 6).toIso8601String(),
    },
    {
      'title': 'Essential T-Shirt',
      'price': '£ ̶ ̶1̶0̶.̶9̶9̶  £6.99',
      'imageUrl': 'assets/images/clothing12.png',
      'date': DateTime(2024, 12, 20).toIso8601String(),
    },
    {
      'title': 'Limmited Edition Essential Zip Hoodies',
      'price': '£2̶0̶.̶0̶0̶  £6.99',
      'imageUrl': 'assets/images/clothing13.png',
      'date': DateTime(2024, 11, 20).toIso8601String(),
    },
    {
      'title': 'Waterproof poncho',
      'price': '£1.99',
      'imageUrl': 'assets/images/clothing14.png',
      'date': DateTime(2024, 6, 12).toIso8601String(),
    },
    {
      'title': 'Classic Burgendy Hoodie',
      'price': '̶£2̶5̶.̶0̶0̶  £12.00',
      'imageUrl': 'assets/images/clothing15.png',
      'date': DateTime(2024, 4, 3).toIso8601String(),
    },
    {
      'title': 'Signature T-Shirt',
      'price': '̶£2̶5̶.̶0̶0̶  £12.00',
      'imageUrl': 'assets/images/clothing16.png',
      'date': DateTime(2024, 3, 26).toIso8601String(),
    },
    {
      'title': 'Limited Edition UoM Beanies',
      'price': '̶£7.50',
      'imageUrl': 'assets/images/clothing17.png',
      'date': DateTime(2024, 9, 8).toIso8601String(),
    },
  ];

  double _parsePrice(String price) {
    final matches = RegExp(r'£([\d.]+)').allMatches(price);
    if (matches.isNotEmpty) {
      return double.tryParse(matches.last.group(1)!) ?? 0.0;
    }
    return 0.0;
  }

  DateTime _parseDate(String date) =>
      DateTime.tryParse(date) ?? DateTime(2000);

  List<Map<String, String>> _sortClothingItems(List<Map<String, String>> items) {
    List<Map<String, String>> sorted = List<Map<String, String>>.from(items);
    switch (_selectedSort) {
      case 'Featured':
        return sorted;
      case 'A-Z':
        sorted.sort((a, b) => a['title']!.compareTo(b['title']!));
        return sorted;
      case 'Z-A':
        sorted.sort((a, b) => b['title']!.compareTo(a['title']!));
        return sorted;
      case 'Price High to Low':
        sorted.sort((a, b) => _parsePrice(b['price']!).compareTo(_parsePrice(a['price']!)));
        return sorted;
      case 'Price Low to High':
        sorted.sort((a, b) => _parsePrice(a['price']!).compareTo(_parsePrice(b['price']!)));
        return sorted;
      case 'Date Old to New':
        sorted.sort((a, b) => _parseDate(a['date']!).compareTo(_parseDate(b['date']!)));
        return sorted;
      case 'Date New to Old':
        sorted.sort((a, b) => _parseDate(b['date']!).compareTo(_parseDate(a['date']!)));
        return sorted;
      default:
        return sorted;
    }
  }

  List<Map<String, String>> get _filteredClothingItems {
    List<Map<String, String>> filtered = _clothingItems;

    // Filtering logic
    if (_selectedFilter != 'All Products') {
      if (_selectedFilter == 'Clothing') {
        filtered = filtered.where((item) =>
          item['title']!.toLowerCase().contains('hoodie') ||
          item['title']!.toLowerCase().contains('t-shirt') ||
          item['title']!.toLowerCase().contains('sweatshirt') ||
          item['title']!.toLowerCase().contains('leggings') ||
          item['title']!.toLowerCase().contains('shorts') ||
          item['title']!.toLowerCase().contains('poncho')
        ).toList();
      } else if (_selectedFilter == 'Merchandise') {
        filtered = filtered.where((item) =>
          item['title']!.toLowerCase().contains('cap') ||
          item['title']!.toLowerCase().contains('beanies')
        ).toList();
      } else if (_selectedFilter == 'Popular') {
        filtered = filtered.take(5).toList();
      } else if (_selectedFilter == 'PSUT') {
        filtered = filtered.where((item) =>
          item['title']!.toLowerCase().contains('graduation')
        ).toList();
      }
    }

    // Search logic
    filtered = filtered.where((item) {
      if (_searchQuery.isEmpty) return true;
      return item['title']!.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    // Sort and paginate
    final sorted = _sortClothingItems(filtered);
    final start = (_currentPage - 1) * 10;
    final end = (_currentPage * 10).clamp(0, sorted.length);
    return sorted.sublist(start, end);
  }

  int get _totalPages {
    List<Map<String, String>> filtered = _clothingItems;
    if (_selectedFilter != 'All Products') {
      if (_selectedFilter == 'Clothing') {
        filtered = filtered.where((item) =>
          item['title']!.toLowerCase().contains('hoodie') ||
          item['title']!.toLowerCase().contains('t-shirt') ||
          item['title']!.toLowerCase().contains('sweatshirt') ||
          item['title']!.toLowerCase().contains('leggings') ||
          item['title']!.toLowerCase().contains('shorts') ||
          item['title']!.toLowerCase().contains('poncho')
        ).toList();
      } else if (_selectedFilter == 'Merchandise') {
        filtered = filtered.where((item) =>
          item['title']!.toLowerCase().contains('cap') ||
          item['title']!.toLowerCase().contains('beanies')
        ).toList();
      } else if (_selectedFilter == 'Popular') {
        filtered = filtered.take(5).toList();
      } else if (_selectedFilter == 'PSUT') {
        filtered = filtered.where((item) =>
          item['title']!.toLowerCase().contains('graduation')
        ).toList();
      }
    }
    if (_searchQuery.isNotEmpty) {
      filtered = filtered.where((item) =>
        item['title']!.toLowerCase().contains(_searchQuery.toLowerCase())
      ).toList();
    }
    return (filtered.length / 10).ceil();
  }

  void _goToPage(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(parentContext: context),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Page Title
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: Colors.grey[200],
              child: const Text(
                'Clothing',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4d2963),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // Filter & Sort Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey),
                  bottom: BorderSide(color: Colors.grey),
                ),
              ),
              child: SingleChildScrollView(
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
                        DropdownMenuItem(
                          value: 'All Products',
                          child: Text('All Products'),
                        ),
                        DropdownMenuItem(
                          value: 'Clothing',
                          child: Text('Clothing'),
                        ),
                        DropdownMenuItem(
                          value: 'Merchandise',
                          child: Text('Merchandise'),
                        ),
                        DropdownMenuItem(
                          value: 'Popular',
                          child: Text('Popular'),
                        ),
                        DropdownMenuItem(
                          value: 'PSUT',
                          child: Text('PSUT'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedFilter = value!;
                          _currentPage = 1;
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
                        DropdownMenuItem(
                          value: 'Featured',
                          child: Text('Featured'),
                        ),
                        DropdownMenuItem(
                          value: 'Best Selling',
                          child: Text('Best Selling'),
                        ),
                        DropdownMenuItem(
                          value: 'A-Z',
                          child: Text('A-Z'),
                        ),
                        DropdownMenuItem(
                          value: 'Z-A',
                          child: Text('Z-A'),
                        ),
                        DropdownMenuItem(
                          value: 'Price High to Low',
                          child: Text('Price High to Low'),
                        ),
                        DropdownMenuItem(
                          value: 'Price Low to High',
                          child: Text('Price Low to High'),
                        ),
                        DropdownMenuItem(
                          value: 'Date Old to New',
                          child: Text('Date Old to New'),
                        ),
                        DropdownMenuItem(
                          value: 'Date New to Old',
                          child: Text('Date New to Old'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedSort = value!;
                          _currentPage = 1;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${_clothingItems.length} products',
                  style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemCount: _filteredClothingItems.length,
                itemBuilder: (context, index) {
                  final item = _filteredClothingItems[index];
                  return GestureDetector(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ItemDetailPage(item: item),
                        ),
                      );
                      setState(() {}); // Refresh in case cart changed
                    },
                    child: Card(
                      elevation: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Image.asset(
                              item['imageUrl']!,
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              item['title']!,
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              item['price']!,
                              style: const TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  cartItems.add({
                                    'title': item['title'],
                                    'price': item['price'],
                                    'image': item['imageUrl'],
                                    'details': '',
                                  });
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Added to cart!')),
                                );
                              },
                              child: const Text('Add to Cart'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Pagination Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: _currentPage > 1
                      ? () => _goToPage(_currentPage - 1)
                      : null,
                  child: const Text('Previous'),
                ),
                Text('Page $_currentPage of $_totalPages'),
                TextButton(
                  onPressed: _currentPage < _totalPages
                      ? () => _goToPage(_currentPage + 1)
                      : null,
                  child: const Text('Next'),
                ),
              ],
            ),
            // Footer Section
            Footer(
              onEmailSubmitted: (email) {
                print('User subscribed with email: $email');
              },
            ),
          ],
        ),
      ),
    );
  }
}