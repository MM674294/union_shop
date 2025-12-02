import 'package:flutter/material.dart';
import 'package:union_shop/custom_app_bar.dart';
import 'package:union_shop/footer.dart';

class PersonalisationPage extends StatelessWidget {
  const PersonalisationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(parentContext: context),
      drawer: const AppDrawer(), // <-- Add this for the hamburger menu
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 32),
              const Text(
                'Personalisation Service',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Customize your products with our exclusive personalisation service!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 32),
              // Add more content here as needed
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