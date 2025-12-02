import 'package:flutter/material.dart';
import 'custom_app_bar.dart';

class Footer extends StatefulWidget {
  final void Function(String email)? onEmailSubmitted;
  const Footer({super.key, this.onEmailSubmitted});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  final TextEditingController _emailController = TextEditingController();

  void _submitEmail() {
    final email = _emailController.text.trim();
    if (email.isNotEmpty) {
      widget.onEmailSubmitted?.call(email);
      _emailController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Thank you for subscribing!')),
      );
    }
  }

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
              const SizedBox(width: 16),
              // Help and Information column
              Flexible(
                child: Column(
                  children: [
                    const Text(
                      'Help and Information',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        showSearch<Map<String, String>?>(
                          context: context,
                          delegate: AllProductsSearchDelegate(allProducts),
                        );
                      },
                      child: const Text(
                        'Search',
                        style: TextStyle(
                          color: Color(0xFF4d2963),
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Terms & Conditions of Sale Policy',
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
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email Address',
                        hintText: 'Enter your email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: _submitEmail,
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