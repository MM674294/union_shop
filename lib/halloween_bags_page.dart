import 'package:flutter/material.dart';
import 'package:union_shop/custom_app_bar.dart';

import 'package:union_shop/footer.dart';

class HalloweenBagsPage extends StatefulWidget {
  const HalloweenBagsPage({super.key});

  @override
  State<HalloweenBagsPage> createState() => _HalloweenBagsPageState();
}


class _HalloweenBagsPageState extends State<HalloweenBagsPage> {
  String _mainImage = 'assets/images/halloween2.png';
  String _selectedDesign = 'Boo!';
  int _quantity = 1;
  String _getImageForDesign(String design) {
    switch (design) {
      case 'Boo!':
        return 'assets/images/halloween2.png';
      case 'Pumpkin':
        return 'assets/images/halloween1.png';
      case 'Bat':
        return 'assets/images/halloween3.png';
      default:
        return 'assets/images/halloween2.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
     return Column(
      children: [
        // Banner at the top
        CustomAppBar.getBanner(),
        // Scaffold with navigation bar and body
        Expanded(
          child: Scaffold(
            appBar: CustomAppBar(parentContext: context),
            drawer: const AppDrawer(),
            body: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                // ...existing code...
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Flex(
                    direction: isMobile ? Axis.vertical : Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left: Main image and thumbnails
                      Expanded(
                        flex: isMobile ? 0 : 1,
                        child: Column(
                          children: [
                            AspectRatio(
                              aspectRatio: 1,
                              child: Image.asset(
                                _mainImage,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => Container(
                                  color: Colors.grey[300],
                                  child: const Center(
                                    child: Icon(Icons.image_not_supported, size: 48, color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () => setState(() {
                                    _selectedDesign = 'Boo!';
                                    _mainImage = _getImageForDesign(_selectedDesign);
                                  }),
                                  child: Image.asset(
                                    'assets/images/halloween2.png',
                                    width: 40,
                                    height: 40,
                                    fit: BoxFit.cover,
                                    errorBuilder: (c, e, s) => const Icon(Icons.image_not_supported),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                GestureDetector(
                                  onTap: () => setState(() {
                                    _selectedDesign = 'Pumpkin';
                                    _mainImage = _getImageForDesign(_selectedDesign);
                                  }),
                                  child: Image.asset(
                                    'assets/images/halloween1.png',
                                    width: 40,
                                    height: 40,
                                    fit: BoxFit.cover,
                                    errorBuilder: (c, e, s) => const Icon(Icons.image_not_supported),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                GestureDetector(
                                  onTap: () => setState(() {
                                    _selectedDesign = 'Bat';
                                    _mainImage = _getImageForDesign(_selectedDesign);
                                  }),
                                  child: Image.asset(
                                    'assets/images/halloween3.png',
                                    width: 40,
                                    height: 40,
                                    fit: BoxFit.cover,
                                    errorBuilder: (c, e, s) => const Icon(Icons.image_not_supported),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      if (!isMobile) const SizedBox(width: 32),
                      // Right: Details
                      Expanded(
                        flex: isMobile ? 0 : 1,
                        child: Padding(
                          padding: EdgeInsets.only(top: isMobile ? 24 : 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Halloween Tote Bags',
                                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                '£2.50',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 16),
                              DropdownButton<String>(
                                value: _selectedDesign,
                                items: const [
                                  DropdownMenuItem(value: 'Boo!', child: Text('Boo!')),
                                  DropdownMenuItem(value: 'Pumpkin', child: Text('Pumpkin')),
                                  DropdownMenuItem(value: 'Bat', child: Text('Bat')),
                                ],
                                onChanged: (val) {
                                  if (val != null) {
                                    setState(() {
                                      _selectedDesign = val;
                                      _mainImage = _getImageForDesign(val);
                                    });
                                  }
                                },
                              ),
                              // ...rest of your code...
                              const SizedBox(height: 8),
                             Row(
                              children: [
                                const Text('Quantity'),
                                const SizedBox(width: 8),
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: _quantity > 1
                                  ? () => setState(() => _quantity--): null,
                                  ),
                                  Text('$_quantity', style: const TextStyle(fontSize: 16)),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () => setState(() => _quantity++),
                                    ),
                                    ],
                                    ),
                              const SizedBox(height: 16),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      cartItems.add({
                                        'title': 'Halloween Tote Bag - $_selectedDesign',
                                        'price': '£2.50',
                                        'image': _mainImage,
                                        'details': 'Design: $_selectedDesign',
                                        });
                                        });
                                        ScaffoldMessenger.of(context).showSnackBar(
                                           const SnackBar(content: Text('Added to cart!')),
                                           );
                                           },
                                  child: const Text('ADD TO CART'),
                                ),
                              ),
                              const SizedBox(height: 24),
                              const Text(
                                'Trick or treat yourself to one of these limited edition Halloween tote bags!\n\n'
                                'Available to purchase in store & online for just £2.50!!!\n\n'
                                'Be quick ... before they do a disappearing act ...\n\n'
                                'Due to the hand crafted nature of this item, final product may differ slightly from original design.\n\n'
                                'Designs will be printed after purchase and be available up to two working days later.',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                // Responsive full-width footer
                Footer(
                  onEmailSubmitted: (email) {
                    debugPrint('User subscribed with email: $email');
                  },
                ),
              ],
            ),
                );
              },
            ),
          ),
        ),
      ],
      );
  }
}
                