import 'package:flutter/material.dart';
import 'package:union_shop/custom_app_bar.dart';
import 'package:union_shop/footer.dart';

class GraduationPage extends StatelessWidget {
  const GraduationPage({super.key});

  // Replace with your actual graduation product data and image paths
  static final List<Map<String, String>> graduationProducts = [
    {
      'title': 'Graduation Hoodies',
      'price': '£35.00',
      'imageUrl': 'assets/images/clothing5.png',
    },
    {
      'title': 'Graduation bears',
      'price': 'Sold out',
      'imageUrl': 'assets/images/m3.png',
    },
    {
      'title': 'Graduation 3/4 Zipped Sweatshirt',
      'price': '£45.00',
      'imageUrl': 'assets/images/clothing6.png',
    },
    // Add more graduation products and images as needed
  ];

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
              children: [
            // Hero image and title
            Stack(
              children: [
                Image.asset(
                  'assets/images/clothing5.png',
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 220,
                    color: Colors.grey[300],
                  ),
                ),
               const Positioned.fill(
                child: ColoredBox(
                  color: Color.fromRGBO(0, 0, 0, 0.3),
                   ),
                   ),
                const Positioned.fill(
                  child: Center(
                    child: Text(
                      'Graduation',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 8,
                            color: Colors.black54,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Filter and Sort Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('FILTER BY', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        DropdownButton<String>(
                          value: 'All products',
                          items: const [
                            DropdownMenuItem(value: 'All products', child: Text('All products')),
                          ],
                          onChanged: (_) {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('SORT BY', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        DropdownButton<String>(
                          value: 'Featured',
                          items: const [
                            DropdownMenuItem(value: 'Featured', child: Text('Featured')),
                          ],
                          onChanged: (_) {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Product count
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${graduationProducts.length} products',
                  style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                ),
              ),
            ),
            // Products grid
            Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: graduationProducts.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 220,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final item = graduationProducts[index];
                  return Card(
                    elevation: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Image.asset(
                            item['imageUrl']!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            errorBuilder: (context, error, stackTrace) => Container(
                              color: Colors.grey[300],
                              child: const Center(
                                child: Icon(Icons.image_not_supported, color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item['title']!,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            item['price']!,
                            style: const TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
            // Footer
            Footer(
              onEmailSubmitted: (email) {
                debugPrint('User subscribed with email: $email');
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