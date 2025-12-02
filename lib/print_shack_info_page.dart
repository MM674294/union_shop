import 'package:flutter/material.dart';
import 'package:union_shop/custom_app_bar.dart';
import 'package:union_shop/footer.dart';

class PrintShackInfoPage extends StatelessWidget {
  const PrintShackInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(parentContext: context),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'The Union Print Shack',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF222222),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
            // Image row (replace with your own images)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        color: Colors.grey[300],
                        child: Image.asset(
                          'assets/images/printshack1.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        color: Colors.grey[300],
                        child: Image.asset(
                          'assets/images/printshack2.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        color: Colors.grey[300],
                        child: Image.asset(
                          'assets/images/printshack3.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Content
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text(
                    'Make It Yours at The Union Print Shack',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Want to add a personal touch? We’ve got you covered with heat-pressed customisation on all our clothing. Swing by the shop - our team’s always happy to help you pick the right gear and answer any questions.",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Uni Gear or Your Gear – We’ll Personalise It',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Whether you’re repping your university or putting your own spin on a hoodie you already own, we’ve got you covered. We can personalise official uni-branded clothing and your own items – just bring them in and let’s get creative!",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Simple Pricing, No Surprises',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Customising your gear won’t break the bank – just £3 for one line of text or a small chest logo, and £5 for two lines or a large back logo. Turnaround time is up to three working days, and we’ll let you know as soon as it’s ready to collect.",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Personalisation Terms & Conditions',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "We will print your clothing exactly as you have provided it to us, whether online or in person. We are not responsible for any spelling errors. Please ensure your chosen text is clearly displayed in either capitals or lowercase. Refunds are not provided for any personalised items.",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Ready to Make It Yours?',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Pop in or get in touch today – let’s create something uniquely you with our personalisation service – The Union Print Shack!",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
            // Footer (full width, not static)
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