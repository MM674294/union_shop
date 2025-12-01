import 'package:flutter/material.dart';

// Dummy cart state for demonstration
List<Map<String, dynamic>> cartItems = [];

// --- Clothing items for search only ---
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

class MerchandisePage extends StatefulWidget {
  const MerchandisePage({super.key});

  @override
  State<MerchandisePage> createState() => _MerchandisePageState();
}

class _MerchandisePageState extends State<MerchandisePage> {
  String _selectedFilter = 'All Products';
  String _selectedSort = 'Featured';
  int _currentPage = 1;

  final List<Map<String, String>> _merchandiseItems = [
    // ... your 29 merchandise items here (as in your file) ...
    {
      'title': 'ID Holder',
      'price': '£0.75',
      'imageUrl': 'assets/images/m1.png',
      'date': DateTime(2024, 2, 1).toIso8601String(),
    },
    {
      'title': 'Lanyards',
      'price': '£2.75',
      'imageUrl': 'assets/images/m2.png',
      'date': DateTime(2024, 2, 2).toIso8601String(),
    },
    {
      'title': 'Graduation bears',
      'price': 'sold out',
      'imageUrl': 'assets/images/m3.png',
      'date': DateTime(2024, 3, 5).toIso8601String(),
    },
    {
      'title': 'UoP cotton shopper',
      'price': '£1.99',
      'imageUrl': 'assets/images/m4.png',
      'date': DateTime(2024, 2, 12).toIso8601String(),
    },
    {
      'title': 'Pen',
      'price': '£1.00',
      'imageUrl': 'assets/images/m5.png',
      'date': DateTime(2024, 2, 16).toIso8601String(),
    },
    {
      'title': 'limited edition Lanyard',
      'price': '£2.75',
      'imageUrl': 'assets/images/m6.png',
      'date': DateTime(2024, 2, 23).toIso8601String(),
    },
    {
      'title': 'Lapel Pin',
      'price': '£4.00',
      'imageUrl': 'assets/images/m7.png',
      'date': DateTime(2024, 3, 1).toIso8601String(),
    },
    {
      'title': 'Crested Tie',
      'price': '£̶1̶5̶.̶0̶0̶  £10.99',
      'imageUrl': 'assets/images/m8.png',
      'date': DateTime(2024, 3, 3).toIso8601String(),
    },
    {
      'title': 'Crested bag',
      'price': '£̶7̶.̶0̶0̶  £4.99',
      'imageUrl': 'assets/images/m9.png',
      'date': DateTime(2024, 3, 10).toIso8601String(),
    },
    {
      'title': 'Keep Cups',
      'price': '£6.50',
      'imageUrl': 'assets/images/m10.png',
      'date': DateTime(2024, 3, 15).toIso8601String(),
    },
    {
      'title': 'classic beanie hat',
      'price': '£6.50',
      'imageUrl': 'assets/images/clothing17.png',
      'date': DateTime(2024, 3, 28).toIso8601String(),
    },
    {
      'title': '8GB USBs',
      'price': '£̶7̶.̶5̶0̶  £5.50',
      'imageUrl': 'assets/images/m11.png',
      'date': DateTime(2024, 3, 24).toIso8601String(),
    },
    {
      'title': 'A5 Notepad',
      'price': 'Sold out',
      'imageUrl': 'assets/images/m12.png',
      'date': DateTime(2024, 4, 1).toIso8601String(),
    },
    {
      'title': 'Classic Cap',
      'price': '£12.00',
      'imageUrl': 'assets/images/clothing7.png',
      'date': DateTime(2024, 4, 3).toIso8601String(),
    },
    {
      'title': 'Crested Notebook',
      'price': '£ ̶1̶0̶.̶5̶0̶  £7.99',
      'imageUrl': 'assets/images/m13.png',
      'date': DateTime(2024, 4, 14).toIso8601String(),
    },
    {
      'title': 'Recycled Notebook',
      'price': '£1.80',
      'imageUrl': 'assets/images/m14.png',
      'date': DateTime(2024, 4, 16).toIso8601String(),
    },
    {
      'title': 'UoP Teddie bear',
      'price': 'Sold out',
      'imageUrl': 'assets/images/m15.png',
      'date': DateTime(2024, 4, 20).toIso8601String(),
    },
    {
      'title': 'Portsmouth City Postcard',
      'price': '£1.00',
      'imageUrl': 'assets/images/m16.png',
      'date': DateTime(2024, 4, 21).toIso8601String(),
    },
    {
      'title': 'Portsmouth City Magnet',
      'price': '£4.50',
      'imageUrl': 'assets/images/m17.png',
      'date': DateTime(2024, 4, 21).toIso8601String(),
    },
    {
      'title': 'Portsmouth City Bookmark',
      'price': '£3.00',
      'imageUrl': 'assets/images/m18.png',
      'date': DateTime(2024, 4, 27).toIso8601String(),
    },
    {
      'title': 'Type C charge and Synce Cable',
      'price': '£̶3̶.̶0̶0̶  £1.50',
      'imageUrl': 'assets/images/m19.png',
      'date': DateTime(2024, 4, 27).toIso8601String(),
    },
    {
      'title': 'USB to USB charge and Synce Cables',
      'price': '£̶3̶.̶0̶0̶  £1.50',
      'imageUrl': 'assets/images/m20.png',
      'date': DateTime(2024, 4, 29).toIso8601String(),
    },
    {
      'title': 'Limited edition bracelet',
      'price': '£̶1.̶0̶0̶  £0.50',
      'imageUrl': 'assets/images/m21.png',
      'date': DateTime(2024, 5, 2).toIso8601String(),
    },
    {
      'title': 'waterproof Poncho',
      'price': '£1.99',
      'imageUrl': 'assets/images/clothing14.png',
      'date': DateTime(2024, 5, 9).toIso8601String(),
    },
    {
      'title': 'Portsmouth City Notebook',
      'price': '£7.50',
      'imageUrl': 'assets/images/m23.png',
      'date': DateTime(2024, 5, 9).toIso8601String(),
    },
    {
      'title': 'Portsmouth City Keyring',
      'price': '£6.75',
      'imageUrl': 'assets/images/m24.png',
      'date': DateTime(2024, 5, 11).toIso8601String(),
    },
    {
      'title': 'Portsmouth City Coaster',
      'price': '£4.50',
      'imageUrl': 'assets/images/m25.png',
      'date': DateTime(2024, 5, 12).toIso8601String(),
    },
    {
      'title': 'Portsmouth City water bottle',
      'price': '£2.50',
      'imageUrl': 'assets/images/m26.png',
      'date': DateTime(2024, 5, 15).toIso8601String(),
    },
    {
      'title': 'Halloween Tote Bag',
      'price': '£2.50',
      'imageUrl': 'assets/images/m27.png',
      'date': DateTime(2024, 5, 15).toIso8601String(),
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

  List<Map<String, String>> _sortMerchandiseItems(List<Map<String, String>> items) {
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

  List<Map<String, String>> get _filteredMerchandiseItems {
    final sorted = _sortMerchandiseItems(_merchandiseItems);
    final start = (_currentPage - 1) * 10;
    final end = (_currentPage * 10).clamp(0, sorted.length);
    return sorted.sublist(start, end);
  }

  int get _totalPages => (_merchandiseItems.length / 10).ceil();

  void _showSearch(BuildContext context) async {
    // Combine merchandise and clothing items for search only
    final allItems = [..._merchandiseItems, ..._clothingItems];
    final result = await showSearch<Map<String, String>?>(
      context: context,
      delegate: MerchandiseSearchDelegate(allItems),
    );
    if (result != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ItemDetailPage(item: result),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        title: Row(
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
            const SizedBox(width: 12),
            DropdownButton<String>(
              underline: Container(),
              icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF4d2963)),
              isDense: true,
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
              hint: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'Shop',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF4d2963),
                    ),
                  ),
                  SizedBox(width: 2),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.search, size: 18, color: Colors.grey),
                  onPressed: () => _showSearch(context),
                ),
                IconButton(
                  icon: const Icon(Icons.person_outline, size: 18, color: Colors.grey),
                  onPressed: () {
                    // TODO: Navigate to profile page
                  },
                ),
                Stack(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.shopping_bag_outlined, size: 18, color: Colors.grey),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const CartPage()),
                        );
                      },
                    ),
                    if (cartItems.isNotEmpty)
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '${cartItems.length}',
                            style: const TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Sale Banner
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
          // Page Title
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
          // Main content and footer in Expanded + SingleChildScrollView
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
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
                  // Footer Section (moves with scroll)
                  _Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- Search Delegate ---
class MerchandiseSearchDelegate extends SearchDelegate<Map<String, String>?> {
  final List<Map<String, String>> items;
  MerchandiseSearchDelegate(this.items);

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => query = '',
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) {
    final results = items
        .where((item) => item['title']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView(
      children: [
        if (results.isEmpty)
          const Padding(
            padding: EdgeInsets.all(32.0),
            child: Center(child: Text('No results found.')),
          )
        else
          ...results.map((item) => ListTile(
                leading: Image.asset(item['imageUrl']!, width: 40, height: 40, fit: BoxFit.cover),
                title: Text(item['title']!),
                subtitle: Text(item['price']!),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ItemDetailPage(item: item),
                    ),
                  );
                },
              )),
        _Footer(),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = items
        .where((item) => item['title']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView(
      children: [
        ...suggestions.map((item) => ListTile(
              leading: Image.asset(item['imageUrl']!, width: 40, height: 40, fit: BoxFit.cover),
              title: Text(item['title']!),
              subtitle: Text(item['price']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ItemDetailPage(item: item),
                  ),
                );
              },
            )),
        _Footer(),
      ],
    );
  }
}

// --- Item Detail Page ---
class ItemDetailPage extends StatefulWidget {
  final Map<String, String> item;
  const ItemDetailPage({super.key, required this.item});

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item['title'] ?? ''),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF4d2963),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              widget.item['imageUrl']!,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  height: 200,
                  child: const Center(
                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Text(
              widget.item['title']!,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              widget.item['price']!,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('Quantity:'),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: quantity > 1
                      ? () => setState(() => quantity--)
                      : null,
                ),
                Text('$quantity'),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => setState(() => quantity++),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text('Add to Cart'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4d2963),
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                cartItems.add({
                  ...widget.item,
                  'quantity': quantity.toString(),
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Added to cart!')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// --- Footer Widget ---
class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              SizedBox(width: 16),
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
              SizedBox(width: 16),
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
    );
  }
}

// --- Cart Page (improved) ---
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  double _getTotal() {
    double total = 0.0;
    for (var item in cartItems) {
      final priceString = item['price'] as String;
      final matches = RegExp(r'£([\d.]+)').allMatches(priceString);
      if (matches.isNotEmpty) {
        final price = double.tryParse(matches.last.group(1)!) ?? 0.0;
        final qty = int.tryParse(item['quantity']?.toString() ?? '1') ?? 1;
        total += price * qty;
      }
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF4d2963),
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text('Your cart is empty.'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return ListTile(
                        leading: Image.asset(item['imageUrl']!, width: 40, height: 40, fit: BoxFit.cover),
                        title: Text(item['title']!),
                        subtitle: Text('Qty: ${item['quantity'] ?? 1}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(item['price']!),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _removeItem(index),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '£${_getTotal().toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4d2963),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Checkout not implemented.')),
                        );
                      },
                      child: const Text('Checkout'),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
    );
  }
}