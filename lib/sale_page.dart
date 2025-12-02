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

  // Write your sale items like this:
  final List<Map<String, String>> saleItems = [
    {
      'title': 'A5 Notepad',
      'price': 'Sold out',
      'imageUrl': 'assets/images/m12.png',
      'date': DateTime(2024, 4, 1).toIso8601String(),
    },
    {
      'title': 'Classic Sweatshirts - Neutral',
      'price': '£17.00 £10.99',
      'imageUrl': 'assets/images/clothing4.png',
      'date': DateTime(2024, 4, 2).toIso8601String(),
    },
    {
      'title': 'waterproof Poncho',
      'price': '£1.99',
      'imageUrl': 'assets/images/clothing14.png',
      'date': DateTime(2024, 5, 9).toIso8601String(),
    },
    // Add more sale items here...
  ];

  List<Map<String, String>> get _pagedItems {
    final start = (_currentPage - 1) * _itemsPerPage;
    final end = (_currentPage * _itemsPerPage).clamp(0, saleItems.length);
    return saleItems.sublist(start, end);
  }

  int get _totalPages => (saleItems.length / _itemsPerPage).ceil();

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
    return Scaffold(
      appBar: CustomAppBar(parentContext: context),
      drawer: const AppDrawer(), // <-- Add this for the hamburger menu
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // SALE text and description
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
              // Filter and Sort Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                ],
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${saleItems.length} products',
                  style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),
              // Grid of sale items
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _pagedItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: 1,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image placeholder
                        AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: item['imageUrl'] != null && item['imageUrl']!.isNotEmpty
                                ? Image.asset(
                                    item['imageUrl']!,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) =>
                                        const Center(child: Icon(Icons.image_not_supported)),
                                  )
                                : const Center(child: Icon(Icons.image)),
                          ),
                        ),
                        const SizedBox(height: 8),
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
              Footer(
                onEmailSubmitted: (email) {
                  print('User subscribed with email: $email');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}