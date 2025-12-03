import 'package:flutter/material.dart';
import 'package:union_shop/custom_app_bar.dart';
import 'package:union_shop/item_detail_page.dart';
import 'package:union_shop/footer.dart';

// Dummy cart state for demonstration
List<Map<String, dynamic>> cartItems = [];

// --- Merchandise items ---
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
      'title': 'UoP Teddy bear',
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
      'imageUrl': 'assets/images/m12.png',
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

  // ...existing code...

List<Map<String, String>> get _filteredMerchandiseItems {
  // Filter first
  List<Map<String, String>> filtered = _merchandiseItems;
  if (_selectedFilter != 'All Products') {
    filtered = filtered.where((item) {
      final title = item['title']!.toLowerCase();
      final filter = _selectedFilter.toLowerCase();
      if (filter == 'clothing') {
        return title.contains('hat') || title.contains('cap') || title.contains('bag') || title.contains('lanyard') || title.contains('shopper') || title.contains('poncho');
      } else if (filter == 'merchandise') {
        return !(title.contains('hat') || title.contains('cap') || title.contains('bag') || title.contains('lanyard') || title.contains('shopper') || title.contains('poncho'));
      } else if (filter == 'popular') {
        return title.contains('lanyard') || title.contains('notebook');
      } else if (filter == 'psut') {
        return title.contains('psut');
      }
      return true;
    }).toList();
  }
  // Sort
  final sorted = _sortMerchandiseItems(filtered);
  // Paginate
  final start = (_currentPage - 1) * 10;
  final end = (_currentPage * 10).clamp(0, sorted.length);
  return sorted.sublist(start, end);
}

// ...existing code...

  int get _totalPages => (_merchandiseItems.length / 10).ceil();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(parentContext: context),
      drawer: const AppDrawer(), // <-- Add this for the hamburger menu
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Page Title
            // ...inside your build method, replace the filter/sort Row and product count with:
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
// Product count below filter/sort bar
Padding(
  padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
  child: Align(
    alignment: Alignment.centerLeft,
    child: Text(
      '${_merchandiseItems.length} products',
      style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
    ),
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