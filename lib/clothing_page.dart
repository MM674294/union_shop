import 'package:flutter/material.dart';

class ClothingPage extends StatefulWidget {
  const ClothingPage({super.key});

  @override
  State<ClothingPage> createState() => _ClothingPageState();
}

class _ClothingPageState extends State<ClothingPage> {
  String _selectedFilter = 'All Products';
  String _selectedSort = 'Featured';

  // Simulated clothing items data with title, price, imageUrl, and date
  final List<Map<String, String>> _clothingItems = List.generate(
    20,
    (index) => {
      'title': 'Clothing Item ${index + 1}',
      'price': '£${(index + 1) * 5}.00',
      'imageUrl': 'https://via.placeholder.com/150?text=Item+${index + 1}',
      'date': DateTime(2024, 1, 1).add(Duration(days: index)).toIso8601String(),
    },
  );

  // Helper to parse price as double
  double _parsePrice(String price) {
    return double.tryParse(price.replaceAll('£', '').replaceAll('.00', '')) ?? 0.0;
  }

  // Helper to parse date
  DateTime _parseDate(String date) {
    return DateTime.tryParse(date) ?? DateTime(2000);
  }

  // Sorting logic
  List<Map<String, String>> _sortClothingItems(List<Map<String, String>> items) {
    List<Map<String, String>> sorted = List<Map<String, String>>.from(items);
    switch (_selectedSort) {
      case 'Featured':
        return sorted;
      case 'Best Selling':
        // Custom order: 1,2,9,10,11,12,3,4,5,6,7,8,15,16,17,18,19,20,13,14
        List<int> order = [
          0, 1, 8, 9, 10, 11, 2, 3, 4, 5, 6, 7, 14, 15, 16, 17, 18, 19, 12, 13
        ];
        return order.map((i) => sorted[i]).toList();
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

  // Filtered and sorted clothing items (always returns all 20 for this page)
  List<Map<String, String>> get _filteredClothingItems {
    return _sortClothingItems(_clothingItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        flexibleSpace: Column(
          children: [
            // Top banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8),
              color: const Color(0xFF4d2963),
              child: const Text(
                'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            // Navigation bar
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    // Logo
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                      },
                      child: Image.network(
                        'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                        height: 18,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            width: 18,
                            height: 18,
                            child: const Center(
                              child: Icon(Icons.image_not_supported, color: Colors.grey),
                            ),
                          );
                        },
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                      },
                      child: const Text(
                        'Home',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF4d2963),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/about');
                      },
                      child: const Text(
                        'About',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF4d2963),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/sale');
                      },
                      child: const Text(
                        'Sale',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF4d2963),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    DropdownButton<String>(
                      underline: Container(),
                      icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF4d2963)),
                      items: [
                        DropdownMenuItem(
                          value: '/clothing',
                          child: const Text('Clothing'),
                        ),
                        DropdownMenuItem(
                          value: '/page2',
                          child: const Text('Page 2'),
                        ),
                        DropdownMenuItem(
                          value: '/page3',
                          child: const Text('Page 3'),
                        ),
                        DropdownMenuItem(
                          value: '/page4',
                          child: const Text('Page 4'),
                        ),
                        DropdownMenuItem(
                          value: '/page5',
                          child: const Text('Page 5'),
                        ),
                        DropdownMenuItem(
                          value: '/page6',
                          child: const Text('Page 6'),
                        ),
                        DropdownMenuItem(
                          value: '/page7',
                          child: const Text('Page 7'),
                        ),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          Navigator.pushNamed(context, value);
                        }
                      },
                      hint: const Text(
                        'Show',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF4d2963),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Title Section
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
                    });
                  },
                ),
                const SizedBox(width: 16),
                Text(
                  '${_clothingItems.length} products',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Clothing Grid Section
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemCount: _filteredClothingItems.length,
              itemBuilder: (context, index) {
                final item = _filteredClothingItems[index];
                return Card(
                  elevation: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.network(
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
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}