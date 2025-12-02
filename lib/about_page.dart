import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:union_shop/personalisation_page.dart';
import 'package:union_shop/custom_app_bar.dart';
import 'package:union_shop/footer.dart';

class AboutPage extends StatefulWidget {
  final void Function(String email)? onEmailSubmitted;

  const AboutPage({super.key, this.onEmailSubmitted});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(parentContext: context),
      drawer: const AppDrawer(), // <-- Add this for the hamburger menu
      body: Column(
        children: [
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
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
          Footer(
            onEmailSubmitted: (email) {
              print('User subscribed with email: $email');
            },
          ),
        ],
      ),
    );
  }
}