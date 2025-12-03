import 'package:flutter/material.dart';
import 'package:union_shop/custom_app_bar.dart';
import 'package:union_shop/item_detail_page.dart';
import 'package:union_shop/footer.dart';

class SalePage extends StatefulWidget {
  const SalePage({super.key});

  @override
  State<SalePage> createState() => _SalePageState();
}

class _SalePageState extends State<SalePage> {
  int _currentPage = 1;
  static const int _itemsPerPage = 4;

  String _selectedFilter = 'All products';
  String _selectedSort = 'Best selling';

  final List<Map<String, String>> saleItems = [
    {
      'title': 'A5 Notepad',
      'price': 'Sold out',
      'imageUrl': 'assets/images/m12.png',
      'date': DateTime(2024, 4, 1).toIso8601String(),
      'category': 'Merchandise',
    },
    {
      'title': 'Classic Sweatshirts - Neutral',
      'price': '£̶1̶7̶.̶0̶0̶  £10.99',
      'imageUrl': 'assets/images/clothing4.png',
      'date': DateTime(2024, 4, 2).toIso8601String(),
      'category': 'Clothing',
    },
    {
      'title': 'waterproof Poncho',
      'price': '£1.99',
      'imageUrl': 'assets/images/clothing14.png',
      'date': DateTime(2024, 5, 9).toIso8601String(),
      'category': 'Clothing',
    },
    // Add more sale items here...
  ];

  List<Map<String, String>> get _filteredAndSortedItems {
    // Filter
    List<Map<String, String>> filtered = saleItems.where((item) {
      if (_selectedFilter == 'All products') return true;
      return item['category'] == _selectedFilter;
    }).toList();

    // Sort
    if (_selectedSort == 'Price Low to High') {
      filtered.sort((a, b) {
        double priceA = _extractPrice(a['price']);
        double priceB = _extractPrice(b['price']);
        return priceA.compareTo(priceB);
      });
    } else if (_selectedSort == 'Price High to Low') {
      filtered.sort((a, b) {
        double priceA = _extractPrice(a['price']);
        double priceB = _extractPrice(b['price']);
        return priceB.compareTo(priceA);
      });
    }
    // "Best selling" does nothing (default order)
    return filtered;
  }

  double _extractPrice(String? priceStr) {
    if (priceStr == null) return double.infinity;
    final matches = RegExp(r'(\d+\.?\d*)').allMatches(priceStr);
    if (matches.isEmpty) return double.infinity;
    return double.tryParse(matches.last.group(0)!) ?? double.infinity;
  }

  List<Map<String, String>> get _pagedItems {
    final filtered = _filteredAndSortedItems;
    final start = (_currentPage - 1) * _itemsPerPage;
    final end = (_currentPage * _itemsPerPage).clamp(0, filtered.length);
    return filtered.sublist(start, end);
  }

  int get _totalPages => (_filteredAndSortedItems.length / _itemsPerPage).ceil();

  final ScrollController _scrollController = ScrollController();

  void _goToPage(int page) {
    setState(() {
      _currentPage = page;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'SALE',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Don’t miss out! Get yours before they’re all gone!\nAll prices shown are inclusive of the discount 🛒',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  // Responsive filter/sort row using Wrap
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Wrap(
                      spacing: 24,
                      runSpacing: 8,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('FILTER BY', style: TextStyle(fontSize: 12, color: Colors.grey)),
                            DropdownButton<String>(
                              value: _selectedFilter,
                              items: const [
                                DropdownMenuItem(value: 'All products', child: Text('All products')),
                                DropdownMenuItem(value: 'Clothing', child: Text('Clothing')),
                                DropdownMenuItem(value: 'Merchandise', child: Text('Merchandise')),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _selectedFilter = value!;
                                  _currentPage = 1;
                                });
                              },
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('SORT BY', style: TextStyle(fontSize: 12, color: Colors.grey)),
                            DropdownButton<String>(
                              value: _selectedSort,
                              items: const [
                                DropdownMenuItem(value: 'Best selling', child: Text('Best selling')),
                                DropdownMenuItem(value: 'Price Low to High', child: Text('Price Low to High')),
                                DropdownMenuItem(value: 'Price High to Low', child: Text('Price High to Low')),
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
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Text(
                            '${_filteredAndSortedItems.length} products',
                            style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Responsive grid of sale items
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _pagedItems.length,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 220,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.9,
                    ),
                    itemBuilder: (context, index) {
                      final item = _pagedItems[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ItemDetailPage(item: item),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Responsive image height using Expanded
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                                  child: item['imageUrl'] != null && item['imageUrl']!.isNotEmpty
                                      ? Image.asset(
                                          item['imageUrl']!,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          errorBuilder: (context, error, stackTrace) =>
                                              const Center(child: Icon(Icons.image_not_supported)),
                                        )
                                      : const Center(child: Icon(Icons.image)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['title'] ?? 'Product Title',
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      item['price'] ?? '',
                                      style: TextStyle(
                                        color: item['price']!.toLowerCase().contains('sold out')
                                            ? Colors.grey
                                            : Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  // Pagination controls
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
                  const SizedBox(height: 32),
                ],
              ),
            ),
            // Footer outside the Padding, so it stretches full width
            Footer(
              onEmailSubmitted: (email) {
                print('User subscribed with email: $email');
              },
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