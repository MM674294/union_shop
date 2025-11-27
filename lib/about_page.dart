import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:union_shop/personalisation_page.dart'; // Import the PersonalisationPage

class AboutPage extends StatefulWidget {
  final void Function(String email)? onEmailSubmitted;

  const AboutPage({super.key, this.onEmailSubmitted});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final TextEditingController _emailController = TextEditingController();

  void _submitEmail() {
    final email = _emailController.text.trim();
    print('Submitting email: $email'); // Debug print
    if (email.isNotEmpty) {
      widget.onEmailSubmitted?.call(email); // Trigger the callback if provided
      _emailController.clear(); // Clear the TextField after submission
      print('Email cleared'); // Debug print
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 100,
        automaticallyImplyLeading: false, // Removes the back arrow
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

                    // Home Button
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
                    const SizedBox(width: 16), // Space between buttons

                    // About Button
                    TextButton(
                      onPressed: () {
                        // Stay on the About page (no navigation needed)
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
                    const SizedBox(width: 16), // Space between buttons

                    // Sale Button
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/sale'); // Navigate to the Sale page
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
                    const Spacer(),

                    // Icons Section
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 600),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.search,
                              size: 18,
                              color: Colors.grey,
                            ),
                            padding: const EdgeInsets.all(8),
                            constraints: const BoxConstraints(
                              minWidth: 32,
                              minHeight: 32,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.person_outline,
                              size: 18,
                              color: Colors.grey,
                            ),
                            padding: const EdgeInsets.all(8),
                            constraints: const BoxConstraints(
                              minWidth: 32,
                              minHeight: 32,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.shopping_bag_outlined,
                              size: 18,
                              color: Colors.grey,
                            ),
                            padding: const EdgeInsets.all(8),
                            constraints: const BoxConstraints(
                              minWidth: 32,
                              minHeight: 32,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.menu,
                              size: 18,
                              color: Colors.grey,
                            ),
                            padding: const EdgeInsets.all(8),
                            constraints: const BoxConstraints(
                              minWidth: 32,
                              minHeight: 32,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Main Content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Header Section
                    const Text(
                      'About us',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Welcome to the Union Shop!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text:
                            'We’re dedicated to giving you the very best University branded products, '
                            'with a range of clothing and merchandise available to shop all year round! '
                            'We even offer an exclusive ',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'personalisation service',
                            style: const TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const PersonalisationPage(),
                                  ),
                                );
                              },
                          ),
                          const TextSpan(
                            text: '!',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'All online purchases are available for delivery or instore collection!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Footer Section
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Column 1: Opening Hours
                    const Flexible(
                      child: Column(
                        children: [
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
                    const SizedBox(width: 16), // Space between columns

                    // Column 2: Help and Information
                    const Flexible(
                      child: Column(
                        children: [
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
                    const SizedBox(width: 16), // Space between columns

                    // Column 3: Latest Offers
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
                          TextField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email Address',
                              hintText: 'Enter your email',
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextButton(
                            onPressed: _submitEmail,
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0xFF4d2963),
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
    );
  }
}