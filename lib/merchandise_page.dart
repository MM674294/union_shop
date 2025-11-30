import 'package:flutter/material.dart';

class MerchandisePage extends StatefulWidget {
  const MerchandisePage({super.key});

  @override
  State<MerchandisePage> createState() => _MerchandisePageState();
}

class _MerchandisePageState extends State<MerchandisePage> {
  String _selectedFilter = 'All Products';
  String _selectedSort = 'Featured';
  int _currentPage = 1;

  final List<Map<String, String>> _merchandiseItems = List.generate(
    20,
    (index) => {
      'title': 'Merchandise Item ${index + 1}',
      'price': '£${(index + 1) * 5}.00',
      'imageUrl': 'assets/images/merch${index + 1}.png',
      'date': DateTime(2024, 2, 1).add(Duration(days: index)).toIso8601String(),
    },
  );

  double _parsePrice(String price) =>
      double.tryParse(price.replaceAll('£', '').replaceAll('.00', '')) ?? 0.0;
  DateTime _parseDate(String date) =>
      DateTime.tryParse(date) ?? DateTime(2000);

  List<Map<String, String>> _sortMerchandiseItems(List<Map<String, String>> items) {
    List<Map<String, String>> sorted = List<Map<String, String>>.from(items);
    switch (_selectedSort) {
      case 'Featured':
        return sorted;
      case 'Best Selling':
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

  List<Map<String, String>> get _filteredMerchandiseItems {
    final sorted = _sortMerchandiseItems(_merchandiseItems);
    final start = (_currentPage - 1) * 10;
    final end = (_currentPage * 10).clamp(0, sorted.length);
    return sorted.sublist(start, end);
  }

  int get _totalPages => (_merchandiseItems.length / 10).ceil();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section (same as HomeScreen)
            Container(
              height: 100,
              color: Colors.white,
              child: Column(
                children: [
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
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
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
                                value: '/merchandise',
                                child: const Text('Merchandise'),
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
                              'Shop',
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
            // Title Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: Colors.grey[200],
              child: const Text(
                'Merchandise',
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
                  const SizedBox(width: 16),
                  Text(
                    '${_merchandiseItems.length} products',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            // Merchandise Grid Section
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
                itemCount: _filteredMerchandiseItems.length,
                itemBuilder: (context, index) {
                  final item = _filteredMerchandiseItems[index];
                  return Card(
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
                      ],
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
                      ? () {
                          setState(() {
                            _currentPage--;
                          });
                        }
                      : null,
                  child: const Text('Previous'),
                ),
                Text('Page $_currentPage of $_totalPages'),
                TextButton(
                  onPressed: _currentPage < _totalPages
                      ? () {
                          setState(() {
                            _currentPage++;
                          });
                        }
                      : null,
                  child: const Text('Next'),
                ),
              ],
            ),
            // Footer Section (copied from sale/about page)
            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          children: const [
                            Text(
                              'Opening Hours',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '❄️ Winter Break Closure Dates ❄️\nClosing 4pm 19/12/2025\nReopening 9am 06/01/2026',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '---------------------------------',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '(Term Time)\nMonday - Friday 10am - 4pm\n(Outside of Term Time / Consolidation Weeks)\nMonday - Friday 10am - 3pm\nPurchase online 24/7',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Flexible(
                        child: Column(
                          children: const [
                            Text(
                              'Help and Information',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Search\nTerms & Conditions of Sale Policy',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Flexible(
                        child: Column(
                          children: [
                            const Text(
                              'Latest Offers',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email Address',
                                hintText: 'Enter your email',
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextButton(
                              onPressed: null, // Replace with your logic if needed
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xFF4d2963),
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('Subscribe'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}